import 'dart:html';

import 'package:flutter/material.dart';
import 'package:personal_website/introPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Jeffrey Zheng | Software Engineer | Tech Enthusiast",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Unbounded'),
        home: introPage());
  }
}
