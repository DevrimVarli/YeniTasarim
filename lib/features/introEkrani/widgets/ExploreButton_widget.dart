import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
//EXPLORE BUTONU
import 'package:yeni_tasarim/screens/bottom_navigation_bar_screen.dart';
class ExploreButtonWidget extends StatelessWidget {
  ExploreButtonWidget({super.key});
  @override
  Widget build(BuildContext context) {
    double ekranYuksekligi = MediaQuery.of(context).size.height;
    double ekranGenisligi = MediaQuery.of(context).size.width;
    return Positioned(
        bottom: 50,
        left: 32,
        child: SizedBox(
          width: ekranGenisligi/1.21,
          height: ekranYuksekligi/20,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:HexColor('#176FF2'),
                  shape: const RoundedRectangleBorder(
                    
                  ),
              ),
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute<Widget>(builder: (BuildContext context)=>const Secim()));
              }, child: Text('Explore',style: GoogleFonts.montserrat(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),),
        ),);
  }
}
