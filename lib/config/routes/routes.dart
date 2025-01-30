import 'package:flutter/material.dart';
import 'package:zybo_task/features/presentation/pages/login_page/login_page.dart';
import 'package:zybo_task/features/presentation/pages/main_page/main_page.dart';
import 'package:zybo_task/features/presentation/pages/search_results_page/search_results_page.dart';

class Routes{
  static Route<dynamic> generateRoutes(RouteSettings settings){

    switch(settings.name){
      // case "splashPage":
      //   return MaterialPageRoute(builder: )
      case "loginPage":
        return MaterialPageRoute(builder: (context) =>LoginPage());
      case "mainPage":
        return MaterialPageRoute(builder: (context) =>const MainPage());
      case "searchPage":
        return MaterialPageRoute(builder: (context) =>const SearchResultsPage());
      default :
        return MaterialPageRoute(builder: (context)=>const Center(child: Text("No Route Generated")));
    }
  }
}