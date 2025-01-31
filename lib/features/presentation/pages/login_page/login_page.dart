import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:zybo_task/config/utils.dart';
import 'package:zybo_task/features/presentation/pages/login_page/widgets/add_profile_widget.dart';
import 'package:zybo_task/features/presentation/pages/login_page/widgets/phone_number_widget.dart';
import 'package:zybo_task/features/presentation/pages/login_page/widgets/verify_otp_widget.dart';
import 'package:zybo_task/features/presentation/widgets/login_button.dart';
import 'package:zybo_task/features/presentation/widgets/slide_right_widget.dart';

import '../../../domain/use_cases/login_cases.dart';
import '../../widgets/back_button_card.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final phnoController = TextEditingController();

  final nameController = TextEditingController();

  final otpController = TextEditingController();

  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    Timer(const Duration(milliseconds: 200),
        () => _animationController.forward());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phnoController.dispose();
    nameController.dispose();
    otpController.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginOtpUSERTrueNavigationState) {
                  LoginCases.navigateToMainPage(context);
                } else if (state is LoginRegisterSuccessState) {
                  LoginCases.navigateToMainPage(context);
                }else if(state is LoginVerifyPhoneErrorState){
                  Utils.snackbarUtils(context, "Something Wrong...!", Colors.red);
                }
              },
              builder: (context, state) {
                if (state is LoginVerifyPhoneSuccessState) {
                  return SlideToRightAnimationWidget(
                      animationController: _animationController,
                      childWidget: VerifyOtpWidget(
                        model: state.model,
                        phone: state.phone,
                        otpController: otpController,
                      ));
                } else if (state is LoginOtpUSERFalseState) {
                  return SlideToRightAnimationWidget(
                    animationController: _animationController,
                    childWidget: AddProfileWidget(
                      phone: state.phone,
                      nameController: nameController,
                    ),
                  );
                } else {
                  return SlideToRightAnimationWidget(
                    animationController: _animationController,
                    childWidget: PhoneNumberUiWidget(
                      phnoController: phnoController,
                    ),
                  );
                }
              },
            )),
      ),
    );
  }
}
