import 'package:flutter/material.dart';
import 'package:testquizapp/data/model/quiz.dart';
import 'dart:async';

import 'package:testquizapp/presentation/screen/quizquestion.dart';

 class QuizHomeScreen extends StatefulWidget {
   @override
   _QuizHomeScreenState createState() => _QuizHomeScreenState();
 }
 class _QuizHomeScreenState extends State<QuizHomeScreen> {
   late Quiz quiz = Quiz();
  @override
  void initState() {
    super.initState();
    // Navigate to Home Screen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizQuestionsScreen(quiz: quiz ?? Quiz()), // Default fallback
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo or Animation
            Icon(Icons.quiz, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'Quiz App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:testquizapp/business_logic/cubit/quiz_cubit.dart';
// import 'package:testquizapp/business_logic/cubit/quiz_state.dart';
// import 'package:testquizapp/data/model/quiz.dart';
// import 'package:testquizapp/presentation/screen/quizquestion.dart';
//
// class QuizHomeScreen extends StatefulWidget {
//   @override
//   _QuizHomeScreenState createState() => _QuizHomeScreenState();
// }
// class _QuizHomeScreenState extends State<QuizHomeScreen> {
//   late Quiz quiz;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Start Quiz')),
//       body: Center(
//         child: ElevatedButton(onPressed: () {
//           Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//             return QuizQuestionsScreen(quiz: quiz,);
//           },));
//         }, child:Text('Start Quiz'), ),
//       )
//       // BlocBuilder<QuizCubit, QuizState>(
//       //   builder: (context, state) {
//       //     if (state is QuizLoading) {
//       //       return Center(child: CircularProgressIndicator());
//       //     } else if (state is QuizLoaded) {
//       //       return ListView.builder(
//       //         itemCount: state.quiz.length ?? 0,
//       //         itemBuilder: (context, index) {
//       //           Quiz quiz = state.quiz[index];
//       //           return Card(
//       //             margin: EdgeInsets.all(16),
//       //             child: ListTile(
//       //               title: Text(quiz.topic ?? 'No Title'),
//       //               subtitle: Text(quiz.description ?? 'No Description'),
//       //               trailing: ElevatedButton(
//       //                 onPressed: () {
//       //                   Navigator.push(
//       //                     context,
//       //                     MaterialPageRoute(
//       //                       builder: (context) => QuizQuestionsScreen(quiz: quiz),
//       //                     ),
//       //                   );
//       //                 },
//       //                 child: Text('Start Quiz'),
//       //               ),
//       //             ),
//       //           );
//       //         },
//       //       );
//       //     } else if (state is QuizError) {
//       //       return Center(child: Text(state.message));
//       //     } else {
//       //       return Center(child: Text('No quizzes available.'));
//       //     }
//       //   },
//       // ),
//     );
//   }
// }
//
