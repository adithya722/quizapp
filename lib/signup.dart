// ignore_for_file: unused_local_variable, use_build_context_synchronously, avoid_print, valid_regexps

import 'package:flutter/material.dart';
import 'package:project2/db/models/details.dart';
import 'package:project2/db/userfunction.dart';
import 'package:project2/utilites/routes.dart';
import 'package:project2/utilites/text.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        //const Spacer(),
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
                        "SIGN IN",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // decoration: TextDecoration.underline,
                          // decorationColor: Color.fromARGB(255, 7, 7, 7),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
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
                      text: "Email",
                      iconName: Icons.email_outlined,
                      txtcontroller: email,
                      hideText: false,
                      validator: (value) {
                        print(value);
                        if (value!.isEmpty) {
                          return "Enter some text";
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'not a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextBoxWidget(
                        text: "Age",
                        iconName: Icons.person_2_rounded,
                        txtcontroller: age,
                        hideText: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter ";
                          }
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextBoxWidget(
                      text: "Password",
                      iconName: Icons.lock_outline_rounded,
                      txtcontroller: password,
                      hideText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter password";
                        } else if (value.length < 4) {
                          return 'password must have atleast 4 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          {
                            String frstnme = name.text.trim();
                            String emil = email.text.trim();
                            String age1 = age.text.trim();
                            String psword = password.text.trim();
                            print(frstnme);
                            print(emil);
                            print(age1);
                            print(psword);
                            if (frstnme.isEmpty ||
                                emil.isEmpty ||
                                age1.isEmpty ||
                                psword.isEmpty) {
                              return;
                            }
                            UserDetails details = UserDetails(
                              name: frstnme,
                              email: emil,
                              age: int.parse(age1),
                              password: psword,
                            );
                            await addDetails(details);
                            Navigator.pushNamed(context, Routes.login);
                          }
                        }
                      },
                      color: const Color.fromARGB(255, 0, 0, 0),
                      textColor: Colors.white,
                      child: const Text("Register"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.login);
                      },
                      child: const Text(
                        " Home",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
