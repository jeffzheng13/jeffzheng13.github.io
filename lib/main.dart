import 'dart:html';

import 'package:flutter/material.dart';
import 'package:personal_website/aboutMe.dart';
import 'package:personal_website/introPage.dart';
import 'package:personal_website/projectPage.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
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
        home: introPage(),
        //initialRoute: introPage.route,
        routes: {
          introPage.route:(context) => introPage(),
          projectPage.route: (context) => projectPage(),
          aboutMe.route: (context) => aboutMe(),
        },
        );
        
  }
}
