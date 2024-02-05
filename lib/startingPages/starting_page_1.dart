import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medak/page_navigation.dart';



class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromRGBO(3, 3, 3, 1),
                    const Color.fromARGB(255, 40, 40, 37),
                    Colors.white
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "JOIN US NOW",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("play\nsign",
                      style: GoogleFonts.bungee(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))
                ],
              ),
            ),

            //
            Positioned(
              right: 5,
              top: 50,
              child: RotatedBox(
                quarterTurns: 3,
                child: Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      border: Border.all(
                          width: 2, color: Color.fromARGB(255, 255, 255, 255))),
                  child: Center(
                      child: Text(
                    'All genres',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  )),
                ),
              ),
            ),
            Positioned(
                top: 280,
                child: Text("enjoy\ndance",
                    style: GoogleFonts.bungee(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Colors.blueGrey,
                    ))),

            Positioned(
                top: 350,
                right: -8,
                child: Image.asset(
                  'images/11.png',
                  height: 400,
                )),

            Positioned(
              bottom: 50,
              left: 20,
              child: GestureDetector(
                onTap: () {
                Get.off(()=> Page1());
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.black,
                  child: Text(
                    "Let's go",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
