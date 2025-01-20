import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testquizapp/business_logic/cubit/questitons/question_cubit.dart';
import 'package:testquizapp/business_logic/cubit/quiz_cubit.dart';
import 'package:testquizapp/data/repository/questionsrepository.dart';
import 'package:testquizapp/data/repository/quizRepository.dart';
import 'package:testquizapp/data/web_services/qusetionsservder.dart';
import 'package:testquizapp/data/web_services/quizServer.dart';
import 'package:testquizapp/presentation/screen/quizScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<QuizCubit>(
              create: (context) => QuizCubit(QuizRepository(QuizService()))..getQuiz(),
            ),
            BlocProvider<QuestionsCubit>(
            create: (context) => QuestionsCubit(QuestionsService())..getQuestions(),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home:  QuizHomeScreen(),
          ),
        );
      },
    );
  }
}
