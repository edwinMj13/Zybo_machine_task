import 'package:flutter/material.dart';
import 'package:zybo_task/config/routes/route_names.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("asset/logo.png")),
        ],
      ),
    );
  }

  void delay() async{
    await Future.delayed(Duration(seconds: 2)).then((_){
      if(context.mounted) {
        Navigator.pushNamed(context, RouteNames.loginPage);
      }
    });
  }
}
