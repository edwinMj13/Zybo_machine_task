import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:zybo_task/features/data/local_data/local_storage.dart';
import 'package:zybo_task/features/data/models/login_register_model.dart';
import 'package:zybo_task/features/data/models/otp_verification_model.dart';
import 'package:zybo_task/features/data/services/home_services.dart';
import 'package:zybo_task/features/data/services/login_services.dart';
import 'package:zybo_task/features/domain/repository/home_repository.dart';
import 'package:zybo_task/features/domain/repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<PhoneVerifyEvent>(phoneVerifyEvent);
    on<OtpVerifyEvent>(otpVerifyEvent);
    on<NameAddEvent>(nameAddEvent);
  }
LoginServices loginServices = LoginServices();
  FutureOr<void> phoneVerifyEvent(PhoneVerifyEvent event, Emitter<LoginState> emit) async{
    final data = await loginServices.verifyOtp(event.phno);
    final lastData = data.fold((fnL)=>fnL, (fnR)=>fnR);
    if(lastData is OtpVerificationModel){
      print(lastData);
      emit(LoginVerifyPhoneSuccessState(model: lastData,phone:event.phno));
    }else{
      print("Error $lastData");
      emit(LoginVerifyPhoneErrorState());
    }
  }

  FutureOr<void> otpVerifyEvent(OtpVerifyEvent event, Emitter<LoginState> emit) {
    if(event.model.user==true){
      if(event.model.token!= null) {
        CachedData.saveUserToken(event.model.token!.access!);
      }
      emit(LoginOtpUSERTrueNavigationState());
    }else{
      emit(LoginOtpUSERFalseState(phone: event.phone));
    }
  }

  FutureOr<void> nameAddEvent(NameAddEvent event, Emitter<LoginState> emit) async{
    final data = await loginServices.loginRegisterUser(event.name,event.phone);
    final lastData = data.fold((fnL)=>fnL, (fnR)=>fnR);
    if(lastData is LoginRegisterModel){
      print(lastData);
      if(lastData.message=="Login Successful") {
        if(lastData.token!= null) {
          CachedData.saveUserToken(lastData.token!.access!);
          emit(LoginRegisterSuccessState());
        }
      }
    }else{
      print("Error $lastData");
      emit(LoginVerifyPhoneErrorState());
    }
  }
}
