import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int score = 0;
  int currentIndex = 0;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What should you do during an earthquake?',
      'options': ['Run outside', 'Hide under a table', 'Stand near a window'],
      'answer': 1,
    },
    {
      'question': 'During a flood, you should:',
      'options': ['Go to low ground', 'Move to high ground', 'Swim in water'],
      'answer': 1,
    },
  ];

  void checkAnswer(int selected) {
    if (selected == questions[currentIndex]['answer']) score++;
    setState(() {
      if (currentIndex < questions.length - 1) {
        currentIndex++;
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Quiz Completed'),
            content: Text('Your score: $score/${questions.length}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    score = 0;
                    currentIndex = 0;
                  });
                },
                child: Text('Restart'),
              )
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[currentIndex]['question'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ...List.generate(questions[currentIndex]['options'].length, (index) {
              return ElevatedButton(
                onPressed: () => checkAnswer(index),
                child: Text(questions[currentIndex]['options'][index]),
              );
            }),
          ],
        ),
      ),
    );
  }
}
