import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zybo_task/features/data/models/product_model.dart';
import 'package:zybo_task/features/data/services/wishlist_services.dart';

import '../../../../data/models/error_model.dart';
import '../../../../data/models/wishlist_add_rem_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<FetchWishlistEvent>(fetchWishlistEvent);
    on<WishlistAddRemEvent>(wishlistAddRemEvent);
  }
  WishlistServices wishlistServices = WishlistServices();
  Future<void> fetchWishlistEvent(FetchWishlistEvent event, Emitter<WishlistState> emit) async {
    final wishlistData = await wishlistServices.getWishlist();
    final wishlist = wishlistData.fold((fnL)=>fnL, (fnR)=>fnR);
    print("fetchWishlistEvent $wishlist");
    if(wishlist is List<ProductModel>){
      if(wishlist.isNotEmpty){
      emit(WishlistFetchSuccessState(productList: wishlist));
      }else{
        emit(WishlistFetchEmptyState());
      }
    }else{
      emit(WishlistFetchErrorState());
    }
  }

  Future<void> wishlistAddRemEvent(WishlistAddRemEvent event, Emitter<WishlistState> emit) async {
    final wishData = await wishlistServices.addRemWishlist(event.id);
    final wishlistTag = wishData.fold((fnL)=>fnL, (fnR)=>fnR);
    print(wishlistTag);
    if(wishlistTag is WishlistAddRemModel){
      if(event.context.mounted){
        event.context.read<WishlistBloc>().add(FetchWishlistEvent());
      }
    }else if(wishlistTag is ErrorModel){
      print(wishlistTag.messsage);
    }
  }
}
