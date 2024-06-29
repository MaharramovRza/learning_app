import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/home/home_page.dart';

import '../../common/values/colors.dart';
import '../profile/profile.dart';

Widget buildPage(int index){
  List<Widget> _widget = [
    const HomePage(),
    Center(child: Text("Search"),),
    Center(child: Text("Course"),),
    Center(child: Text("Chat"),),
    const ProfilePage(),
  ];
  return _widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/home.png",
      ),
    ),
    label: "home",
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/home.png",
          color: AppColors.primaryElement),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/search2.png",
      ),
    ),
    label: "search",
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/search2.png",
          color: AppColors.primaryElement),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/play-circle1.png",
      ),
    ),
    label: "course",
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/play-circle1.png",
          color: AppColors.primaryElement),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/message-circle.png",
      ),
    ),
    label: "chat",
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/message-circle.png",
          color: AppColors.primaryElement),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/person2.png",
      ),
    ),
    label: "profile",
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/person2.png",
          color: AppColors.primaryElement),
    ),
  ),

];