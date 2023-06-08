import 'package:flutter/material.dart';
import 'package:login_page_1/screen/splash.dart';


const SAVE_KEY_NAME='UserLoggedIn';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: ScreenSplash(),
    );
  }
}

