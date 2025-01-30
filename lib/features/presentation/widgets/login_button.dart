import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/login_page/bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.controller,required this.buttonLabel,required this.callback});
final TextEditingController controller;
final String buttonLabel;
final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => callback(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          buttonLabel,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
