import 'dart:async';
import 'package:flutter/material.dart';
import '../themes/Tema.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
  }

  class _SplashPageState extends State<SplashPage>{ 

    @override
  void initState() {
    Timer(Duration(seconds: 3), (() {
      Navigator.pushNamedAndRemoveUntil(
        context, 'mainpage', (route) => false);
    }));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kijostabilo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/imageicon.jpg',
                  )
                )
              ),
            ),
            Text(
              'Image\nDetection Apps',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                letterSpacing: 3,
              ), 
               textAlign: TextAlign.center,
              ),
          ],
          ),
      ),
    );
  }
}