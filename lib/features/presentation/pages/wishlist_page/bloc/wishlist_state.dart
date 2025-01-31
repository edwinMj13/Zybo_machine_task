part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

class WishlistFetchSuccessState extends WishlistState{
  final List<ProductModel> productList;

  WishlistFetchSuccessState({required this.productList});

}
class WishlistFetchEmptyState extends WishlistState{
}
class WishlistFetchErrorState extends WishlistState{
}