import 'package:flutter/material.dart';

class resultpage extends StatefulWidget {
  const resultpage({super.key});

  @override
  State<resultpage> createState() => _resultpageState();
}

class _resultpageState extends State<resultpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/berhasil.jpg',
              width: 120,
              height: 150,
            ),
          ),
          /*Container(
              margin: EdgeInsets.only(
                top: 300,
              ),
              width: 120,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/berhasil.jpg'
                  ),
                )
              ),
            ),*/
          
          SizedBox(),

             Container(
              margin: EdgeInsets.only(
                top: 500,
              ),
               child: Text(
                'Selamat Anda Berhasil',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
                ),
             ),
              
          
        ],
      )
    );
  }
}