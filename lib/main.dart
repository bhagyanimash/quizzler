import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizeBrain quizeBrain = QuizeBrain();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizePage(),
          ),
        ),
      ),
    );
  }
}

class QuizePage extends StatefulWidget {
  const QuizePage({super.key});

  @override
  State<QuizePage> createState() => _QuizePageState();
}

class _QuizePageState extends State<QuizePage> {
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              quizeBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
            fixedSize: const Size(300, 80),
          ),
          onPressed: () {
            bool correctAnswer = quizeBrain.getCorrectAnswer();
            if (correctAnswer == true) {
              print('correct');
            } else {
              print('wrong');
            }
            setState(() {
              quizeBrain.nextQuestion();
            });
          },
          child: const Text(
            'True',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.redAccent,
            fixedSize: const Size(300, 80),
          ),
          onPressed: () {
            bool correctAnswer = quizeBrain.getCorrectAnswer();
            if (correctAnswer == false) {
              print('correct');
            } else {
              print('wrong');
            }
            setState(() {
              quizeBrain.nextQuestion();
            });
          },
          child: const Text(
            'False',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      Row(
        children: scoreKeeper,
      )
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children2,
    );
  }
}
