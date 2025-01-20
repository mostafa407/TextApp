import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:testquizapp/data/model/quiz.dart';

class QuizService {
  late Dio dio;

  QuizService() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://api.jsonserve.com/',
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    );
    dio = Dio(options);
  }

  Future<List<Quiz>> getQuiz() async {
    try {
      Response response = await dio.get('Uw5CrX');
      print('Raw API Response: ${response.data}');

      if (response.data is Map<String, dynamic>) {
        var quizzes = response.data['questions'];
        if (quizzes != null && quizzes is List) {
          return quizzes
              .map((quizData) => Quiz.fromJson(quizData as Map<String, dynamic>))
              .toList();
        } else {
          print('No questions available or incorrect structure.');
          return []; // Return empty list if questions is null or incorrect
        }
      }
      return [];
    } catch (e) {
      print('Error fetching quizzes: $e');
      return Future.error('Failed to load quizzes: $e');
    }
  }
}
