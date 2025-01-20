import 'package:flutter/cupertino.dart';
import 'package:testquizapp/data/model/quiz.dart';

@immutable
abstract class QuestionsState{}
class QuestionsInitial extends QuestionsState{}
class QuestionsLoading extends QuestionsState{}
class QuestionsLoaded extends QuestionsState{
  late final List<Questions>questions;

  QuestionsLoaded(this.questions);
}
class QuestionsError extends QuestionsState {
  final String message;
  QuestionsError(this.message);
}
