import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {
  String data='''
The Importance of Waste Segregation -
 
Segregation at the source is critical to its recycling and disposal. Lack of segregation, collection, and transportation of unsegregated mixed waste to landfills has an impact on the environment. When we segregate waste, it reduces the amount of waste that reaches landfills, thereby taking up less space. Pollution of air and water can be considerably reduced when hazardous waste is separated and treated separately. Waste must be put in separate bins so that it can be appropriately dealt with.


The benefits of proper waste segregation include -

Lower Waste Costs: Mixing waste streams can be costly. Hazardous waste and general waste are far more expensive to dispose of than dry mixed recycling due to chemicals and biological contaminants. So, mixing clean recyclable items with hazardous waste means you’re paying more to dispose of your waste. 

Increased Recycling Rate: Waste segregation practices and a workforce that understand the importance of sorting waste prevents items suitable for recycling from being thrown away with general waste. 

Potential Revenue Streams: Waste segregation enables the identification of valuable materials such as metals, cardboard, and plastics and sells them to achieve the highest available rebate value.

Reduced Landfill Impact: Segregating your waste allows for recycling more items, preventing them from ending up in landfills. This, in turn, reduces the overall impact on the environment.
  ''';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('TrashCan',style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.bold,fontSize: 28),),
          ),
          CarouselSlider(
            options: CarouselOptions(
                height: 175.0,
                autoPlay: true),
            items: ['https://sustainmantra.com/wp-content/uploads/2020/12/cropped-slide1-1536x922-1-700x300.jpg','https://spectro.in/images/Waste-Management-Banner.jpg','https://immago.com/wp-content/uploads/2019/04/featured-biodegradable-bags.jpg','https://www.up.edu/sustainability/images/sustainability_images_2022/3_basic-rules.png','https://waste-management-world.com/imager/media/wasteManagementWorld/808812/3278_428fd902f4247199467725e7eccf1673.jpg'].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.network(i,fit: BoxFit.scaleDown,),
                      ),
                  );
                },
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(data,style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
          ),
          SizedBox(height: 80,),
        ],
      ),
    );
  }
}