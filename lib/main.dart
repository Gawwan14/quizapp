import 'package:flutter/material.dart';
import 'package:quizapp/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainQuiz(),
    );
  }
}

class MainQuiz extends StatelessWidget {
  const MainQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Padding(
        padding: EdgeInsets.all(20.0),
        child: QuizScreen(),
      )),
    );
  }
}

QuizBrain quizBrain = QuizBrain();

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Icon> scoreKeeper = [];
  int correctAnswerList = 0;
  int wrongAnswers=0;
  void checkAnswer(int userAnswer) {
    int correctAnswerIndex = quizBrain.getCorrectAnswerIndex();
    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          title: 'Quiz Finished',
          desc:
          'You\'ve completed the quiz.\nCorrect Answers: $correctAnswerList\nWrong Answers: $wrongAnswers',
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
        correctAnswerList = 0;
        wrongAnswers = 0;
      } else if (userAnswer == correctAnswerIndex) {
        correctAnswerList++;
        scoreKeeper.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        wrongAnswers++;
        scoreKeeper.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        ...quizBrain.getOptions().asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.all(15),
              ),
              onPressed: () {
                checkAnswer(index);
              },
              child: Text(
                option,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          );
        }).toList(),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}