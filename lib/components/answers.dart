import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String answer;
  final void Function() onPressed;

  const Answers({Key? key, required this.answer, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              primary: const Color(0xFF993399),
              textStyle: const TextStyle(
                fontSize: 20,
              )),
          onPressed: onPressed,
          child: Text(answer),
        ),
      ),
    );
  }
}
