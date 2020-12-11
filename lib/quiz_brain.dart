import 'question.dart';


class QuizBrain
{
  int questionNumber = 0;

  List<Question> _questionBank = [
    Question(q: "My name is Mahesh", a: true),
    Question(q: "Solar system has 10 planets", a: false),
    Question(q: "We live on moon", a: false),
    Question(q: "This is flutter app", a: true),
    Question(q: "Google is great", a: true),
    Question(q: "This app is quite safe and true is the answer", a: true),
    Question(q: "Pigeons love bajri", a: true),
    Question(q: "Dart is dynamically typed language", a: false),
    Question(q: "India will win the 2020 world cup", a: true),
    Question(q: "Can we have some peace", a: false),
    Question(q: "Will my college start or not", a: true)
    
  ];

  String getQuestion()
  {
    return _questionBank[questionNumber].questionText;
  }

  bool getAnswer()
  {
    return _questionBank[questionNumber].questionAnswer;
  }

  void nextQuestion()
  {
    if(questionNumber < _questionBank.length - 1)
    {
      questionNumber++;
    }
    
  }
}