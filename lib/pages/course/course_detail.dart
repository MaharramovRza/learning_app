import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import "package:learning_app/pages/course/widgets/course_detail_widgets.dart";

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 25.w),
                      child:Column(
                        children: [
                          Container(
                            width: 325.w,
                            height: 200.h,
                            decoration: const BoxDecoration(
                              image:DecorationImage(
                                fit: BoxFit.fitWidth,
                                  image:AssetImage(
                                      "assets/icons/Image_1.png"
                                  )
                              )
                            ),
                          )
                        ],
                      )
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
