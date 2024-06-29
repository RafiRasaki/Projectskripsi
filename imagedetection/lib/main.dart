import 'package:flutter/material.dart';
import 'package:imagedetection/screen/mainpage.dart';
import 'package:imagedetection/screen/resultpage.dart';
import 'package:imagedetection/screen/rulespage.dart';
import 'package:imagedetection/screen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Detection',
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => SplashPage(),
        'mainpage' :(context) => Mainpage(),
        'resultpage' :(context) => resultpage(),
        'rulespage' :(context) => rulespage(),
      },
     
    );
  }
}


