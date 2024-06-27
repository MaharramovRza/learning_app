import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';

import 'bloc/register_blocs.dart';

class RegisterController{
  final BuildContext context;
  const RegisterController({required this.context});


  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;
    String username = state.username;
    String email = state.email;
    String password  = state.password;
    String rePassword = state.rePassword;

    if(username.isEmpty){
      toastInfo(msg: "User name can not be empty");
      return;
    }
    if(email.isEmpty){
      toastInfo(msg: "Email name can not be empty");
      return;
    }
    if(password.isEmpty){
      toastInfo(msg: "Password can not be empty");
      return;
    }
    if(rePassword.isEmpty){
      toastInfo(msg: "Your password confirmation is wrong");
      return;
    }

    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password
      );

      if(credential.user != null){
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        toastInfo(msg: "An email has benn sent to your registered email.To activate it please check your email box and click on the link");
        Navigator.of(context).pop();
      }

    }on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        toastInfo(msg: "The password provided is too weak");
      }
      else if(e.code == 'email-already-in-use'){
        toastInfo(msg: "The email is already in use");
      }
      else if(e.code == 'weak-password'){
        toastInfo(msg: "Your email id is invalid");
      }
    }

  }
}