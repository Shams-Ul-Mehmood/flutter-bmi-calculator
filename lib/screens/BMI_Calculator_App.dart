import 'package:flutter/material.dart';

import 'BMI_Calculator.dart';

class BMI_Calculator_App extends StatelessWidget
{
  @override
  Widget build(BuildContext buildContext)
  {
    return MaterialApp(
      title: "BMI Calculator App",
      color: Colors.blue,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMI_Calculator(),
    );
  }
}