import 'package:flutter/material.dart';

import 'package:project2/utilites/routes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/home.jpeg"), fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      color: Color.fromARGB(255, 239, 240, 240),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.admin);
                        },
                        child: const Text("START",
                            style: TextStyle(
                                color: Color.fromARGB(255, 7, 7, 7),
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                ),
                const Text(
                  'LETS PLAY',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      color: Color.fromARGB(255, 239, 240, 240),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.quizScreen);
                        },
                        child: const Text("START",
                            style: TextStyle(
                                color: Color.fromARGB(255, 7, 7, 7),
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
