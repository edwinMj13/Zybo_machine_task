part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class FetchWishlistEvent extends WishlistEvent{

}


class WishlistAddRemEvent extends WishlistEvent{
  final int id;
  final BuildContext context;

  WishlistAddRemEvent( {required this.id,required this.context});
}