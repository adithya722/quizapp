import 'package:flutter/material.dart';
import 'package:project2/admin.dart';

import 'package:project2/home.dart';
import 'package:project2/login.dart';

import 'package:project2/quiz.dart';

import 'package:project2/signup.dart';
import 'package:project2/splashscreen.dart';
import 'package:project2/utilites/routes.dart';

class Root extends StatelessWidget {
  const Root({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashscreen,
        routes: {
           Routes.splashscreen: (context) => const Splashscreen(),
          Routes.login: (context) => const Loginpage(),
          Routes.signup: (context) => const Signuppage(),
          Routes.home: (context) => const Home(),
         Routes.admin: (context) => Admin(),
            Routes.quizScreen: (context) => QuizScreen(),
        });
  }
}
