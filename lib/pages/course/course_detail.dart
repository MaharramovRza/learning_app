import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/widgets/base_text_widget.dart';

import "package:learning_app/pages/course/widgets/course_detail_widgets.dart";

import '../../common/values/colors.dart';

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          thumbNail(),
                          SizedBox(height:15.h,),
                          menuView(),
                          SizedBox(height:15.h ,),
                          reusableText("Course Description"),
                          SizedBox(height: 15.h,),
                          descriptionText(),
                          SizedBox(height: 20.h,),
                          goBuyButton("Go Buy"),
                          SizedBox(height: 20.h,),
                          courseSummary(),
                          courseSummaryView(context),
                          SizedBox(height:20.h ,),
                          reusableText("Lesson List"),
                          SizedBox(height: 20.h,),
                          courseLessonList(),
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
