import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'input_page.dart';
import '../components/bottom_button.dart';

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
          Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 35.0),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child:
                        Text('Normal Weight', style: kResultsHeaderTextStyle),
                  ),
                  Expanded(
                    child: Text(
                      bmi.toStringAsFixed(1),
                      style: kResultsBMITextStyle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                        'You have a normal BMI. Keep doing what you are doing.',
                        style: kResultsBodyTextStyle),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'RECALCULATE')
        ],
      ),
    );
  }
}
