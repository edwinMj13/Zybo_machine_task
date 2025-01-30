part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class PhoneVerifyEvent extends LoginEvent {
  final String phno;

  PhoneVerifyEvent({required this.phno});
}
class OtpVerifyEvent extends LoginEvent {
  final String phone;
  final OtpVerificationModel model;

  OtpVerifyEvent({ required this.phone,required this.model});
}
class NameAddEvent extends LoginEvent {
  final String name;
  final String phone;

  NameAddEvent({required this.name,required this.phone});
}