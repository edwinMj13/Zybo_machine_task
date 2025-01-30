import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zybo_task/features/data/models/error_model.dart';
import 'package:zybo_task/features/data/models/product_model.dart';
import 'package:zybo_task/features/data/models/profile_model.dart';
import 'package:zybo_task/features/data/services/profile_services.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileFetchEvent>(profileFetchEvent);
  }
ProfileServices profileServices = ProfileServices();
  FutureOr<void> profileFetchEvent(ProfileFetchEvent event, Emitter<ProfileState> emit) async{
    final userData = await profileServices.getProfileDetails();
    final profileData = userData.fold((fnL)=>fnL, (fnR)=>fnR);
    if(profileData is ProfileModel){
      emit(ProfileFetchSuccessState(userProfile: profileData));
    }else{
      emit(ProfileFetchErrorState());
    }
  }
}
