import 'package:flutter/material.dart';

class QuizResultsScreen extends StatelessWidget {
  final int score;

  QuizResultsScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Congratulations!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Your Score: $score',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              child: Text('Back to Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
