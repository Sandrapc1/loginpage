// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login_page_1/home.dart';
import 'package:login_page_1/main.dart';
import 'package:login_page_1/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
// fluttrt

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {

@override
  void initState() {
   checkUserLoggedIn();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: 
    Image.asset('assets/images/logo.jpg',height:200,),),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  Future<void>gotoLogin() async{
   await Future.delayed(Duration(seconds: 3));
   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenLogin()
   ),
   );
  }

  Future<void>checkUserLoggedIn() async{
    final _sharedprefs=await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedprefs.getBool(SAVE_KEY_NAME);
    if(_userLoggedIn == null || _userLoggedIn == false){
      gotoLogin();
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenHome()));
    }
  }
}