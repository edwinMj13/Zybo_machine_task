part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeDataSuccessState extends HomeState {
  final List<BannerModel> bannerList;
  final List<ProductModel> productList;

  HomeDataSuccessState({required this.bannerList,required this.productList});
}

class HomeAddRemWishlistState extends HomeState{
  final String tag;

  HomeAddRemWishlistState({required this.tag});
}

class HomeFetchErrorState extends HomeState{}