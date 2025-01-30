part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

// class LoginActionState extends LoginState{}
//
// class LoginVerifyOtpContinueButtonState extends LoginState{
//
// }

class LoginVerifyPhoneSuccessState extends LoginState{
  final OtpVerificationModel model;
  final String phone;

  LoginVerifyPhoneSuccessState({required this.model,required this.phone});

}

class LoginVerifyPhoneErrorState extends LoginState{
}


class LoginOtpUSERTrueNavigationState extends LoginState{

}

class LoginOtpUSERFalseState extends LoginState{
  final String phone;
  LoginOtpUSERFalseState({required this.phone});

}
class LoginRegisterSuccessState extends LoginState{

}
class LoginRegisterErrorState extends LoginState{

}