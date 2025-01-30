import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:zybo_task/features/presentation/pages/login_page/widgets/add_profile_widget.dart';
import 'package:zybo_task/features/presentation/pages/login_page/widgets/phone_number_widget.dart';
import 'package:zybo_task/features/presentation/pages/login_page/widgets/verify_otp_widget.dart';
import 'package:zybo_task/features/presentation/widgets/login_button.dart';

import '../../../domain/use_cases/login_cases.dart';
import '../../widgets/back_button_card.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context,state){
                if(state is LoginOtpUSERTrueNavigationState){
                  LoginCases.navigateToMainPage(context);
                }else if(state is LoginRegisterSuccessState){
                  LoginCases.navigateToMainPage(context);
                }
              },
              builder: (context, state) {
                if(state is LoginVerifyPhoneSuccessState) {
                  return VerifyOtpWidget(model: state.model,phone: state.phone,);
                }else if(state is LoginOtpUSERFalseState){
                  return AddProfileWidget(phone: state.phone,);
                }else {
                  return PhoneNumberUiWidget();
                }
              },
            )
        ),
      ),
    );
  }



}





