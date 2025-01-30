import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils{
  static snackbarUtils(BuildContext context,String msg,Color color){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),backgroundColor: color,duration: Duration(seconds: 1),));
  }
}