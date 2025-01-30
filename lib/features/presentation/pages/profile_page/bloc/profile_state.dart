part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileFetchSuccessState extends ProfileState{
  final ProfileModel userProfile;

  ProfileFetchSuccessState({required this.userProfile});
}

class ProfileFetchErrorState extends ProfileState{}