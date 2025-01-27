import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/pages/course/bloc/course_detail_states.dart';
import 'package:learning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:learning_app/pages/home/bloc/home_page_states.dart';
import 'package:learning_app/pages/home/widgets/home_page_widgets.dart';
//import 'package:learning_app/common/entities/course.dart';

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
      body:
          BlocBuilder<HomePageBlocs, HomePageStates>(builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 25.w,
                ),
                sliver: SliverToBoxAdapter(
                    child: homePageText("Hello",
                        color: AppColors.primaryThirdElementText, top: 20))),
            SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 25.w,
                ),
                sliver: SliverToBoxAdapter(
                  child: homePageText("RzaTech",
                      color: AppColors.primaryText, top: 5),
                )),
            SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 25.w,
                ),
                sliver: SliverToBoxAdapter(
                  child: searchView(),
                )),
            SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 25.w,
                ),
                sliver: SliverToBoxAdapter(
                  child: slidersView(context, state),
                )),
            SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 25.w,
                ),
                sliver: SliverToBoxAdapter(child: menuView())),
            SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 18.h,
                  horizontal: 25.w,
                ),
                sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.6,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: 4,
                      (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/course_detail");
                          },
                          child: courseGrid(),
                        );
                      },
                    ))),
          ],
        );
      }),
    );
  }
}
