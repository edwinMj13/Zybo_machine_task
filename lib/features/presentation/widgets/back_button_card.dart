import 'package:flutter/material.dart';

class CardBackButton extends StatelessWidget {
  const CardBackButton({super.key,required this.callback});
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>callback(),
      child: const Card(
        color: Colors.white,
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
