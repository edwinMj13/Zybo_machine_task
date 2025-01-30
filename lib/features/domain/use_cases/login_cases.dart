import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo_task/config/routes/route_names.dart';
import 'package:zybo_task/features/data/models/otp_verification_model.dart';

import '../../presentation/pages/login_page/bloc/login_bloc.dart';

class LoginCases{
  backToNumberUi(){

  }
  backToOtpUi(){

  }

  static verifyPhoneNumberButton(BuildContext context, String phNo){
    context
        .read<LoginBloc>()
        .add(PhoneVerifyEvent(phno: phNo));
  }
  static otpVerifyButton(BuildContext context, OtpVerificationModel model,String phone){
    print("OK");
    context
        .read<LoginBloc>()
        .add(OtpVerifyEvent(phone:phone ,model:model));
  }
  static addProfileNameButton(BuildContext context, String name,String phone){
    context
        .read<LoginBloc>()
        .add(NameAddEvent(name: name,phone: phone, ));
  }

  static navigateToMainPage(BuildContext context){
    Navigator.pushNamed(context, RouteNames.mainPage);
  }
}