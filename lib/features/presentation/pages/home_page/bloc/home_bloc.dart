import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zybo_task/features/data/models/banner_model.dart';
import 'package:zybo_task/features/data/models/product_model.dart';
import 'package:zybo_task/features/data/models/profile_model.dart';
import 'package:zybo_task/features/data/services/home_services.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeLoadEvent>(homeLoadEvent);
  }
HomeServices homeServices = HomeServices();
  Future<void> homeLoadEvent(HomeLoadEvent event, Emitter<HomeState> emit) async {
    final bannerData = await homeServices.getBannerList();
    final productData = await homeServices.getProductsList();
    final bannerList =  bannerData.fold((fnL)=>fnL, (fnR)=>fnR);
    final productList = productData.fold((fnL)=>fnL, (fnR)=>fnR);
    if(bannerList is List<BannerModel> && productList is List<ProductModel>){
      emit(HomeDataSuccessState(bannerList: bannerList,productList: productList));
    }else{
      print("Banner Data $bannerList");
      print("Banner Data $productList");
    }
  }
}
