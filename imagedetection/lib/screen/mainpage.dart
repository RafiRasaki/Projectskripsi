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
          'Vegetables Classification',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black
          ),
        ),
      ),
      body: Container(
        color: Colors.green[300],
        height: MediaQuery.of(context).size.width + 500,  
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
          child : Column(
            children: [
              Container(
                 margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                width: 300,
                height: 400,
                color: Colors.grey[300],
              ), 
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Text(
                  'This Object is ',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                  ),
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
                onPressed: (){}
                ),
      
              GestureDetector(
                onTap:() {
                  Navigator.pushNamed(context, 'rulespage');
                },
              child :Container(
                margin: EdgeInsets.only(
                  top: 50,
                ),
                child: 
                Text(
                  'Bingung Cara Menggunakan Ini ? \nClick here',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ), textAlign: TextAlign.center,
                  ), 
              ),
            ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}