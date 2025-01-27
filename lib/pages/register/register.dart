import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/register/bloc/register_blocs.dart';
import 'package:learning_app/pages/register/bloc/register_events.dart';
import 'package:learning_app/pages/register/register_controller.dart';

import '../common_widgets.dart';
import 'bloc/register_states.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs,RegisterStates>(builder:(context,state){
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: reusableText(
                          "Enter your details below and free sign up")),
                  Container(
                    margin: EdgeInsets.only(top: 66.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("User name"),
                        buildTextField("Enter your user name", "name", "user",
                                (value) {
                              context.read<RegisterBlocs>().add(UserNameChanged(value));
                            }),
                        reusableText("Email"),
                        buildTextField(
                            "Enter your email address", "email", "user", (value) {
                          context.read<RegisterBlocs>().add(EmailChanged(value));
                        }),
                        reusableText("Password"),
                        buildTextField("Enter your password", "password", "lock",
                                (value) {
                              context.read<RegisterBlocs>().add(PasswordChanged(value));
                            }),
                        reusableText("Re-enter your password"),
                        buildTextField("Re-enter your password to confirm",
                            "password", "lock", (value) {
                              context.read<RegisterBlocs>().add(RePasswordChanged(value));
                            }),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.w),
                    child:
                    reusableText("by creating an account you have to agrre with our term & conditions."),
                  ),
                  buildLogInAndRegButton("Sign Up", "login", () {
                    //Navigator.of(context).pushNamed("register");
                    RegisterController(context:context).handleEmailRegister();
                  }),
                ],
              ),
            ),
            // This trailing comma makes auto-formatting nicer for build methods.
          ),
        ),
      );
    });



  }
}
