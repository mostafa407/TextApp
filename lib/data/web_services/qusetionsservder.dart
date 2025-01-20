import 'package:testquizapp/data/model/quiz.dart';
import 'package:dio/dio.dart';

class QuestionsService {
  final Dio dio = Dio();

  Future<List<Questions>> fetchQuestions() async {
    final url = 'https://api.jsonserve.com/Uw5CrX/?=questions';
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        var questionsList = response.data['questions'] as List<dynamic>;
        return questionsList
            .map((e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to fetch questions');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
