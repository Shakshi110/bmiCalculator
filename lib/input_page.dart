import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constant.dart';
import 'calculator_brain.dart';

enum Gender{
  male,
  female
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Gender? selectedGender;
  int height=180;
  int weight=40;
  int age=15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "BMI CALCULATOR",
          style: TextStyle(fontSize: 28, color: Colors.cyan.shade50),
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender= Gender.male;
                      });
                    },
                    child: ReusableCard(colour: selectedGender==Gender.male? kActiveCardColor:kInactiveCardColor,
                      cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',)
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedGender= Gender.female;
                        });
                      },
                      child: ReusableCard(colour: selectedGender==Gender.female?kActiveCardColor:kInactiveCardColor,
                      cardChild: IconContent(icon: FontAwesomeIcons.venus,label:'FEMALE' )
                      ),
                    )),
             ]
            ),
          ),
          Expanded(
              child: ReusableCard(colour:kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Text('HEIGHT',
                      style: kLabelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                      children:<Widget> [
                         Text(height.toString(),style: kNumberTextStyle,),
                        Text('cm',style: kLabelTextStyle,)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayColor: Color(0x29EB1555) ,
                          activeTrackColor: Colors.white,
                          inactiveTrackColor:  Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555)

                          
                      ),
                      child: Slider(
                          value:height.toDouble() ,
                          min: 120,
                          max: 220,
                          onChanged: (double newValue){
                            setState(() {
                              height= newValue.round();
                            });
                          },
                      ),
                    ),
                  ],
                ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: kLabelTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(weight.toString(),style: kNumberTextStyle,),
                          Text('kg',style: kLabelTextStyle,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                         RoundIconButton(icon: FontAwesomeIcons.minus,
                         onTapping: (){
                           setState(() {
                             weight--;
                           });
                         },
                         ),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                          onTapping: (){
                            setState(() {
                              weight++;
                            });
                          },
                          ),
                        ],
                      )
                    ],
                  ),
                  ),),
                Expanded(child: ReusableCard(colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('AGE',style: kLabelTextStyle,),
                     Text(age.toString(),style: kNumberTextStyle,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         RoundIconButton(
                             icon: FontAwesomeIcons.minus,
                             onTapping: (){
                               setState(() {
                                 age--;
                               });
                             }),
                         RoundIconButton(
                             icon: FontAwesomeIcons.plus,
                             onTapping: (){
                               setState(() {
                                 age++;
                               });
                             }),
                       ],
                     )
                   ],
                  ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              CalculatorBrain cal= CalculatorBrain(height: height, weight: weight);
              Navigator.push(context,
                  MaterialPageRoute(
                      builder:(context)=>ResultPage(
                        bmiResult: cal.calculateBMI() ,
                        resultText: cal.getResult(),
                        interpretation: cal.getInterpretation(),
                      )));
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom:10),
              child: Container(
                child: Center(
                  child: Text('CALCULATE',
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

class RoundIconButton extends StatelessWidget{
  RoundIconButton({required this.icon, required this.onTapping});
   final  IconData icon;
    final Function() onTapping;
  @override
  Widget build(BuildContext context){
    return RawMaterialButton(
      child: Icon(icon,color: Colors.white,),
      onPressed: onTapping,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56
      ),
    //  elevation: 6, //to show effect as lifted from screen
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: Color(0xff4C4f5E),

    );
  }
}