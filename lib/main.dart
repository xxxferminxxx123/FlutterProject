import 'package:flutter/material.dart';
import 'package:flutter_application_2/main_page.dart';
import 'package:flutter_application_2/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      );

  }
}
