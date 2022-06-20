import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
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
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];
  void checkCorrectAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      print(quizBrain.reachedEnd());
      // check to see if we reached end of quiz
      if (quizBrain.reachedEnd()) {
        Alert(
                context: context,
                title: "Finished!",
                desc: "You've reached the end of the quiz.")
            .show();
        scoreKeeper.clear();
      } else {
        if (correctAnswer == userAnswer) {
          scoreKeeper.add(
            Icon(Icons.check, color: Colors.green),
          );
        } else {
          scoreKeeper.add(
            Icon(Icons.close, color: Colors.red),
          );
        }
      }
    });
    quizBrain.nextQuestion();
  }

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
              quizBrain.getQuestionText(),
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
                checkCorrectAnswer(true);
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
                checkCorrectAnswer(false);
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
