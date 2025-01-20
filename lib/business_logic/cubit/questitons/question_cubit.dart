import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testquizapp/business_logic/cubit/questitons/questions_state.dart';
import 'package:testquizapp/data/web_services/qusetionsservder.dart';
import 'package:testquizapp/data/model/quiz.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  final QuestionsService questionsService;

  QuestionsCubit(this.questionsService) : super(QuestionsInitial());

  Future<void> getQuestions() async {
    emit(QuestionsLoading());
    try {
      final questions = await questionsService.fetchQuestions();
      emit(QuestionsLoaded(questions));
    } catch (e) {
      emit(QuestionsError(e.toString()));
    }
  }
}

