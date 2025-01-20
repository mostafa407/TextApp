import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testquizapp/business_logic/cubit/quiz_state.dart';
import 'package:testquizapp/data/model/quiz.dart';
import 'package:testquizapp/data/repository/quizRepository.dart';

class QuizCubit extends Cubit<QuizState> {
  final QuizRepository quizRepository;
  late List<Quiz>quiz;

  QuizCubit(this.quizRepository) : super(QuizInitial());
  void getQuiz() async {
    emit(QuizLoading());
    print("State: QuizLoading");
    try {
      List<Quiz> quizList = await quizRepository.getQuiz();
      emit(QuizLoaded(quizList));
      print("State: QuizLoaded, Data: $quizList");

    } catch (e) {
      emit(QuizError(e.toString()));
      print("State: QuizError, Message: $e");

    }
  }
}