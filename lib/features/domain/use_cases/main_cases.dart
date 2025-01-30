import 'package:flutter/cupertino.dart';
import 'package:zybo_task/features/presentation/pages/home_page/home_page.dart';
import 'package:zybo_task/features/presentation/pages/profile_page/profile_page.dart';
import 'package:zybo_task/features/presentation/pages/wishlist_page/wishlist_page.dart';

class MainCases{
  static ValueNotifier<int> bottomNavigNotifier = ValueNotifier(0);


  static getPages(int index){
    switch(index){
      case 0:
        return  HomePage();
      case 1:
        return const WishlistPage();
      case 2:
        return  ProfilePage();
    }
  }

  static updateBottomIndex(int index){
    bottomNavigNotifier.value = index;
  }
}