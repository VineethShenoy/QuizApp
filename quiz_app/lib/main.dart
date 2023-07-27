import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. What is the capital of France?',
      'answers': [
        {'text': 'London', 'score': -2},
        {'text': 'Berlin', 'score': -2},
        {'text': 'Paris', 'score': 10},
        {'text': 'Rome', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q2. Which country is known as the Land of the Rising Sun?',
      'answers': [
        {'text': 'China', 'score': -2},
        {'text': 'Japan', 'score': 10},
        {'text': 'India', 'score': -2},
        {'text': 'Australia', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q3. What is the largest country in the world by land area?',
      'answers': [
        {'text': 'Canada', 'score': -2},
        {'text': 'Russia', 'score': 10},
        {'text': 'Brazil', 'score': -2},
        {'text': 'USA', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. What is the official language of Brazil?',
      'answers': [
        {'text': 'Portuguese', 'score': 10},
        {'text': 'Spanish', 'score': -2},
        {'text': 'English', 'score': -2},
        {'text': 'French', 'score': -2},
      ],
    },
    {
      'questionText': 'Q5. Which ocean is to the east of Africa?',
      'answers': [
        {'text': 'Indian Ocean', 'score': 10},
        {'text': 'Atlantic Ocean', 'score': -2},
        {'text': 'Pacific Ocean', 'score': -2},
        {'text': 'Arctic Ocean', 'score': -2},
      ],
    },
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
    // ignore: avoid_print
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      // ignore: avoid_print
      print('We have more questions!');
    } else {
      // ignore: avoid_print
      print('No more questions!');
    }
  }

  @override
  void initState() {
    super.initState();
    _totalScore = 0; // Initialize _totalScore in initState
  }

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Queriverse'),
          backgroundColor: const Color(0xFF7E6DF3),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF7E6DF3).withOpacity(0.6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                : Result(_totalScore, _resetQuiz),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
