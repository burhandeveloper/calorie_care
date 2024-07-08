import 'package:flutter/material.dart';
import 'calculator_page.dart';
import 'theme.dart';

void main() {
  runApp(CalorieCalculatorApp());
}

class CalorieCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calorie Calculator',
      theme: appTheme,
      home: CalculatorPage(),
    );
  }
}
