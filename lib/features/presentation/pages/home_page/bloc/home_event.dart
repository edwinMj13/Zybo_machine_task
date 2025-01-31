part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeLoadEvent extends HomeEvent{

}

class HomeAddRemWishListEvent extends HomeEvent{
  final int id;
  final BuildContext context;

  HomeAddRemWishListEvent( {required this.id,required this.context});
}