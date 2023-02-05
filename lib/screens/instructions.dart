import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:glitch_text/glitch_text.dart';
import 'package:money_money_money/constants.dart';
import 'package:money_money_money/screens/home_page.dart';

class Instructions extends StatelessWidget {
  const Instructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(40.0),
            child: GlitchText(
              data: "INSTRUCTIONS",
              align: TextAlign.center,
              fontSize: 30,
              overflow: TextOverflow.ellipsis,
              font: "MinecraftTen",
              offset: 2,
              fontColor: Colors.black,
              wordSpacing: 1,
              letterSpacing: 1.3,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '1. Tap on the CALCULATE button!',
                  style: instructionsTextStyle,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  '2. Choose one of the two interests!',
                  style: instructionsTextStyle,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  '3. Select the interest percentage in chosen interest field.',
                  style: instructionsTextStyle,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  '4. Select number of hours per day you put in your chosen field.',
                  style: instructionsTextStyle,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  '5. Select number of years of experience you have in your chosen field.',
                  style: instructionsTextStyle,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  '6. Tap on the CALCULATE YOUR PACKAGE BUTTON.',
                  style: instructionsTextStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(45.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: BorderedText(
                  strokeWidth: 2.0,
                  strokeColor: Colors.yellowAccent,
                  child: const Text(
                    'CALCULATE',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'MinecraftTen',
                      fontSize: 30,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
