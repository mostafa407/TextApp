import 'package:flutter/foundation.dart';
import 'package:testquizapp/data/model/quiz.dart';

@immutable
abstract class QuizState{}
class QuizInitial extends QuizState{}
class QuizLoading extends QuizState{}
class QuizLoaded extends QuizState{
  final List<Quiz>quiz;

  QuizLoaded(this.quiz);
}
class QuizError extends QuizState {
  final String message;
  QuizError(this.message);
}


