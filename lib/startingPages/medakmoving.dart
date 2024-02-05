import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../getxmodel/startingpageview.dart';


class Medak extends StatefulWidget {
  const Medak({super.key});

  @override
  State<Medak> createState() => _MedakState();
}

class _MedakState extends State<Medak> {
  final getcontrol= Get.put(Srtpage());
   @override
  void initState() {
    // TODO: implement initState
     getcontrol.movingpage();
      getcontrol.checkpermission();

    super.initState();
    }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.black,
      body: Stack(
        children: [
          Lottie.asset('images/a1b.json',width: double.infinity, height: double.infinity),
               Positioned(
                child: Center(child: Text("MeDek", style: GoogleFonts.habibi(fontWeight: FontWeight.w400 ,fontSize:60, color: Color.fromARGB(255, 119, 230, 121)),)))
                     
        ],
      ),
    );
  }
}