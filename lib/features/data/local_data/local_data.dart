import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zybo_task/features/data/models/bottomNavidation_model.dart';

class LocalData{
  static List<BottomNavigModel> bottomList = [
     BottomNavigModel(icon: Icons.home_outlined,label: "Home"),
     BottomNavigModel(icon: Icons.favorite_border,label: "Wishlist"),
     BottomNavigModel(icon: Icons.person_2_outlined,label: "Profile"),
  ];
}