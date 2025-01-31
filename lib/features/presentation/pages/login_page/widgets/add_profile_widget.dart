import 'package:flutter/material.dart';
import 'package:zybo_task/features/domain/use_cases/login_cases.dart';

import '../../../widgets/back_button_card.dart';
import '../../../widgets/login_button.dart';

class AddProfileWidget extends StatelessWidget {
  AddProfileWidget({
    super.key,
    required this.phone,
    required this.nameController,
  });

  final _formKeyName = GlobalKey<FormState>();
  final TextEditingController nameController;
  final String phone;

  validateNameField() {
    final isTrue = _formKeyName.currentState!.validate();
    if (isTrue) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardBackButton(callback: () => print("")),
        SizedBox(
          height: 50,
        ),
        Form(
          key: _formKeyName,
          child: TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              label: Text("Enter Full Name"),
              border: InputBorder.none,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Name is Empty";
              }
              return null;
            },
          ),
        ),
        LoginButton(
          controller: nameController,
          buttonLabel: "Submit",
          callback: () {
            if(validateNameField()){
              LoginCases.addProfileNameButton(
                context,
                nameController.text,
                phone,
              );
            }
          },
        )
      ],
    );
  }
}
