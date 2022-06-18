import 'package:flutter/material.dart';

void main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffA8A9AD),
          title: Center(child: Text('Quiz')),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('../images/watercolor_background.jpg'),
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'You can lead a cow down the stairs but not up?',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Center(
            child: Text(
              questions[questionNumber],
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                primary: Colors.white,
                textStyle: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                // they picked true
                setState(() {
                  if (questionNumber <= 2) {
                    questionNumber++;
                  } else {
                    print('You reached the end.');
                  }
                });
              },
              child: Text("True"),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                primary: Colors.white,
                textStyle: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                //they picked false
                setState(() {
                  scoreKeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.red,
                    ),
                  );
                });
              },
              child: Text('False'),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
