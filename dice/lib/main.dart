import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffFBE7c6),
        appBar: AppBar(
          title: Text('Dice Game'),
          backgroundColor: const Color(0xffB4F8C8),
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;
  void changeDice() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1; //1-6
      leftDiceNumber = Random().nextInt(6) + 1; //1-6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                  onPressed: () {
                    changeDice();
                  },
                  child: Image.asset('../images/dice$leftDiceNumber.png')),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                  onPressed: () {
                    changeDice();
                  },
                  child: Image.asset('../images/dice$rightDiceNumber.png')),
            ),
          ),
        ],
      ),
    );
  }
}
