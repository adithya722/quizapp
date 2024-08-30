import 'package:flutter/material.dart';
import 'package:project2/db/models/details.dart';
import 'package:project2/db/userfunction.dart';
import 'package:project2/utilites/routes.dart';
import 'package:project2/utilites/text.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/black.jpeg"),
                  fit: BoxFit.cover),
            ),
            child: Form(
              key: _formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                    ),
                    const Align(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // decoration: TextDecoration.underline,
                          // decorationColor: Color.fromARGB(255, 71, 69, 69),
                          fontSize: 53,
                          fontStyle: FontStyle.italic,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0, // shadow blur
                              color: Color.fromARGB(
                                  255, 255, 255, 255), // shadow color
                              offset: Offset(
                                  2.0, 2.0), // how much shadow will be shown
                            ),
                          ],
                          color: Color.fromARGB(255, 4, 4, 4),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // const Spacer(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    TextBoxWidget(
                      text: "Name",
                      iconName: Icons.person,
                      txtcontroller: name,
                      hideText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextBoxWidget(
                      text: "Password",
                      iconName: Icons.remove_red_eye_outlined,
                      txtcontroller: password,
                      hideText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter some text";
                        } 
                        // else if (!RegExp("^(?=.{8,32}\$)(?=.*[a-z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*")
                        // .hasMatch(value)) {
                          
                        //   return 'not a valid password';
                        // }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.8,
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signup);
                        },
                        child: const Text(
                          "forget password?",
                          style: TextStyle(
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          {
                            final usrname = name.text.trim();
                            final pwd = password.text.trim();
                            dynamic users = await getAllDetails();
                           

                            users.forEach((details) {
                              UserDetails user = UserDetails.fromMap(details);
                              // ignore: avoid_print
                              print(
                                  "user username:${user.name}\n password:${user.password}");
                              if (user.name == usrname &&
                                  user.password == pwd) {
                                Navigator.pushNamed(context, Routes.home,
                                    arguments: details);
                              }
                            });
                          }
                        }
                      },
                      color: const Color.fromARGB(255, 4, 3, 2),
                      textColor: const Color.fromARGB(255, 255, 255, 255),
                      child: const Text("login"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.signup);
                      },
                      child: const Text("signup",
                      style: TextStyle(
                        color: Colors.black
                      ),),
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
