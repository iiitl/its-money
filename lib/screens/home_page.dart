import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:money_money_money/components/money_card.dart';
import 'package:money_money_money/screens/results_page.dart';
import 'package:money_money_money/components/top_card_content.dart';
import 'package:money_money_money/components/package_calculator.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:money_money_money/constants.dart';
import 'package:money_money_money/components/round_icon_button.dart';
import 'package:money_money_money/components/bottom_button.dart';

bool cpCardPressed = false;
bool webdCardPressed = false;

enum ChoiceType {
  cp,
  webd,
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color cpCardColor = Colors.red;
  Color webdCardColor = Colors.yellow;
  Color cardSelectedColor = Colors.teal;
  int interest = 80;
  int hours = 5;
  int experience = 3;

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
        centerTitle: true,
      ),
      body: GestureDetector(
        child: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        cpCardPressed = true;
                        webdCardPressed = false;
                      });
                    },
                    child: MoneyCard(
                      color: cpCardPressed ? cardSelectedColor : cpCardColor,
                      childCard: const TopCardContent(
                        topPadding: 17,
                        imagePath: 'assets/cp.png',
                        title: 'CP',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        webdCardPressed = true;
                        cpCardPressed = false;
                      });
                    },
                    child: MoneyCard(
                      color:
                          webdCardPressed ? cardSelectedColor : webdCardColor,
                      childCard: const TopCardContent(
                        topPadding: 0,
                        imagePath: 'assets/webd.png',
                        title: 'DEV',
                      ),
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
                child: MoneyCard(
              color: Colors.blue,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BorderedText(
                    strokeColor: moneyColor,
                    strokeWidth: 2.0,
                    child: Text(
                      'INTEREST',
                      style: titleStyle.copyWith(letterSpacing: 1.4),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      BorderedText(
                        strokeColor: moneyColor,
                        strokeWidth: 2.0,
                        child: Text(
                          interest.toString(),
                          style: numStyle.copyWith(letterSpacing: 1.4),
                        ),
                      ),
                      BorderedText(
                        strokeColor: moneyColor,
                        strokeWidth: 2.0,
                        child: Text(
                          '%',
                          style: titleStyle.copyWith(letterSpacing: 1.4),
                        ),
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: Colors.orangeAccent.withOpacity(0.40),
                    ),
                    child: Slider(
                      value: interest.toDouble(),
                      min: 0,
                      max: 100,
                      activeColor: Colors.orangeAccent,
                      inactiveColor: Colors.white,
                      onChanged: (double newValue) {
                        setState(() {
                          interest = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: MoneyCard(
                    color: Colors.lightGreenAccent,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BorderedText(
                          strokeColor: moneyColor,
                          strokeWidth: 2.0,
                          child: Text(
                            'HOURS PER DAY',
                            style: titleStyle.copyWith(letterSpacing: 1.4),
                          ),
                        ),
                        BorderedText(
                          strokeColor: moneyColor,
                          strokeWidth: 2.0,
                          child: Text(
                            hours.toString(),
                            style: numStyle.copyWith(letterSpacing: 1.4),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 30,
                              ),
                              iconColor: Colors.orangeAccent,
                              parameter: hours,
                              add: true,
                              onPressed: () {
                                setState(() {
                                  hours < 10 ? hours++ : hours;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              child: const Icon(
                                Icons.remove,
                                color: Colors.black,
                                size: 30,
                              ),
                              iconColor: Colors.orangeAccent,
                              parameter: hours,
                              add: false,
                              onPressed: () {
                                setState(() {
                                  hours > 0 ? hours-- : hours;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MoneyCard(
                    color: Colors.purpleAccent,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BorderedText(
                          strokeColor: moneyColor,
                          strokeWidth: 2.0,
                          child: Text(
                            'EXPERIENCE',
                            style: titleStyle.copyWith(letterSpacing: 1.4),
                          ),
                        ),
                        BorderedText(
                          strokeColor: moneyColor,
                          strokeWidth: 2.0,
                          child: Text(
                            experience.toString(),
                            style: numStyle.copyWith(letterSpacing: 1.4),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 35,
                              ),
                              iconColor: Colors.orangeAccent,
                              parameter: experience,
                              add: true,
                              onPressed: () {
                                setState(() {
                                  experience < 10 ? experience++ : experience;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              child: const Icon(
                                Icons.remove,
                                color: Colors.black,
                                size: 35,
                              ),
                              iconColor: Colors.orangeAccent,
                              parameter: experience,
                              add: false,
                              onPressed: () {
                                setState(() {
                                  experience > 0 ? experience-- : experience;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            BottomButton(
              title: 'CALCULATE YOUR PACKAGE',
              onTap: () {
                PackageCalculator calc = PackageCalculator(
                    interest: interest, hours: hours, experience: experience);

                cpCardPressed == false && webdCardPressed == false
                    ? CoolAlert.show(
                        context: context,
                        type: CoolAlertType.warning,
                        text: 'Select any one option!',
                      )
                    : Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultsPage(
                                package: calc.calculatePackage(),
                                feedback: calc.getFeedback())));
              },
            )
          ],
        ),
      ),
    );
  }
}
