import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zybo_task/features/data/models/banner_model.dart';
import 'package:zybo_task/features/data/models/error_model.dart';
import 'package:zybo_task/features/data/models/product_model.dart';
import 'package:zybo_task/features/data/models/profile_model.dart';
import 'package:zybo_task/features/data/models/wishlist_add_rem_model.dart';
import 'package:zybo_task/features/data/services/home_services.dart';
import 'package:zybo_task/features/data/services/wishlist_services.dart';
import 'package:zybo_task/features/presentation/pages/wishlist_page/bloc/wishlist_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeLoadEvent>(homeLoadEvent);
    on<HomeAddRemWishListEvent>(homeAddRemWishListEvent);
  }
HomeServices homeServices = HomeServices();
WishlistServices wishlistServices = WishlistServices();
  Future<void> homeLoadEvent(HomeLoadEvent event, Emitter<HomeState> emit) async {
    final bannerData = await homeServices.getBannerList();
    final productData = await homeServices.getProductsList();
    final bannerList =  bannerData.fold((fnL)=>fnL, (fnR)=>fnR);
    final productList = productData.fold((fnL)=>fnL, (fnR)=>fnR);
    if(bannerList is List<BannerModel> && productList is List<ProductModel>){
      emit(HomeDataSuccessState(bannerList: bannerList,productList: productList));
    }else{
      emit(HomeFetchErrorState());
      print("Banner Data $bannerList");
      print("Banner Data $productList");
    }
  }

  Future<void> homeAddRemWishListEvent(HomeAddRemWishListEvent event, Emitter<HomeState> emit) async {
    final wishData = await wishlistServices.addRemWishlist(event.id);
    final wishlistTag = wishData.fold((fnL)=>fnL, (fnR)=>fnR);
    if(wishlistTag is WishlistAddRemModel){
        if(event.context.mounted){
          event.context.read<HomeBloc>().add(HomeLoadEvent());
        }
    }else if(wishlistTag is ErrorModel){
      print(wishlistTag.messsage);
    }
  }
}
