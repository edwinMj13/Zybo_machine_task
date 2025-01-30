import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:zybo_task/features/domain/use_cases/main_cases.dart';
import 'package:zybo_task/features/presentation/pages/home_page/home_page.dart';

import '../../../data/local_data/local_data.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<int>(
            valueListenable: MainCases.bottomNavigNotifier,
            builder: (context,snap,_) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  MainCases.getPages(snap),
                  BottomNavigationWidget(index:snap),
                ],
              );
            }
        ),
      ),
    );
  }
}

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    super.key,
    required this.index
  });
final int index;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 5,
      right: 5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: GNav(tabMargin:EdgeInsets.all(5),tabs: List.generate(
                LocalData.bottomList.length,
                    (index) => GButton(
                    icon: LocalData.bottomList[index].icon,
                    text: LocalData.bottomList[index].label,textStyle: TextStyle(color: Colors.white),),
              ),onTabChange: MainCases.updateBottomIndex,
                selectedIndex: index,
                gap: 5,
                activeColor: Colors.white,
                //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 100),
                tabBackgroundColor:Colors.blue,
                backgroundColor: Colors.transparent,),
            ),
          ],
        ),
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:zybo_task/features/domain/use_cases/main_cases.dart';
import 'package:zybo_task/features/presentation/pages/home_page/home_page.dart';

import '../../../data/local_data/local_data.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<int>(valueListenable: MainCases.bottomNavigNotifier, builder: (context,snap,_){
          return MainCases.getPages(snap);
        }),
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: MainCases.bottomNavigNotifier,
          builder: (context,snap,_) {
            return Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: GNav(tabs: List.generate(
                  LocalData.bottomList.length,
                      (index) => GButton(
                      icon: LocalData.bottomList[index].icon,
                      text: LocalData.bottomList[index].label),
                ),onTabChange: MainCases.updateBottomIndex,
                  selectedIndex: snap,
                  gap: 20,
                  activeColor: Colors.white,
                  //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 100),
                  tabBackgroundColor:Colors.blue,
                  backgroundColor: Colors.transparent,
                  color: Colors.black,),
              ),
            );
          }
      ),
    );
  }
}
/*
BottomNavigationBar(
              //onTap: (index)=>,
              currentIndex: snap,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              onTap: MainCases.updateBottomIndex,
              items: List.generate(
                LocalData.bottomList.length,
                    (index) => BottomNavigationBarItem(
                    icon: Icon(LocalData.bottomList[index].icon),
                    label: LocalData.bottomList[index].label),
              ),
            );
 */

 */