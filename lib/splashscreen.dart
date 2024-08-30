// ignore_for_file: avoid_unnecessary_containers, avoid_print, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:project2/utilites/routes.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      Navigator.pushNamed(context, Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.srcOver),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/sp.jpeg"),
                          fit: BoxFit.cover)))),
          const Positioned(
            top: 320,
            left: 100,
            child: CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage("assets/images/quiz.png"),
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            top: 530,
            left: 100,
            child: Text(
              "LET'S PLAY!!",
              style: TextStyle(
                color: Color.fromARGB(255, 252, 252, 252),
                fontWeight: FontWeight.bold,
                fontSize: 30,
                shadows: [
                  Shadow(
                    blurRadius: 10.0, // shadow blurr
                    color: Color.fromARGB(255, 202, 198, 198), // shadow color
                    offset: Offset(2.0, 2.0), // how much shadow will be shown
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
