import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:zybo_task/config/utils.dart';
import 'package:zybo_task/features/domain/use_cases/login_cases.dart';

import '../../../../data/models/otp_verification_model.dart';
import '../../../widgets/back_button_card.dart';
import '../../../widgets/login_button.dart';

class VerifyOtpWidget extends StatelessWidget {
   VerifyOtpWidget({
    super.key,
     required this.model,
     required this.phone,
  });
final OtpVerificationModel model;
final String phone;
  final _formKeyPin = GlobalKey<FormState>();
   final otpController = TextEditingController();


  validateOtpPinField() {
    final isTrue = _formKeyPin.currentState!.validate();
    print("PIN - ${model.otp}  Controller - ${otpController.text}");
    if (isTrue && otpController.text==model.otp ) {
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
                      text: phone,
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
                  text: model.otp,
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
            controller: otpController,
            onCompleted: print,
            length: 4,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("00:120 Sec"),
            Text("Dont recieve code ? Re-send"),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        LoginButton(controller: otpController,buttonLabel: "Submit",callback: (){
          if(validateOtpPinField()){
            LoginCases.otpVerifyButton(context,model,phone);
          }else{
            Utils.snackbarUtils(context, "Incorrect OTP",Colors.red);
          }
        },),
      ],
    );
  }
}
