import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class BMI_Score_Screen extends StatelessWidget {
  final double bmiScore;
  final int age;
  String? bmiStatus;
  Color? bmiStatusColor;
  String? bmiInterpretation;

  BMI_Score_Screen(
      {super.key, required this.bmiScore, required this.age, required this.bmiStatus, required this.bmiInterpretation, required this.bmiStatusColor, });

  @override
  Widget build(BuildContext buildContext) {
    setBmiInterpretation();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          titleSpacing: 5.0,
          foregroundColor: Colors.white,
          title: const Text("BMI Score", style: TextStyle( color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold, ),),
        ),
        body: Container(
            margin: EdgeInsets.only(bottom: 20.0,),
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            child: Card(
              elevation: 14.0,
              shape: const RoundedRectangleBorder(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Your Score", style: TextStyle( fontSize: 35.0, color: Colors.blue, ),),
                  const SizedBox(height: 10.0,),
                  PrettyGauge(
                    needleColor: Colors.blue,
                    currentValue: bmiScore.toDouble(),
                    valueWidget: Text( bmiScore.toStringAsFixed(2), style: const TextStyle( fontSize: 40.0, ), ),
                    minValue: 0,
                    maxValue: 50,
                    gaugeSize: 300,
                    segments: [
                      GaugeSegment("UnderWeight", 18.5, Colors.red),
                      GaugeSegment("Normal", 11.4, Colors.green),
                      GaugeSegment("OverWeight", 9.8, Colors.orange),
                      GaugeSegment("Obese", 10.3, Colors.pink),
                    ],
                  ),
                  const SizedBox(height: 12.0,),
                  Text( bmiStatus!, style: TextStyle( fontSize: 25.0, color: bmiStatusColor!, ), ),
                  const SizedBox(height: 12.0,),
                  Text( bmiInterpretation!, style: const TextStyle( fontSize: 15.0,), ),
                  const SizedBox(height: 12.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){
                        Navigator.pop(buildContext);
                      }, child: const Text("Re-calculate"),),
                      const SizedBox(width: 12.0,),
                      ElevatedButton(onPressed: (){
                        Share.share("Your BMI is ${bmiScore.toStringAsFixed(1)} at age $age");
                      }, child: const Text("Share"),),
                    ],
                  ),
                ],
              ),
        ),
        ),
    );
  }

  void setBmiInterpretation()
  {
      if( bmiScore > 30.0 )
        {
          bmiStatus = "Obese";
          bmiInterpretation = "Please work to reduce obesity.";
          bmiStatusColor = Colors.pink;
        }
      else if( bmiScore >= 25.0 )
      {
        bmiStatus = "Over Weight";
        bmiInterpretation = "Please do regular exercise and reduce the weight.";
        bmiStatusColor = Colors.orange;
      }
      else if( bmiScore >= 18.5 )
      {
        bmiStatus = "Normal Weight";
        bmiInterpretation = "Please maintain your current weight and you are fit.";
        bmiStatusColor = Colors.green;
      }
      else if( bmiScore < 18.5 )
      {
        bmiStatus = "Under Weight";
        bmiInterpretation = "Please try to increase the weight by using healthy food.";
        bmiStatusColor = Colors.red;
      }
  }
}