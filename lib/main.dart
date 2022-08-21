// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:rest_api_project/example_two.dart';
import 'example_three.dart';
import 'home_screen.dart';
import 'example_four.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExampleFour()
    );
  }
}

