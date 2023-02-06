import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:money_money_money/components/money_card.dart';
import 'package:money_money_money/constants.dart';
import 'package:money_money_money/components/bottom_button.dart';

import 'home_page.dart';



class ResultsPage extends StatelessWidget {

  final String package;
  final String feedback;

  const ResultsPage({Key? key, required this.package, required this.feedback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.70),
          title: const Text(
            'IT\'S MONEY',
            style: TextStyle(
              letterSpacing: 1.5,
              color: moneyColor,
              fontFamily: 'MinecraftTen',
              fontSize: 30,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.center,
                child: Text(
                  'YOUR RESULTS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 40,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..color = Colors.blue
                      ..strokeWidth = 4,


                  ),
                ),

              ),
            ),
            Expanded(
              flex: 5,
              child: MoneyCard(
                color: Colors.black,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    const Text(
                        'CONGRATULATIONS',
                        style: resultTextStyle,
                      ),

                    BorderedText(
                      strokeColor: Colors.white,
                      strokeWidth: 1.4,
                      child: Text(
                        package + "  LPA",
                        style: packageTextStyle,
                      ),
                    ),
                    BorderedText(
                      strokeColor: moneyColor,
                      strokeWidth: 1,
                      child: Text(
                        feedback,
                        style: resultBodyTextStyle.copyWith(letterSpacing: 1.5, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              title: 'RE-CALCULATE',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
                cpCardPressed=false;
                webdCardPressed=false;

              },
            ),
          ],
        ),
      );
    }
  }
