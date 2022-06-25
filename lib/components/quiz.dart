import 'package:flutter/material.dart';
import 'question.dart';
import 'answers.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) whenToAnswer;

  const Quiz(
      {Key? key,
      required this.questions,
      required this.selectedQuestion,
      required this.whenToAnswer})
      : super(key: key);

  bool get haveQuestionSelected {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = haveQuestionSelected
        ? questions[selectedQuestion].cast()['respostas']
        : null;

    return Column(
      children: [
        Question(text: questions[selectedQuestion]['texto'].toString()),
        ...answers.map((answer) {
          return Answers(
            answer: answer['texto'].toString(),
            onPressed: () =>
                whenToAnswer(int.parse(answer['pontos'].toString())),
          );
        }).toList(),
        //operador spread
      ],
    );
  }
}
