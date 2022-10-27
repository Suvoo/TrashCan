import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trash/wastedetail.dart';

class Info extends StatefulWidget
{
  var i;
  Info(this.i);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InfoState(i);
  }

}

class InfoState extends State<Info> {
  var i;
  InfoState(this.i);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
    backgroundColor: Color(0xFFFFFDD0),
    body: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(8, 38, 0, 15),
    child: Row(
      children: [
        IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,size: 35,)),
        Text(details[i].title,style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.w600,fontSize: 35),),
      ],
    ),
    ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: details[i].photo,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 12, 0, 15),
        child: Text('About',style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.w600,fontSize: 35),),
      ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(details[i].about,style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
    ),
    SizedBox(height: 10,),
    Padding(
    padding: const EdgeInsets.fromLTRB(8, 38, 0, 15),
    child: Text('Management',style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.w600,fontSize: 35),),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(details[i].methods,style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
    ),
    SizedBox(height: 80,),
    ],
    ),
    ),
    );
  }
}