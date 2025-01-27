import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';

AppBar buildAppBar(String type){
  return AppBar(
    bottom:PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child:Container(
        color:AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    centerTitle: true,
    title: Text(
      type,
      style: TextStyle(
          color:AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal
      ),
    ),
  );
}


Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
      padding: EdgeInsets.only(left: 50.w, right: 50.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcons("google"),
          _reusableIcons("apple"),
          _reusableIcons("facebook")
        ],
      ));
}

Widget _reusableIcons(String iconName){
  return GestureDetector(
    child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Image.asset("assets/icons/$iconName.png", fit: BoxFit.fill)),
    onTap: () {

    },
  );
}

Widget reusableText(String text){
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
    ),
  );
}

Widget buildTextField(String hintText, String textType,String iconName,
    void Function(String value)? func
    ){
  return Container(
    width: 325.w,
    height: 50.h,
    margin:EdgeInsets.only(bottom:20.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: AppColors.primaryFourthElementText)),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17.w),
          width: 16.w,
          height: 16.w,
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        Container(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value)=>func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              hintStyle: const TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
            autocorrect: false,
            obscureText: textType=="password"?true:false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword(){
  return Container(
    margin:EdgeInsets.only(left:25.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
        child: Text(
          "Forgot password?",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: AppColors.primaryText,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryText,
            fontWeight: FontWeight.normal,
            fontSize: 12.sp,
          ),
        ),
        onTap: () {
        }),
  );
}

//

Widget buildLogInAndRegButton(String buttonName, String buttonType,void Function()? func){
  return GestureDetector(
    onTap:func,
    child: Container(
        width: 325.w,
        height: 50.h,
        margin: EdgeInsets.only(top: buttonType=="login"?40.h:20.h, left: 25.w, right: 25.w),
        decoration: BoxDecoration(
            color:  buttonType=="login"?AppColors.primaryElement:AppColors.primaryBackground,
            borderRadius: BorderRadius.all(Radius.circular(15.w)),
            border: Border.all(color: buttonType=="login"?Colors.transparent:AppColors.primaryFourthElementText)),
        child: Center(
            child: Text(
              buttonName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: buttonType=="login"?AppColors.primaryElementText:AppColors.primaryText,
                fontWeight: FontWeight.normal,
                fontSize: 16.sp,
              ),
            ))),
    // onTap: () {}
  );
}