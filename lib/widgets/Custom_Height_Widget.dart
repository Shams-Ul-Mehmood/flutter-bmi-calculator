import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_Height_Widget extends StatefulWidget
{
  final Function(double) onChange;

  const Custom_Height_Widget({super.key, required this.onChange});

  @override
  State<Custom_Height_Widget> createState() => Custom_Height_Widget_State();
}

class Custom_Height_Widget_State extends State<Custom_Height_Widget>
{
  double _height = 150.0;

  @override
  Widget build(BuildContext buildContext)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 14.0,
          shape: const RoundedRectangleBorder(),
      child: Column(
        children: [
          const Text("Height", style: TextStyle( fontSize: 30.0, fontWeight: FontWeight.w300, color: Colors.grey, ),),
          Container(height: 12.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( _height.toStringAsFixed(2), style: const TextStyle( fontSize: 40.0 ), ),
              SizedBox(width: 3.0,),
              const Text( "cm", style: const TextStyle( fontSize: 20.0, color: Colors.grey, ), ),
            ],
          ),
          Slider(min: 0.0, max: 250.0, thumbColor: Colors.blue, activeColor: Colors.blue, value: _height.toDouble(), onChanged: (heightValue){
            setState(() {
              _height = heightValue;
            },);
            widget.onChange(_height);
          }),
        ],
      ),
      ),
    );
  }
}