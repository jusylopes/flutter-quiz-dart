import 'package:flutter/material.dart';
import 'components/quiz.dart';
import 'components/result.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;

  final _answers = const [
    {
      'texto':
          'Em qual versão da linguagem Dart foi recebido o Operador Spread?',
      'respostas': [
        {'texto': '2.0', 'pontos': 0},
        {'texto': '2.3', 'pontos': 10},
        {'texto': '2.6', 'pontos': 0},
        {'texto': '3.0', 'pontos': 0},
      ],
    },
    {
      'texto':
          'Qual é o identificador em Dart que torna a instância de uma variável privada para a biblioteca?',
      'respostas': [
        {'texto': '-', 'pontos': 0},
        {'texto': '!', 'pontos': 0},
        {'texto': '_', 'pontos': 10},
        {'texto': '&', 'pontos': 0},
      ],
    },
    {
      'texto': 'Qual linha de código está incorreta?',
      'respostas': [
        {'texto': 'final int number;', 'pontos': 0},
        {'texto': 'int number = 10;', 'pontos': 0},
        {'texto': 'int? number;', 'pontos': 0},
        {'texto': 'var int number;', 'pontos': 10},
      ],
    },
    {
      'texto': '10 % 2 == 0 ? print(\'par\') : print(\'impar\');',
      'respostas': [
        {'texto': '0.2', 'pontos': 0},
        {'texto': 'null', 'pontos': 0},
        {'texto': 'par', 'pontos': 10},
        {'texto': 'impar', 'pontos': 0},
      ],
    },
  ];

  _answer(int score) {
    if (haveQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
    }
  }

  _reload() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  bool get haveQuestion {
    return _selectedQuestion < _answers.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
          centerTitle: true,
          backgroundColor: const Color(0xFF993399),
        ),
        body: haveQuestion
            ? Quiz(
                questions: _answers,
                selectedQuestion: _selectedQuestion,
                whenToAnswer: _answer)
            : Result(
                score: _totalScore,
                reload: _reload,
              ),
      ),
    );
  }
}
