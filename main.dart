import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: QuizScreen());
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // List of questions with their correct answers
  List<Map<String, dynamic>> questions = [
    {"text": "Flutter is developed by Google.", "answer": true},
    {"text": "Dart is used in Flutter development.", "answer": true},
    {"text": "Flutter can only be used for Android apps.", "answer": false},
  ];

  int currentQuestionIndex = 0;

  void checkAnswer(bool userAnswer) {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Show "Quiz Completed" Dialog
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text("Quiz Completed!"),
                content: Text("You have answered all the questions."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        currentQuestionIndex = 0; // Restart the quiz
                      });
                    },
                    child: Text("Restart"),
                  ),
                ],
              ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Quiz")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[currentQuestionIndex]["text"],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => checkAnswer(true),
              child: Text("True", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => checkAnswer(false),
              child: Text("False", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
