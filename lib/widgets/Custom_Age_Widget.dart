import 'package:flutter/material.dart';

class Custom_Age_Widget extends StatefulWidget {

  final Function(int) onChange;
  final String title;
  final int minimumValue, maximumValue, initialValue;

  const Custom_Age_Widget({super.key, required this.onChange, required this.initialValue, required this.minimumValue, required this.maximumValue, required this.title, });

  @override
  State<Custom_Age_Widget> createState() => _Custom_Age_WidgetState();
}

class _Custom_Age_WidgetState extends State<Custom_Age_Widget> {

  int counter = 0;

  void initialState(){
   super.initState();
   counter = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
    child: Card(
    elevation: 14.0,
    shape: const RoundedRectangleBorder(),
    child: Column(
    children: [
      Text( widget.title, style: const TextStyle( fontSize: 25.0, fontWeight: FontWeight.w300, color: Colors.grey, ), ),
      const SizedBox(height: 10,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
           InkWell(
             onTap: (){
                setState(() {
                  if( counter > widget.minimumValue )
                    {
                      counter--;
                    }
                });
                widget.onChange(counter);
             },
             child: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.blue,
                child: Icon(Icons.remove_circle_outline, color: Colors.white,),
              ),
           ),
            SizedBox(width: 15.0,),
            Text( counter.toString(), style: const TextStyle( fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black87, ), textAlign: TextAlign.center, ),
            SizedBox(width: 15.0,),
            InkWell(
              onTap: (){
                setState(() {
                  if( counter < widget.maximumValue )
                  {
                    counter++;
                  }
                });
                widget.onChange(counter);
              },
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.blue,
                child: Icon(Icons.add_circle_outline_outlined, color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    ],
    ),
    ),
    );
  }
}
