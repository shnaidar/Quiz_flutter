import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}

// Welcome Page with Start Button
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void _navigateToQuizPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuizPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Welcome Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Quiz App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => _navigateToQuizPage(context),
              child: const Text('Start Quiz'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Quiz Page with Questions and Randomized Answers
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'answers': ['Paris', 'Berlin', 'Madrid', 'Rome'],
      'correct': 'Paris'
    },
    {
      'question': 'Who wrote "1984"?',
      'answers': ['George Orwell', 'Mark Twain', 'J.K. Rowling', 'Ernest Hemingway'],
      'correct': 'George Orwell'
    },
    {
      'question': 'What is the largest planet in our solar system?',
      'answers': ['Earth', 'Mars', 'Jupiter', 'Saturn'],
      'correct': 'Jupiter'
    },
    {
      'question': 'Which element has the chemical symbol "O"?',
      'answers': ['Oxygen', 'Hydrogen', 'Nitrogen', 'Carbon'],
      'correct': 'Oxygen'
    },
    {
      'question': 'How many continents are there?',
      'answers': ['5', '6', '7', '8'],
      'correct': '7'
    },
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;

  // Shuffle answers for each question
  List<String> _getShuffledAnswers() {
    List<String> answers = List.from(_questions[_currentQuestionIndex]['answers']);
    answers.shuffle(Random());
    return answers;
  }

  void _nextQuestion(String selectedAnswer) {
    if (selectedAnswer == _questions[_currentQuestionIndex]['correct']) {
      _score++;
    }

    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Navigate to result or finish quiz
        _showFinalScore();
      }
    });
  }

  void _showFinalScore() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Completed'),
        content: Text('Your score is $_score out of 5'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Go back to the welcome page
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${_currentQuestionIndex + 1} / ${_questions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _questions[_currentQuestionIndex]['question'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ..._getShuffledAnswers().map((answer) {
              return ElevatedButton(
                onPressed: () => _nextQuestion(answer),
                child: Text(answer),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
