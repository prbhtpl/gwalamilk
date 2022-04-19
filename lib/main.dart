import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwalamilk/Auth/LoginScreen.dart';

import 'homePage.dart';

void main() {
  runApp(const MyApp());
  configLoading();
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  //..customAnimation = CustomAnimation();
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp( builder: EasyLoading.init() ,
   /*   theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.comicNeueTextTheme()
      ),*/
      home:  AnimatedSplashScreen(
        splashIconSize: 200,
        duration: 3000,
        nextScreen:  LoginPage(),
        splash: Image.asset('assets/logo.png'),
        splashTransition: SplashTransition.fadeTransition,
      ) ,
    );
  }
}


