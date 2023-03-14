//delivery_food_detail_ui.dart
import 'package:delivery_food_app/models/FoodShopList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryFoodDetailUI extends StatefulWidget {
  //สร้างตัวแปรธรรมดาประเภท FoodShopList เพื่อเอาไว้รับค่าที่ส่งมาจากหน้า DeliveryFoodHomeUI
  FoodShopList? foodShopList;

  DeliveryFoodDetailUI({super.key, this.foodShopList});

  @override
  State<DeliveryFoodDetailUI> createState() => _DeliveryFoodDetailUIState();
}

class _DeliveryFoodDetailUIState extends State<DeliveryFoodDetailUI> {
   Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
   Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'สายด่วนชวนกิน (' + widget.foodShopList!.shopName + ')',
          style: GoogleFonts.kanit(),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
              ),
       
             Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/' + widget.foodShopList!.shopImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.yellow,
                  ),
                ),
              ),
      
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(
                    FontAwesomeIcons.store,
                    color: Colors.amber,
                ),
      
                title: Text(
                  'ชื่อร้าน : ' + widget.foodShopList!.shopName,
                  style: GoogleFonts.kanit(),
                ),
                tileColor: Colors.blue,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
      
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: ListTile(
                  onTap: () {
                    _makePhoneCall(widget.foodShopList!.shopPhone);
                  },
                  leading: Icon(
                    FontAwesomeIcons.store,
                    color: Colors.amber,
                ),
                       
                title: Text(
                  'เบอร์โทร : ' + widget.foodShopList!.shopName,
                  style: GoogleFonts.kanit(),
                ),
                tileColor: Colors.blue,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: ListTile(
                  onTap: () {
                    _launchInBrowser(Uri.parse('https://facebook.com/' + widget.foodShopList!.shopFacebook));

                  },
                  leading: Icon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.amber,
                ),
                       
                title: Text(
                  'Facebook : ' + widget.foodShopList!.shopName,
                  style: GoogleFonts.kanit(),
                ),
                tileColor: Colors.blue,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
      
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse('https://www.google.com/maps/search/?api=1&query='
                      +widget.foodShopList!.shopLatitude
                      +','
                      +widget.foodShopList!.shopLatitude
                      )
                    );
                  },
                  leading: Icon(
                    FontAwesomeIcons.store,
                    color: Colors.amber,
                ),
                       
                title: Text(
                  'สถานที่่ตั้งร้าน',
                  style: GoogleFonts.kanit(
                  ),
                  
                ),
                tileColor: Colors.blue,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
              ),
            
            ],
        ),
          ),
      ),
    );
  }
}
