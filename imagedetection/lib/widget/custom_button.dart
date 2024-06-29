import 'package:flutter/material.dart';
import 'package:imagedetection/themes/Tema.dart';

class CustomButton extends StatelessWidget {

  final String title;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;

  const CustomButton({
    Key? key,
    required this.title,
    this.width=double.infinity,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              width: width,
              height: 55,
              margin: margin,
              child: TextButton(
                onPressed: onPressed, 
                style: TextButton.styleFrom(
                  backgroundColor: kijostabilo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(30),
                  ),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                  ), textAlign:TextAlign.center ,
                  ),
              ),
            ); 
  }
}