import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:flutter_url_shortener/bitly.dart';
import 'package:flutter_url_shortener/bitly_exception.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:trash/api.dart';
import 'package:trash/wasteinfo.dart';
import 'package:http/http.dart' as http;
class Predict extends StatefulWidget {
  const Predict({Key? key}) : super(key: key);
  @override
  _PredictState createState() => _PredictState();
}
class _PredictState extends State<Predict> {
  Map<String,int> ls = {"'battery'":0,"'biological'":1,"'brown-glass'":2,"'cardboard'":3,"'clothes'":4,
    "'green-glass'":5,"'metal'":6,"'paper'":7,"'plastic'":8,"'shoes'":9,"'trash'":10,"'white-glass'":11
  };
  String x='';
  late int y;
  bool loading = false;
  late File _image;
  var _output = false;
  final imagepicker = ImagePicker();
  var resp ;
  var api;
  @override
  void initState() {
    super.initState();
   rootBundle.load('assets/credentials.json').then((json) {
     api = CloudApi(utf8.decode(json.buffer.asUint8List(json.offsetInBytes,json.lengthInBytes)));});
    loading= false;
  }

  Future<String> _saveImage(File image) async{
    var fname = Random().nextInt(10000).toString();
    final response = await api.save(fname,image.readAsBytesSync());
    //print(response.publicUrl);
    // final _firebaseStorage = FirebaseStorage.instance;
    // var snapshot = await _firebaseStorage.ref()
    //     .child('images/test.jpg')
    //     .putFile(image);
    // var downloadUrl = await snapshot.ref.getDownloadURL();
    // print(downloadUrl);
    // final queryParams = {
    //   'key':'459254d00ea5394943edd5a335c3e0c7',
    //   'image':downloadUrl,
    // };
    // var respie = await http.post(
    //   Uri.https('api.imgbb.com','/1/upload',queryParams),
    // );
    //print(respie.body);
    //final body = json.decode(respie.body);
   var respi = await http.get(Uri.parse('https://fastcheck-k7bv-main-sd3vvyyvwa-wm.a.run.app/url/https://storage.googleapis.com/trash_bucket/${fname}'));
  print(respi.body);
   resp = respi.body;
    loading = false;
    resp = resp.toString().substring(3,resp.length-3).split(',');
    print(ls[resp[0]]);
    return resp[0];
  }

  pickimage_camera() async {
    var image = await imagepicker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    var r = await _saveImage(_image);
    loading = false;
    _output = true;
  }
  pickimage_gallery() async {
    var image = await imagepicker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    var r = await _saveImage(_image);
    loading = false;
    _output = true;
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
        child: SingleChildScrollView(
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
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text('Capture',
                              style: GoogleFonts.getFont('Didact Gothic',color:Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                          onPressed: () async{
                            setState(() {
                              loading = true;
                              _output = false;
                            });
                            await pickimage_camera();
                            setState(() {
                              loading = false;
                              _output = true;
                            });
                          }),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: 60,
                      width: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text('Gallery',
                              style:  GoogleFonts.getFont('Didact Gothic',color:Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                          onPressed: () async{
                            setState(() {
                              loading = true;
                              _output = false;
                            });
                            await pickimage_gallery();
                            setState(() {
                              loading = false;
                              _output = true;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              loading != true
                  ? (_output == true)?Container(
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
                     ListView.builder(
                         physics: NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                       itemCount: resp.length,
                       itemBuilder: (context,index) {
                         return Card(
                           elevation: 10,
                           color: Color(0xFFFFFDD0),
                           child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(onPressed: () async{
                                    final player = AudioPlayer();
                                    await player.setUrl('asset:///assets/audio${ls[resp[index].trim()]}.mp3');
                                    player.play();
                                    // sleep(Duration(seconds:1));
                                    player.dispose();
                                  }, icon: Icon(Icons.volume_up,size: 30,)),
                                  Expanded(
                                    child: Text(
                                    'Classified as : ${resp[index].trim()}',
                                    style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.bold,fontSize: 22),),
                                  ),
                                  IconButton(onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Info(ls[resp[index].trim()])));
                                  }, icon: Icon(Icons.arrow_right,size: 30,)),
                                ],
                              ),
                         );
                       }
                     ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ):Container()
                  : Container(
                child: Center(child: CircularProgressIndicator(),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}