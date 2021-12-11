// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:bmi/units.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Body Mass Index",
              style: GoogleFonts.darkerGrotesque(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height / 25,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: HexColor("E19D4D"),
          toolbarHeight: MediaQuery.of(context).size.height / 15,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 70,
                ),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 65,
                        color: Colors.white),
                    children: [
                      const TextSpan(
                        text: 'How to use?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            '\n1. Enter your height in any of the height parameters.\n2. Enter your weight in any of the weight parameters.\n3. Click on BMI button.',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 70,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 70,
              ),
              Units(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Made By ",
                  style: TextStyle(
                      color: Colors.white70,
                      fontFamily: GoogleFonts.lato().fontFamily,
                      fontSize: MediaQuery.of(context).size.height / 70),
                  children: const [
                    TextSpan(
                      text: "Nishan",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
