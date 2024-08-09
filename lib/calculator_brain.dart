import 'dart:math';


class CalculatorBrain{
  CalculatorBrain({required this.height,required this.weight,});
  int height;
  int weight;

  double? _bmi;

  //to calculate BMI ratio
  String calculateBMI(){
     _bmi= weight/pow(height/100, 2); //height/100 bcs we need height in meter-sq. but we have original height in cm.
    return _bmi!.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi!>=25){
      return 'Overweight';
    }else if(_bmi!>18.5){
      return 'Normal';
    } else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi!>=25){
      return 'You have a higher than normal body weight. Try to exercise.';
    }else if(_bmi!>18.5){
      return 'You have a normal body weight. Good job!';
    } else{
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}