import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Who is the President of India?',
      'answerText': [
        {'text': 'Narendara Modi', 'score': 0},
        {'text': 'Ramnath Kovind', 'score': 10},
        {'text': 'Bipin Kuriakose', 'score': 0},
        {'text': 'Karunjith', 'score': 0}
      ],
    },
    {
      'questionText': 'Who is the Chief Minister of Kerala?',
      'answerText': [
        {'text': 'Narendar Jeevan', 'score': 0},
        {'text': 'Pinarayi Vijayan', 'score': 10},
        {'text': 'Akshai', 'score': 0},
        {'text': 'Ananthu', 'score': 0}
      ],
    },
    {
      'questionText': 'Who is the Captain of Indian Cricket Team?',
      'answerText': [
        {'text': 'MS Dhoni', 'score': 0},
        {'text': 'Rohit Sharma', 'score': 0},
        {'text': 'KL Rahul', 'score': 0},
        {'text': 'Virat Kohli', 'score': 10}
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more Questions');
    } else {
      print('No more Qusetions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: MyApp(),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Quiz",
            style: TextStyle(fontFamily: 'RobotoMono', fontSize: 25),
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
        backgroundColor: Colors.indigo[100],
      ),
    );
  }
}
