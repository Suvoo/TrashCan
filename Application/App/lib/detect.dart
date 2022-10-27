import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:trash/wasteinfo.dart';

class Predict extends StatefulWidget {
  const Predict({Key? key}) : super(key: key);
  @override
  _PredictState createState() => _PredictState();
}
class _PredictState extends State<Predict> {
  String x='';
  late int y;
  bool loading = false;
  late File _image;
  var _output ;
  final imagepicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loading= true;
    loadmodel().then((value) {
      print(value);
      setState(() {});
    });
  }
  detectimage(File image) async {
    var prediction = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 12);
    setState(() {
      _output = prediction;
      print(_output);
      loading = false;
    });
  }
    loadmodel() async {
    await Tflite.loadModel(
      model: 'assets/unquantized.tflite',
      labels: 'assets/labels.txt',
     ) ;
  }
  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
  pickimage_camera() async {
    var image = await imagepicker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image);
  }
  pickimage_gallery() async {
    var image = await imagepicker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detectimage(_image);
  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFFFDD0),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Container(
                child: Text('Garbage Segregator',
                    style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.bold,fontSize: 30),)),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              //color: Colors.black,
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(height: 30),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 60,
                    width: 150,
                    child: RaisedButton(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Capture',
                            style: GoogleFonts.getFont('Didact Gothic',color:Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                        onPressed: () {
                          pickimage_camera();
                        }),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 60,
                    width: 150,
                    child: RaisedButton(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Gallery',
                            style:  GoogleFonts.getFont('Didact Gothic',color:Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                        onPressed: () {
                          pickimage_gallery();
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            loading != true
                ? Container(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFF7CC00),
                    ),
                    // width: double.infinity,
                    padding: EdgeInsets.all(15),
                    child: Image.file(_image,fit: BoxFit.fitWidth,),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _output != null
                      ? Text(
                      'Classified as : ${_output[0]['label'].toString()}',
                      style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.bold,fontSize: 22),)
                      : Text(''),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>Info(_output[0]['index'])));},
                      child: Container(
                        height: 60,
                        width: double.infinity,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        child: Center(child: Text('Know more',style: GoogleFonts.getFont('Didact Gothic',color:Colors.white,fontWeight: FontWeight.bold,fontSize: 26),)),
                      ),
                    ),
                  ),
                ],
              ),
            )
                : Container()
          ],
        ),
      ),
    );
  }
}
