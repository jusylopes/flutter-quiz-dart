import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() reload;

  const Result({Key? key, required this.score, required this.reload})
      : super(key: key);

  get result {
    if (score > 30) {
      return Column(
        children: [
          Text(
            'Parabéns!\n Você fez $score pontos',
            style: const TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
          Lottie.network(
              'https://assets1.lottiefiles.com/datafiles/VtCIGqDsiVwFPNM/data.json'),
        ],
      );
    } else {
      return Column(
        children: [
          Text(
            'Precisa melhorar!\n Você fez $score pontos',
            style: const TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
          Lottie.network(
              'https://assets10.lottiefiles.com/packages/lf20_wgujjcov.json'),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: result),
        TextButton(
            onPressed: reload,
            child: const Text(
              'Reiniciar?',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF993399),
              ),
            ))
      ],
    );
  }
}
