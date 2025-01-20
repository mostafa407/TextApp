import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testquizapp/business_logic/cubit/quiz_cubit.dart';
import 'package:testquizapp/data/repository/quizRepository.dart';
import 'package:testquizapp/data/web_services/quizServer.dart';
import 'package:testquizapp/presentation/screen/quizScreen.dart';
import 'package:testquizapp/presentation/screen/quizquestion.dart';

class AppRouter {
  late QuizRepository quizRepository;
  late QuizCubit quizCubit;

  AppRouter() {
    quizRepository = QuizRepository(QuizService());
    quizCubit = QuizCubit(quizRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "quiz":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: quizCubit,
              child: QuizHomeScreen(),
            ));
    }
  }
}
