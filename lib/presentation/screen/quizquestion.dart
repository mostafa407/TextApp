import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testquizapp/business_logic/cubit/questitons/question_cubit.dart';
import 'package:testquizapp/business_logic/cubit/questitons/questions_state.dart';
import 'package:testquizapp/data/model/quiz.dart';
import 'package:testquizapp/presentation/screen/quizresuile.dart';

class QuizQuestionsScreen extends StatefulWidget {
  final Quiz quiz;

  QuizQuestionsScreen({required this.quiz});

  @override
  _QuizQuestionsScreenState createState() => _QuizQuestionsScreenState();
}

class _QuizQuestionsScreenState extends State<QuizQuestionsScreen> {
  late Quiz quiz;
  int score = 0;
  List<int?> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    quiz = widget.quiz;

    // Initialize selectedAnswers with null values for all questions
    selectedAnswers = List<int?>.filled(quiz.questions?.length ?? 0, null);
  }

  void calculateScore() {
    int tempScore = 0;

    if (quiz.questions != null) {
      for (int i = 0; i < quiz.questions!.length; i++) {
        var question = quiz.questions![i];

        if (question.options != null &&
            selectedAnswers[i] != null &&
            selectedAnswers[i]! < question.options!.length &&
            (question.options![selectedAnswers[i]!].isCorrect ?? false)) {
          tempScore++;
        }
      }
    }

    setState(() {
      score = tempScore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.title ?? 'Quiz Questions'),
      ),
      body: BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          if (state is QuestionsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is QuestionsLoaded) {
            if (state.questions.isEmpty) {
              return Center(child: Text('No questions available.'));
            }

            // Ensure the selectedAnswers list matches the number of questions
            if (selectedAnswers.length != state.questions.length) {
              selectedAnswers = List<int?>.filled(state.questions.length, null);
            }

            return ListView.builder(
              itemCount: state.questions.length,
              itemBuilder: (context, questionIndex) {
                var question = state.questions[questionIndex];
                if (question.options == null || question.options!.isEmpty) {
                  return Text('Invalid question or no options.');
                }
                return Card(
                  margin: EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Question: ${question.description ?? 'No question available'}",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ...question.options!.asMap().entries.map((entry) {
                          int optionIndex = entry.key;
                          var option = entry.value;
                          return RadioListTile<int?>(
                            value: optionIndex,
                            groupValue: selectedAnswers[questionIndex],
                            onChanged: (int? value) {
                              setState(() {
                                selectedAnswers[questionIndex] = value;
                              });
                            },
                            title: Text(option.description ?? 'No choice available'),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is QuestionsError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Center(child: Text('No questions found.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          calculateScore(); // Calculate dynamically
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizResultsScreen(score: score),
            ),
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
