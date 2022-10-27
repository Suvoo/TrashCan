import 'package:flutter/material.dart';

List<Detail> details = [
  Detail(photo: Image.network("https://www.conserve-energy-future.com/wp-content/uploads/2016/02/battery-recycling.jpg"),
    title: 'Battery',
    about: 'Various types of batteries are widely used in daily life, and a large number of waste batteries are eventually produced. Waste batteries causes serious environmental pollution',
    methods: '''
    - Incineration and Landfill
    - Curing Treatment Method
    - Wet Recovery Technology
    - Dry Recovery Technology
    - Biological Method 
    ''',
  ),
  Detail(photo: Image.network("https://www.google.com/url?sa=i&url=https%3A%2F%2Fcelitron.com%2Fen%2Fbiomedical-waste-management-disposal-methods&psig=AOvVaw3XS9sOk-GeKnhTknRnMe9d&ust=1649673997323000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCLCEmd6oifcCFQAAAAAdAAAAABAD"),
    title: 'Biological Waste',
    about: 'Biological waste is defined as infectious waste, pathological waste, chemotherapy waste and the receptacles and supplies generated during its handling and/or storage. It is further defined as waste that, because of its quantity, character or composition, has been determined to require special handling.',
    methods: '''
    - Deep burial
    - Autoclave and microwave treatment
    - Shredding
    - Land disposal : Secured/Sanitary landfill
    - Incinerator
    ''',
  ),
  Detail(photo: Image.network("https://www.pdsigns.ie/contentFiles/productImages/Large/RWSW3.jpg"),
    title: 'Brown Glass Waste',
    about: 'Glass does not decompose, it is important to recycle it. Glass is almost 100% recyclable and can be recycled endlessly without loss in quality or purity',
    methods: '''
    - Collected using a country-wide network
    - Sorted based on its color to increase recycling efficiency
    - Crushing and grinding
    - De-Contamination Process
    - De-colorizing and Dyeing
    => Zinc oxide is added instead to oxidize the brown glass cullet to blue or green cullet, depending on the quantity of zinc oxide added and the richness of the brown or amber-colored glass being recycled.
    ''',
  ),
  Detail(photo: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZtaxt_hNYcRJbl9Vd4if7bmy3jwy8eDnWD96pEkMEy8ja64IpxdPtUul625T3eltkR7g&usqp=CAU"),
    title: 'Cardboard Waste',
    about: 'Cardboard, also referred to as corrugated cardboard, is a recyclable material that is recycled by small and large scale businesses to save money on waste disposal costs. Cardboard recycling is the reprocessing and reuse of thick sheets or stiff multilayered papers that have been used, discarded or regarded as waste',
    methods: '''
    - Collection of cardboard
    - Sorting them based on material
    - Shredding and Pulping
    - Filtering, Conterminal Removal, and De-Inking
    - Finishing for Reuse
    ''',
  ),
  Detail(photo: Image.network("https://in.apparelresources.com/wp-content/uploads/sites/3/2021/08/unnamed.jpg"),
    title: 'Textile Waste',
    about: 'Current fashion system uses high volumes of non-renewable resources, including petroleum, extracted to produce clothes that are often used only for a short period of time, after which the materials are largely lost to landfill or incineration',
    methods: '''
    - Material is sorted by type of material and color
    - Materials are shredded or pulled into fibers
    - Yarn is then cleaned and mixed through a carding process
    - Yarn is re-spun for use in weaving or knitting
    - It can also be compressed for textile filling such as in mattresses
    ''',
  ),
  Detail(photo: Image.network("https://thumbs.dreamstime.com/b/bunch-empty-green-glass-bottles-collected-recycling-sale-waste-management-concept-180815991.jpg"),
    title: 'Green Glass Waste',
    about: 'Glass does not decompose, it is important to recycle it. Glass is almost 100% recyclable and can be recycled endlessly without loss in quality or purity',
    methods: '''
    - Collected using a country-wide network
    - Sorted based on its color to increase recycling efficiency
    - Crushing and grinding
    - De-Contamination Process
    - De-colorizing and Dyeing
    =>  The oxidation process turns the deep dark green color to yellow-green color. A chemical known as manganese oxide is then mixed with the glass cullet to it grey. The grey base is usually used as the primary color to which various other coloring dyes or agents are added to develop glass of various colors.
    ''',
  ),
  Detail(photo: Image.network("https://www.recyclingdepotadelaide.com.au/wp-content/uploads/2015/04/scrap-metal-recycling-process.jpg"),
    title: 'Metal Waste',
    about: 'Metals are essential, versatile and can be used in a number of ways. Metals can be used for industrial purposes such as the manufacture of trucks, cars, airplanes, ships, and railways. They can also be used to manufacture domestic items such as cutlery, crockery and even in packaging. The good thing about metal recycling is that metal can be recycled over and over without altering its properties',
    methods: '''
    - Collection Process
    - Sort By Type and Cleanliness
    - Metals are compacted and squeezed together
    - It is then melted in furnace
    - Purification is done by electrolysis
    - They are then solidified
    ''',
  ),
  Detail(photo: Image.network("https://img2.exportersindia.com/product_images/bc-full/dir_180/5379364/paper-waste-1512642370-3503613.jpeg"),
    title: 'Paper Waste',
    about: 'Paper products which can be recycled are; Newspaper, Shredded paper, Phonebooks, Cardboard, Magazines, Computer paper, Envelopes, Junk mail, Construction paper etc. Through recycling of cardboard and other paper products, millions of new paper products are produced such as Egg cartons, Tissue, Toilet paper, Newspaper, Paper bags, Notebooks, Stamps, Business cards, Calendars',
    methods: '''
    - Paper is taken from the bin and deposited in a large recycling container along with paper from other recycling bins.
    - The paper is taken to a recycling plant where it is separated into types and grades.
    - The separated paper is then washed with soapy water to remove inks, plastic film, staples and glue.
    - By adding different materials to the slurry, different paper products can be created.
    - The slurry is spread using large rollers into large thin sheets.
    - The paper is left to dry, and then it is rolled up ready to be cut and sent back to the shops.
    ''',
  ),
  Detail(photo: Image.network("https://marketresearch.biz/wp-content/uploads/2019/01/plastic-waste-management-market.jpg"),
    title: 'Plastic Waste',
    about: ' A significant amount of plastic waste has entered the environment, creating a health hazard for humans and, more importantly, life-threatening situations for animals, particularly ocean life. A large percentage of plastic waste remains unattended, giving rise to an important situation that must be dealt with by plastic manufacturers and end users.',
    methods: '''
    - Collection of Waste Plastic
    - Sorting of Plastics into Categories
    - Washing to Remove Impurities
    - Shredding and Resizing
    - Identification and Separation of Plastics
    - Compounding
    ''',
  ),
  Detail(photo: Image.network("https://www.conserve-energy-future.com/wp-content/uploads/2021/01/sneaker-made-from-shoes.jpg"),
    title: 'Shoes Waste',
    about: 'The problem is that shoes are inherently difficult to recycle. They can be made of a wide variety of materials, often spanning up to 40 different components, making it challenging to take shoes apart and recycle each piece accordingly. Additionally, there are a limited number of facilities that can cater to shoe recycling. The end result is that around 90% of the shoes we wear eventually end up in landfills.',
    methods: '''
    - Shoe cobblers can bring back shoes from the dead
    - Donate or consign any shoes that are still wearable
    - Sustainable footwear is also a alternative
    ''',
  ),
  Detail(photo: Image.network("https://d3pcsg2wjq9izr.cloudfront.net/files/39876/products/623003/39876_2_202007242359517930351.jpg"),
    title: 'Trash',
    about: 'General waste bin is the place for items that you would usually throw into the general waste bin at home. These are things that you wouldn’t usually recycle, and that often end up in landfill. Where possible, you should separate your waste to maximise recycling opportunities.',
    methods: 'Recycling is the process of converting waste materials into new materials and objects. The recovery of energy from waste materials is often included in this concept. The recyclability of a material depends on its ability to reacquire the properties it had in its original state.[1] It is an alternative to "conventional" waste disposal that can save material and help lower greenhouse gas emissions. It can also prevent the waste of potentially useful materials and reduce the consumption of fresh raw materials, reducing energy use, air pollution (from incineration) and water pollution (from landfilling).',
  ),
  Detail(photo: Image.network("https://ismwaste.co.uk/images/recycling/glass-min.jpg"),
    title: 'White Glass Waste',
    about: 'Glass does not decompose, it is important to recycle it. Glass is almost 100% recyclable and can be recycled endlessly without loss in quality or purity',
    methods: '''
    - Collected using a country-wide network
    - Sorted based on its color to increase recycling efficiency
    - Crushing and grinding
    - De-Contamination Process
    - De-colorizing and Dyeing
    => Erbium oxide and Manganese oxide are added to the glass cullet to help clear all the colors from the glass cullet.
    ''',
  ),
];



class Detail{
  Image photo;
  String title;
  String about;
  String methods;

  Detail({required this.photo, required this.title, required this.about, required this.methods});
}