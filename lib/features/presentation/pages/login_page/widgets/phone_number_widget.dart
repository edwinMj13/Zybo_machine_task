import 'package:flutter/material.dart';

import '../../../../domain/use_cases/login_cases.dart';
import '../../../widgets/login_button.dart';

class PhoneNumberUiWidget extends StatelessWidget {
  PhoneNumberUiWidget({
    super.key,
  }) ;

  final phnoController = TextEditingController();

  final _formKeyPhone = GlobalKey<FormState>();
  validatePhoneNumberField() {
    final isTrue = _formKeyPhone.currentState!.validate();
    if (isTrue) {
      return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Login",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Text("Lets Connect with Lorem Ipsum..!"),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            const SizedBox(
              width: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "+91",
                  border: InputBorder.none,
                ),
              ),
            ),
            Expanded(
              child: Form(
                key: _formKeyPhone,
                child: TextFormField(
                  controller: phnoController,
                  decoration: const InputDecoration(
                    label: Text("Enter Phone"),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Phone Number is Empty";
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        LoginButton(controller: phnoController, buttonLabel: "Continue",callback: ()=>LoginCases.verifyPhoneNumberButton(context,phnoController.text),),
        SizedBox(height: 20,),
        terms(),
      ],
    );
  }
  Row terms() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
              text: "By Continuing you accepting the ",
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "Terms of Use & \nPrivacy Policy",
                  style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold),
                )
              ]),
        ),
      ],
    );
  }

}