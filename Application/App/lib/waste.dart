import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Waste extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WasteState();
  }

}

class WasteState extends State<Waste> {
  String why='''
What are the different types of waste?
  
Wet waste -
Wet waste consists of kitchen waste - including vegetable and fruit peels and pieces, tea leaves, coffee grounds, eggshells, bones and entrails, fish scales, as well as cooked food (both veg and non-veg).

Dry Waste -
Paper, plastics, metal, glass, rubber, thermocol, styrofoam, fabric, leather, rexine, wood – anything that can be kept for an extended period without decomposing is classified as dry waste.

Hazardous waste -
Household hazardous waste or HHW include three sub-categories – E-waste; toxic substances such as paints, cleaning agents, solvents, insecticides and their containers, other chemicals; and biomedical waste.

E-waste -
E-waste or electronic waste consists of batteries, computer parts, wires, electrical equipment of any kind, electrical and electronic toys, remotes, watches, cell phones, bulbs, tube lights and CFLs.

Biomedical waste -
This includes used menstrual cloth, sanitary napkins, disposable diapers, bandages and any material that is contaminated with blood or other body fluids.''';
String todo='''What are ways of disposing the waste?

Wet waste -
Composting can easily be done in any aerated container, composting system like tank composting. If not, the wet waste can be given out every day to your Municipality collection system.

Dry waste -
Store it in a bag after cleaning and drying till it is picked up. No food residue must be left in the bottles and packets. Clean them as you would to reuse them. If clothes are totally unusable, or very damaged, they are categorized as dry waste. If clothes are soiled with body fluids, they become sanitary waste. If they are soiled with paint, or any chemicals, hazardous waste.

Hazardous waste -
Paint and other hazardous waste like cosmetics, mosquito repellents, tube lights etc have to be stored separately and handed over to the Municipal collection system.

E-waste -
Store them in separate container which is kept closed, away from moisture and in which nothing else is put.

Biomedical waste - 
It has to be wrapped separately in a newspaper and handed over to the municipality waste collection system. Expired medicines and injections, used syringes also have to be disposed in the same manner.''';
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
            child: Text('Types of Waste',style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.w600,fontSize: 35),),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Image.asset('assets/check.jpeg'),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(why,style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 38, 0, 15),
            child: Text('Ways For Disposal',style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.w600,fontSize: 35),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(todo,style: GoogleFonts.getFont('Didact Gothic',color:Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
          ),
          SizedBox(height: 80,),
        ],
    ),
      ),
    );
  }
}