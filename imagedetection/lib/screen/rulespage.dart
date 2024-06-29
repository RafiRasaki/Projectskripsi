import 'package:flutter/material.dart';

import '../themes/Tema.dart';

class rulespage extends StatefulWidget {
  const rulespage({super.key});

  @override
  State<rulespage> createState() => _rulespageState();
}

class _rulespageState extends State<rulespage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        shadowColor: kBlackColor,
        backgroundColor: kijostabilo,
        title: 
        Text(
          'How to Use Apps',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: 10
            ),
            child: 
            Expanded(
              child: 
                Text(
                  '1. Arahkan Kamera ke objek yang diinginkan\n\n 2. Ambil Gambar\n\n 3. Lihat Hasil',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300, 
                  ),
                ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            child: 
            Expanded(
              child: Text(
                ''
              ),
              ),
          ),
        ],
      ),
    );
  }
}