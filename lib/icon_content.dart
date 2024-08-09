import 'package:flutter/material.dart';
import 'constant.dart';


class IconContent extends StatelessWidget{
  IconContent({required this.icon,required this.label});
  IconData icon;
  String label;
  @override
  Widget build(BuildContext context){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style:
          kLabelTextStyle,
        )
      ],
    );
  }
}