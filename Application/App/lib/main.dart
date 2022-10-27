import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trash/about.dart';
import 'package:trash/waste.dart';

import 'faq.dart';
import 'home.dart';
import 'detect.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

// This widget is the root of your application.
@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Trash Can',
    theme: ThemeData(),
    home: Nav(),
  );
}
}

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int currentIndex = 0;
  String currentTitle='';

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
      if(index==0)
        currentTitle="Home";
      else if(index==1)
        currentTitle="Classify";
      else
          currentTitle='About';

    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final  List<Widget> _pages = <Widget>[
      HomePage(),
      Waste(),
      Predict(),
      FAQs(),
      About(),
    ];
    return Scaffold(
      backgroundColor: Color(0xFFFFFDD0),
      body: Stack(
        children: [
          Center(
            child: _pages[currentIndex],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Column(
                    children: [
                      Center(
                        heightFactor: 0.6,
                        child: FloatingActionButton( backgroundColor:Colors.black.withOpacity(0.7),child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/logo.png',fit: BoxFit.fill,),
                        ) ,onPressed: () {
                          setBottomBarIndex(2);
                        },),
                      ),
                      SizedBox(height: 26,),
                      Text('Classify',style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                    ],
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.house,
                                color: currentIndex == 0 ? Colors.grey : Colors.black,
                                size: 25,
                              ),
                              onPressed: () {
                                setBottomBarIndex(0);
                              },
                              splashColor: Colors.white,
                            ),
                            Text('Home',style: GoogleFonts.getFont('Didact Gothic',color: currentIndex == 0 ? Colors.grey : Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.glassWater,
                                color: currentIndex == 1 ? Colors.grey : Colors.black,
                                size: 25,
                              ),
                              onPressed: () {
                                setBottomBarIndex(1);
                              },
                              splashColor: Colors.white,
                            ),
                            Text('Tips',style: GoogleFonts.getFont('Didact Gothic',color: currentIndex == 1 ? Colors.grey : Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Container(
                          width: size.width * 0.2,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.circleInfo,
                                  color: currentIndex == 3 ? Colors.grey : Colors.black,
                                  size: 25,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(3);
                                }),
                            Text('  FAQs',style: GoogleFonts.getFont('Didact Gothic',color: currentIndex == 3 ? Colors.grey : Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.peopleGroup,
                                  color: currentIndex == 4 ? Colors.grey : Colors.black,
                                  size: 25,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(4);
                                }),
                            Text('  About',style: GoogleFonts.getFont('Didact Gothic',color: currentIndex == 4 ? Colors.grey : Colors.black ,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xFFF7CC00)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
