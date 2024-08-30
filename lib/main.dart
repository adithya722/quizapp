// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:project2/db/userfunction.dart';
import 'package:project2/root.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDataBase();
  runApp(Root());
  
}
