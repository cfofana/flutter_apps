import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_brain.dart';

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
  QuizBrain quizBrain = QuizBrain();

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
              quizBrain.getQuestionText(quizBrain.getQuestionNumber()),
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
                  bool correctAnswer = quizBrain
                      .getQuestionAnswer(quizBrain.getQuestionNumber());

                  if (correctAnswer == true) {
                    print("You got it right.");
                  } else {
                    print("You got it wrong.");
                  }
                  quizBrain.nextQuestion();
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
                  bool correctAnswer = quizBrain
                      .getQuestionAnswer(quizBrain.getQuestionNumber());
                  if (correctAnswer == false) {
                    print("You got it right.");
                  } else {
                    print("You got it wrong.");
                  }
                  quizBrain.nextQuestion();
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
