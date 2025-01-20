import 'package:testquizapp/data/model/quiz.dart';
import 'package:testquizapp/data/web_services/quizServer.dart';
import 'package:testquizapp/data/web_services/qusetionsservder.dart';
class Questionsrepository {
  final QuestionsService questionsServer;

  Questionsrepository(this.questionsServer);

  Future<List<Questions>> getQuestions() async {
    final questionsData = await questionsServer.fetchQuestions();
    if (questionsData is List<Questions>) {
      return questionsData;
    } else {
      throw Exception('Failed to parse questions data');
    }
  }
}
