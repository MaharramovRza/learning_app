import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/home/widgets/home_page_blocs.dart';
import 'package:learning_app/pages/home/widgets/home_page_events.dart';
import 'package:learning_app/pages/home/widgets/home_page_states.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
      title: Container(
        margin: EdgeInsets.only(left: 7.w, right: 7.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 18.w,
              height: 12.h,
              child: Image.asset("assets/icons/menu.png"),
            ),
            GestureDetector(
              child:Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/icons/person.png")),
                    borderRadius: BorderRadius.all(Radius.circular(20.w))
                ),
              ),
              onTap:(){

              },
            ),
          ],
        ),
      )
  );
}

Widget homePageText(String text,{Color color=AppColors.primaryText,int top=20}) {
  return Container(
    margin: EdgeInsets.only(bottom: 0.h, top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
      ),
    ),
  );
}

Widget searchView() {
  return Container(
    margin: EdgeInsets.only(bottom: 0.h, top: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 280.w,
          height: 40.h,
          margin: EdgeInsets.only(bottom: 0.h, top: 0.h),
          padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
          decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: BorderRadius.all(Radius.circular(15.h)),
              border: Border.all(color: AppColors.primaryFourthElementText)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.w),
                padding: EdgeInsets.only(left: 0.w, top: 0.w),
                width: 16.w,
                height: 16.w,
                child: Image.asset("assets/icons/search.png"),
              ),
              SizedBox(
                width: 240.w,
                height: 40.h,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: "Search your course...",
                    hintStyle: TextStyle(
                      color: AppColors.primaryThirdElementText,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp,
                  ),
                  onChanged: (value) {
                    // controller.state.email.value = value;
                  },
                  maxLines: 1,
                  autocorrect: false, // 自动纠正
                  obscureText: false, // 隐藏输入内容, 密码框
                ),
              )
            ],
          ),
        ),
        GestureDetector(child:Container(
          width: 40.h,
          height: 40.h,
          padding: EdgeInsets.all(6.w),
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(13.w)),
              border: Border.all(color: AppColors.primaryElement)),
          child: Image.asset("assets/icons/options.png"),
        ),onTap: (){
        },),
      ],
    ),
  );
}

Widget slidersView(BuildContext context,HomePageStates state) {
  return Column(
    children: [
      Container(
        width: 325.w,
        height: 160.h,
        margin: EdgeInsets.only(top:20.h),
        child: PageView(
          onPageChanged:(value){
            print(value.toString());
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(path:"assets/icons/Art.png"),
            _slidersContainer(path:"assets/icons/Image_1.png"),
            _slidersContainer(path:"assets/icons/Image_2.png"),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 8.h),
        child: DotsIndicator(
            mainAxisAlignment: MainAxisAlignment.center,
            reversed: false,
            dotsCount: 3,
            position: state.index.toInt(),
            decorator: DotsDecorator(
              color: AppColors.primaryThirdElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            )),
      )
    ],
  );
}

Widget _slidersContainer({String path = "assets/icons/Art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(path),
        fit: BoxFit.fill,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20.h)),
    ),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
          width: 325.w,
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _reusableText("Choose your course"),
              GestureDetector(child:_reusableText("See all",color:AppColors.primaryThirdElementText,fontsize: 10),),  // GestureDetector(child: Container(
              //   margin: EdgeInsets.only(bottom: 0.h, top: 0.h),
              //   child: Text(
              //     "See All",
              //     style: TextStyle(
              //       color: AppColors.primaryThirdElementText,
              //       fontWeight: FontWeight.normal,
              //       fontSize: 10.sp,
              //     ),
              //   ),
              // ),onTap: (){  },)
            ],
          )),
      Container(
          margin: EdgeInsets.only(top: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             _reusableMenuText("All"),
              _reusableMenuText("Popular",textColor: AppColors.primaryThirdElementText,backGroundColor: Colors.white),
              _reusableMenuText("Newest",textColor: AppColors.primaryThirdElementText,backGroundColor: Colors.white),

            ],
          ))
    ],
  );
}

Widget _reusableText(String text ,
       {Color color =AppColors.primaryText,int fontsize = 16,FontWeight fontWeight = FontWeight.bold}){
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontsize.sp,
    ),
  );
}

Widget _reusableMenuText(String menuText,{Color textColor = AppColors.primaryElementText,Color backGroundColor = AppColors.primaryElement}){
  return Container(
      margin: EdgeInsets.only(right: 30.w),
      padding: EdgeInsets.only(
          left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.all(Radius.circular(7.w)),
          border: Border.all(color: backGroundColor)),
      child:
      _reusableText(menuText,
          color:textColor,
          fontWeight:FontWeight.normal,
          fontsize: 11 )
  );
}

Widget courseGrid(){
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius : BorderRadius.circular(15.w),
      image:const DecorationImage(
          fit:BoxFit.fill,
          image:AssetImage("assets/icons/Image_2.png")
      ),
    ),
    child:Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best course for IT and Engineering",
          maxLines:1,
          overflow:TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color:AppColors.primaryElementText,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp
          ),
        ),
        SizedBox(height: 5.h,),
        Text(
          "Flutter best course",
          maxLines:1,
          overflow:TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color:AppColors.primaryFourthElementText,
              fontWeight: FontWeight.normal,
              fontSize: 8.sp
          ),
        ),
      ],
    ),
  );
}
