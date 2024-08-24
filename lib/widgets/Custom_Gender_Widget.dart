import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class Custom_Gender_Widget extends StatefulWidget
{
  final Function(int) onChange;

  const Custom_Gender_Widget({super.key, required this.onChange});

  @override
  State<Custom_Gender_Widget> createState()
  {
    return Custom_Gender_Widget_State();
  }
}

class Custom_Gender_Widget_State extends State<Custom_Gender_Widget>
{
  int _gender = 0;

  final ChoiceChip3DStyle unselected_Choice_Chip_3D_Style = ChoiceChip3DStyle(
    borderRadius: BorderRadius.circular(15.0),
    topColor: Colors.grey[200]!,
    backColor: Colors.grey,);

  final ChoiceChip3DStyle selected_Choice_Chip_3D_Style = ChoiceChip3DStyle(
    borderRadius: BorderRadius.circular(15.0),
    topColor: Colors.white,
    backColor: Colors.grey[300]!,);

  @override
  Widget build(BuildContext buildContext)
  {
    return Padding(
      padding: const EdgeInsets.all(39.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
              onSelected: (){
                _gender = 1;
                setState(() {});
                widget.onChange(_gender);
              },
              onUnSelected: (){},
              child: Column(
                children: [
                  Image.asset("assets/images/male_icon0.png", width: 50.0, height: 50.0, fit: BoxFit.cover,),
                  const SizedBox(height: 5.0,),
                  const Text("Male"),
                ],
              ),
            selected: _gender == 1,
            border: Border.all(color: Colors.grey,),
            style: _gender == 1 ? selected_Choice_Chip_3D_Style : unselected_Choice_Chip_3D_Style,
          ),
          const SizedBox(width: 30.0,),
          ChoiceChip3D(
            onSelected: (){
              setState(() {
                _gender = 2;
              });
              widget.onChange(_gender);
            },
            onUnSelected: (){},
            child: Column(
              children: [
                Image.asset("assets/images/female_icon2.jpg", width: 50.0, height: 50.0, fit: BoxFit.cover,),
                const SizedBox(height: 5.0,),
                const Text("Female"),
              ],
            ),
            selected: _gender == 2,
            border: Border.all(color: Colors.grey,),
            style: _gender == 2 ? selected_Choice_Chip_3D_Style : unselected_Choice_Chip_3D_Style,
          ),
        ],
      ),
    );
  }
}