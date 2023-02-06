import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:money_money_money/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final void Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Center(
            child: BorderedText(
              strokeWidth: 2.0,
              strokeColor: moneyColor,
              child: Text(
                title,
                style: titleStyle.copyWith(
                  fontSize: 25.0,
                  letterSpacing: 1.4,
                ),
              ),
            ),
          ),
          color: Colors.orangeAccent,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.only(bottom: 20.0),
          height: calculateButtonHeight,
        ),
      ),
    );
  }
}

