import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'input_page.dart';

int height = (heightInFt * 12) + heightInInches;
double bmi = (weight * 703).toDouble() / (height * height).toDouble();

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Your Result'),
          ReusableCard(
            cardColor: kActiveCardColor,
            cardChild: Column(
              children: <Widget>[
                Text('The result'),
                Text(bmi.toString()),
                Text('The result'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            margin: EdgeInsets.only(top: 10.0),
            //width: double.infinity,
            color: KBottomContainerColor,
            height: kBottomContainerHeight,
            child: Center(
              child: Text('RE-CALCULATE', style: kCalculateButtonStyle),
            ),
          ),
        ],
      ),
    );
  }
}
