import 'dart:math';

import 'package:bmi_calculator_app/screens/BMI_Score_Screen.dart';
import 'package:bmi_calculator_app/widgets/Custom_Age_Widget.dart';
import 'package:bmi_calculator_app/widgets/Custom_Gender_Widget.dart';
import 'package:bmi_calculator_app/widgets/Custom_Height_Widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class BMI_Calculator extends StatefulWidget
{
  @override
  State<BMI_Calculator> createState() => BMI_Calculator_State();
}

class BMI_Calculator_State extends State<BMI_Calculator>
{
  int _gender = 0;
  double _height = 0.0;
  int _age = 20;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0.0;

  @override
  Widget build(BuildContext buildContext)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator", style: TextStyle( fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.white, ),),
        backgroundColor: Colors.blue,
        titleSpacing: 2.0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(14.0),
            child: Card(
              elevation: 14.0,
              shape: const RoundedRectangleBorder(),
              child: Column(
                children: [
                  Custom_Gender_Widget(onChange: (genderValue){
                    _gender = genderValue;
                  },),
                  Custom_Height_Widget(onChange: (height_Value){
                    _height = height_Value;
                  },),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Custom_Age_Widget(onChange: (age_Value){
                        _age = age_Value;
                      }, initialValue: 20, minimumValue: 0, maximumValue: 100, title: "Age"),

                      Custom_Age_Widget(onChange: (weight_Value){
                        _weight = weight_Value;
                      }, initialValue: 50, minimumValue: 0, maximumValue: 200, title: "Weight(Kg)"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric( horizontal: 65.0, vertical: 25.0, ),
                    child: SwipeableButtonView(
                      isFinished: _isFinished,
                        onFinish: () async {

                          await Navigator.push(context, PageTransition(child: BMI_Score_Screen(bmiScore: _bmiScore, age: _age, bmiStatus: '', bmiInterpretation: '', bmiStatusColor: null, ), type: PageTransitionType.fade,));

                          setState(() {
                            _isFinished = false;
                          });
                        },
                        onWaitingProcess: (){

                          calculate_BMI_Score();

                          Future.delayed(Duration(seconds: 2), (){
                            setState(() {
                              _isFinished = true;
                            });
                          });
                        },
                        activeColor: Colors.blue,
                        buttonWidget: Icon(Icons.arrow_forward_ios_rounded,),
                        buttonText: "Calculate",
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }

  void calculate_BMI_Score()
  {
    _bmiScore = _weight / pow( _height / 100 , 2);
  }
}