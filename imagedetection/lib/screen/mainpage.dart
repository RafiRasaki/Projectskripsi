import 'package:flutter/material.dart';
import 'package:imagedetection/themes/Tema.dart';
import 'package:imagedetection/widget/custom_button.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: kBlackColor,
        backgroundColor: kijostabilo,
        title: 
        Text(
          'Image Detection',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
        child : Column(
          children: [
            Container(
               margin: EdgeInsets.only(
                  top: 20,
                  bottom: 10
                ), 
              width: 300,
              height: 400,
              color: Colors.grey[200],
            ), 
            CustomButton(
              width: 170,
              margin: EdgeInsets.only(
                top: 30,
                bottom: 10,
              ),
              title: "Take Picture", 
              onPressed: (){}
            ),

            CustomButton(
              width: 170,
              margin: EdgeInsets.only(
                top: 15,
              ),
              title: "Galery", 
              onPressed: (){

              }
              ),
            GestureDetector(
              onTap:() {
                Navigator.pushNamed(context, 'rulespage');
              },
            child :Container(
              margin: EdgeInsets.only(
                top: 70,
              ),
              child: 
              Text(
                'Bingung Cara Menggunakan Ini ? Click here',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.underline,
                ),
                ),
            ),
          ),
          ],
        ),
        ),
      ),
    );
  }
}