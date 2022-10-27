import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AboutState();
  }

}

class AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //backgroundColor: const Color(0xFFFEFBEA)
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration:  const BoxDecoration(
              // gradient: LinearGradient(
              //   colors: [Colors.amberAccent.withOpacity(0.7),Color(0xFFF7CC00).withOpacity(0.7)],
              // )
            color: Color(0xFFFFFDD0)
          ),
          child: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                const SizedBox(height: 30,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                        child: Text('Meet The Team',style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.bold,fontSize: 28),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap:()=>launch('https://www.srmist.edu.in/engineering/department-of-computing-technologies/faculty/dr-babu-s'),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Dr. S.Babu',style: GoogleFonts.poppins(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w600),),
                              Text('Know More >',style: GoogleFonts.poppins(color: Colors.white),),
                            ],
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.black54,
                            radius: 45,
                            backgroundImage: NetworkImage('https://www.srmist.edu.in/sites/default/files/images/babu-s-cse.jpg',scale: 0.1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap:()=>launch('https://github.com/Blazikengr8'),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.black,
                            backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/60261112?s=400&u=2162485400ab03771599d1b60f78fc8ec87bba92&v=4'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Abhigyan Singh',style: GoogleFonts.poppins(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w600),),
                              Text('Know More >',style: GoogleFonts.poppins(color: Colors.white),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap:()=>launch('https://github.com/Suvoo'),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Suvodeep Sinha',style: GoogleFonts.poppins(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w600),),
                              Text('Know More >',style: GoogleFonts.poppins(color: Colors.white),),
                            ],
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.black54,
                            radius: 45,
                            backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/52796258?v=4'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap:()=>launch('https://github.com/namannj15'),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration:BoxDecoration(
                        color:  Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.black54,
                            backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/77778261?v=4'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Naman Jain',style: GoogleFonts.poppins(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w600),),
                              Text('Know More >',style: GoogleFonts.poppins(color: Colors.white),)
                            ],
                          )
                        ],
                      ),
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