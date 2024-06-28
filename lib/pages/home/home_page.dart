import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/home/widgets/home_page_widgets.dart';

import '../../common/values/colors.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 0,horizontal: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homePageText("Hello,",color: AppColors.primaryThirdElementText,top:20),
            homePageText("RzaTech",color: AppColors.primaryText,top:5),
            searchView(),
            slidersView(),
          ],
        ),
      ),
    );
  }
}