import 'package:testquizapp/data/model/quiz.dart';
import 'package:testquizapp/data/web_services/quizServer.dart';
class QuizRepository {
  final QuizService quizService;

  QuizRepository(this.quizService);

  Future<List<Quiz>> getQuiz() async {
    final quizData = await quizService.getQuiz();
    return quizData; // No need to map here, as it's already in the correct format
  }

}

// class QuizRepository {
//   late QuizService quizService;
//
//   QuizRepository(this.quizService);
//
//   Future<List<Quiz>> getQuiz() async {
//     final quizList = await quizService.getQuiz(); // List<dynamic> returned from API
//     // Map each quiz item in the list to a Quiz object
//     return quizList.map<Quiz>((quizData) {
//       return Quiz.fromJson(quizData as Map<String, dynamic>);
//     }).toList(); // Return the list of quizzes
//   }
// }
