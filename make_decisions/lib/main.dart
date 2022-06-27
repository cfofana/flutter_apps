import 'dart:math';
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter_linkify/flutter_linkify.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Ask me anything')),
          backgroundColor: const Color(0xff006064),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('../images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: AskPage(),
        ),
      ),
    );
  }
}

class AskPage extends StatefulWidget {
  const AskPage({Key? key}) : super(key: key);

  @override
  State<AskPage> createState() => _AskPageState();
}

class _AskPageState extends State<AskPage> {
  int ballNumber = 1;
  void changeBall() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1; // 1-5
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: FlatButton(
            onPressed: () {
              changeBall();
            },
            child: Center(child: Image.asset('../images/ball$ballNumber.png')),
          ),
        ),
      ],
    );
  }
}


// TODO: image attribution