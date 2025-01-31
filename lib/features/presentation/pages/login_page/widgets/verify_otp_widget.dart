import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:zybo_task/config/utils.dart';
import 'package:zybo_task/features/domain/use_cases/login_cases.dart';

import '../../../../data/models/otp_verification_model.dart';
import '../../../widgets/back_button_card.dart';
import '../../../widgets/login_button.dart';

class VerifyOtpWidget extends StatefulWidget {
   VerifyOtpWidget({
    super.key,
     required this.model,
     required this.phone,
     required this.otpController,
  });
final OtpVerificationModel model;
final String phone;
   final TextEditingController otpController;

  @override
  State<VerifyOtpWidget> createState() => _VerifyOtpWidgetState();
}

class _VerifyOtpWidgetState extends State<VerifyOtpWidget> {
  final _formKeyPin = GlobalKey<FormState>();
  LoginCases loginCases = LoginCases();


  @override
  void initState() {
    super.initState();
    loginCases.startTimer();
  }


  @override
  void dispose() {
    super.dispose();
    loginCases.timer!.cancel();
  }

  validateOtpPinField() {
    final isTrue = _formKeyPin.currentState!.validate();
    print("PIN - ${widget.model.otp}  Controller - ${widget.otpController.text}");
    if (isTrue && widget.otpController.text==widget.model.otp ) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardBackButton(callback:()=>print),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "OTP VERIFICATION",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Enter the OTP to ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: widget.phone,
                      style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )
                  ]),
            ),
          ],
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "OTP is ",
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: widget.model.otp,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue),
                )
              ]),
        ),
        Form(
          key: _formKeyPin,
          child:  Pinput(
            controller: widget.otpController,
            onCompleted: print,
            length: 4,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        ValueListenableBuilder<int>(
          valueListenable: LoginCases.timerNotifier,
          builder: (context,snap,_) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                        visible:snap>0?true:false,
                        child: Text("00:$snap Sec")),
                    RichText(
                      textAlign: TextAlign.center,
                      text:  TextSpan(
                          text: "Dont recieve code ? ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Re-send",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: snap>0?Colors.blueGrey: Colors.blue),
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            );
          }
        ),
        LoginButton(controller: widget.otpController,buttonLabel: "Submit",callback: (){
          if(validateOtpPinField()){
            LoginCases.otpVerifyButton(context,widget.model,widget.phone);
          }else{
            Utils.snackbarUtils(context, "Incorrect OTP",Colors.red);
          }
        },),
      ],
    );
  }
}
