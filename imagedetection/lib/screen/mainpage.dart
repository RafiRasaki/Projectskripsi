import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imagedetection/themes/Tema.dart';
import 'package:imagedetection/widget/custom_button.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart' show rootBundle;

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  bool _loading = true;
  File? _image;
  List? _output;
  final picker = ImagePicker();
  late Interpreter _interpreter;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() {
    //Method Untuk Clean Memory
    _interpreter.close();
    super.dispose();
  }

  classifyImage(File image) async {

    // Preprocess the input image [1, 224, 224, 3]
    final input = preprocessImage(image);

    // Allocate memory for the output [1, 5]
    final output = List<double>.filled(1 * 5, 0).reshape([1, 5]);

    // Run inference
    _interpreter.run(input, output);

    // convert the output to a list of probabilities and get the maximum value and convert its index to the label from assets/labels.txt
    List<int> probabilities = output[0].toList();
    List<String> labels = await rootBundle
        .loadString('assets/labels.txt')
        .then((value) => value.split('\n'));
    int maxIndex = probabilities.indexOf(probabilities.reduce(max));
    String label = labels[maxIndex].split(' ').sublist(1).join(' ');

    setState(() {
      _output = [
        {
          'labels': label,
          'confidence': probabilities[maxIndex],
        }
      ];
      _loading = false;
    });

    return output;
  }

  // Preprocess the input image so that the tensor size is [1, 224, 224, 3]
  List<dynamic> preprocessImage(File image) {
    final img.Image imageInput = img.decodeImage(image.readAsBytesSync())!;
    final img.Image resizedImage = img.copyResizeCropSquare(
      imageInput, 
      size: 224,
      //interpolation: img.Interpolation.cubic
      );
    var input = resizedImage.data?.buffer.asUint8List();
    return input?.reshape([1, 224, 224, 3]) ?? [];
  }

  Future<void> loadModel() async {
    //Method get image from tflite
    _interpreter = await Interpreter.fromAsset('assets/model.tflite');
  }

  pickImage() async {
    //Method get image from Camera
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image!);
  }

  pickGalleryImage() async {
    //Method get image from Gallery
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: kBlackColor,
        backgroundColor: kijostabilo,
        title: Text(
          'Vegetables Classification',
          style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.w400, 
              color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.green[300],
        height: MediaQuery.of(context).size.width + 500,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                Container(
                  child: Center(
                    child: _loading == true
                        ? null
                        : Container(
                            margin: EdgeInsets.only(
                              top: 20,
                              bottom: 10,
                            ),
                            width: 300,
                            height: 400,
                            color: Colors.grey[300],
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.file(_image!),
                            ),
                          ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Expanded(
                    child: Text(
                      'This Object is: ${_output?[0]['labels']}',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
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
                  onPressed: pickImage,
                ),
                CustomButton(
                  width: 170,
                  margin: EdgeInsets.only(
                    top: 15,
                  ),
                  title: "Galery",
                  onPressed: pickGalleryImage,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'rulespage');
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 50,
                    ),
                    child: Text(
                      'Bingung Cara Menggunakan Ini ? Click here',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.center,
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
