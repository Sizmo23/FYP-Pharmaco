import 'package:flutter/material.dart';
import 'package:pharmaco/Pages/SignUp.dart';
import 'package:pharmaco/Pages/login.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  bool showlogin = true;

  void togglePages(){
    setState(() {
      showlogin = !showlogin;
    });
  }
  @override
  Widget build(BuildContext context) {
   if(showlogin){
    return login();
   }
    else{
      return SignUp();
    }
   }
  }
