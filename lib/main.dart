import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'quiz_brain.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

int totalCorrectAnswers = 0;
class _QuizAppState extends State<QuizApp> {

  QuizBrain quizBrain = QuizBrain();
  List<Icon> scores = [];
  

  Expanded buildButton({String value, Color color, bool actualAnswer})
  {
    return Expanded(
      child: RaisedButton(
        color: color,
        onPressed: () {
        setState(() {
  
          if(scores.length <= quizBrain.questionNumber)
          {
            bool correctAnswer = quizBrain.getAnswer();
          
            if(correctAnswer == actualAnswer)
            {
              totalCorrectAnswers++;
              scores.add(Icon(
                Icons.check,
                color: Colors.green,
                )
              );
            }
            else
            {
              scores.add(Icon(
                Icons.clear,
                color: Colors.red,
                )
              );
            }

            quizBrain.nextQuestion();
          }
          else
          {
            Alert(context: context, title: "QuizApp", desc: "You have reached the end. Your score is $totalCorrectAnswers").show();
            quizBrain.questionNumber = 0;
            totalCorrectAnswers = 0;
            scores.clear();
          }
        });
      },
        child: Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),
        ),

      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.question_answer),
        title: Text("Quiz App"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                  quizBrain.getQuestion(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic
                  ),
                  textAlign: TextAlign.center,
              ),
                ),
            ),
            buildButton(value: "True", color: Colors.greenAccent, actualAnswer: true),
            buildButton(value: "False", color: Colors.red ,actualAnswer: false),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: scores,
            )
          ],
          
        ),
      ),
    );
  }
}
