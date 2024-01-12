import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizeBrain.getCorrectAnswer();
    setState(() {
      if (quizeBrain.isFinished() == true) {
        Alert(context: context, title: 'Finished', desc: 'End of the quize')
            .show();
        quizeBrain.reset();
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.redAccent,
            ),
          );
        }
      }

      quizeBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              quizeBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25, color: Colors.white),
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
            checkAnswer(true);
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
            checkAnswer(false);
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
