import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'input_page.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  final String? bmiResult;
  final String? resultText;
  final String? interpretation;
  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(resultText!.toUpperCase(),
                      style: kResultsHeaderTextStyle),
                  Text(
                    bmiResult!,
                    style: kResultsBMITextStyle,
                  ),
                  Text(interpretation!,
                      textAlign: TextAlign.center,
                      style: kResultsBodyTextStyle),
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
