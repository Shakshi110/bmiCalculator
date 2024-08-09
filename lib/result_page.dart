import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget{
ResultPage({required this.bmiResult,required this.resultText,required this.interpretation});
  final  String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR',
          style: TextStyle(fontSize: 28, color: Colors.cyan.shade50),)
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Your Result',
                  style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold),),
              )),
          Expanded(
            flex: 6,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(),
                    style: kResultTextStyle,),
                  Text(bmiResult,
                    style: kBMITextStyle,),
                  Text(interpretation,
                    textAlign: TextAlign.center,
                    style: kBMIInterpretation,)
                ],
              ),
            ),
            ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
                },
            child: Padding(
              padding: const EdgeInsets.only(bottom:10),
              child: Container(
                child: Center(
                  child: Text('RE-CALCULATE',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ),),
                ),
                height: 40,
                color: Color(0xFFEB1555),
              ),
            ),
          )
        ],
      ),
    );
  }
}