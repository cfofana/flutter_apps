import 'dart:math';

class CalculatorBrain {
  final int? heightInFt;
  final int? heightInInches;
  var totalHeight;
  final int? weight;
  late double _bmi;
  CalculatorBrain({this.heightInFt, this.heightInInches, this.weight});

  String calculateBMI() {
    totalHeight = (heightInFt! * 12) + heightInInches!;
    _bmi = (weight! * 703) / pow(totalHeight, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 18.5) {
      return "Underweight";
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return "Normal";
    } else if (_bmi >= 25.0 && _bmi <= 29.9) {
      return "Overweight";
    } else if (_bmi >= 30.0 && _bmi <= 34.9) {
      return "Obese";
    } else if (_bmi >= 35 && _bmi <= 39.9) {
      return "Severely obese";
    } else {
      return "Morbidly obese";
    }
  }

  String getInterpretation() {
    if (_bmi < 18.5) {
      return "Your BMI shows that you are underweight. It would do you good to eat a bit more and gain some pounds.";
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return "Your BMI shows that you are at a normal weight for your height. Keep doing what you are doing.";
    } else if (_bmi >= 25.0 && _bmi <= 29.9) {
      return "Your BMI shows that you are overweight. It would do you good to shed some pounds and exercise.";
    } else if (_bmi >= 30.0 && _bmi <= 34.9) {
      return "Your BMI shows that you are obese. It would do you good to eat less, shed pounds and exercise.";
    } else if (_bmi >= 35 && _bmi <= 39.9) {
      return "Your BMI shows that you are severely obese. Take action as soon as possible and get your health back in check. Lose weight and exericse. Be strict with it.";
    } else {
      return "Your BMI shows that you are morbidly obese. It's critical for you to lose weight. Your life might depend on it.";
    }
  }
}
