import 'package:flutter/material.dart';
import 'package:sample/utils/calulator_button.dart';

const buttonsBackgroundColor = Color(0xFF090E1C);
const backgroundColor = Color(0xFF141A2F);
const yellowColor = Color(0xFFF7CF32);
const whiteColor = Colors.white;

AppBar appbar(
  BuildContext context,
  String title,
  IconData icon,
  Function() tap,
) {
  return AppBar(
    centerTitle: true,
    foregroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
    ),
    actions: [
      IconButton(
        onPressed: tap,
        color: Colors.yellow,
        icon: Icon(icon),
      ),
    ],
  );
}

void showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 400),
    ),
  );
}

List<CalculatorButton> buttons = <CalculatorButton>[
  CalculatorButton('AC', isColored: true, canBeFirst: false),
  CalculatorButton('⌫', isColored: true, canBeFirst: false),
  CalculatorButton('.', isColored: true, canBeFirst: false),
  CalculatorButton(' ÷ ', isColored: true, canBeFirst: false),
  CalculatorButton('7'),
  CalculatorButton('8'),
  CalculatorButton('9'),
  CalculatorButton(' × ', isColored: true, canBeFirst: false),
  CalculatorButton('4'),
  CalculatorButton('5'),
  CalculatorButton('6'),
  CalculatorButton(' - ', isColored: true, canBeFirst: false),
  CalculatorButton('1'),
  CalculatorButton('2'),
  CalculatorButton('3'),
  CalculatorButton(' + ', isColored: true, canBeFirst: false),
  CalculatorButton('00'),
  CalculatorButton('0'),
  CalculatorButton('000'),
  CalculatorButton('=', isEqualSign: true, canBeFirst: false),
];
