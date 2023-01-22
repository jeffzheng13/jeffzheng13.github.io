import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class projectPage extends StatefulWidget {
  const projectPage({super.key});

  @override
  State<projectPage> createState() => _projectPageState();
}

class _projectPageState extends State<projectPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    //List of project titles
    final List<String> titles = [
      "Pill Identifier",
      "Tiger Tracker",
      "Schedule Builder",
      // "Best Neighborhood in Pittsburgh",
      // "Research Project"
    ];
    final List<Widget> images = [
      ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
              fit: BoxFit.cover,
              "assets/DALLE 2023-01-21 16.25.26 - clipart image of a pill with technology background.png")),
      ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: Colors.grey,
            child: Image.asset("assets/stemgearlogo.png"),
          )),
      ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Image.asset("assets/schedule.jpg", fit: BoxFit.cover,),
          ))
    ];

    return Scaffold(
        backgroundColor: Colors.greenAccent,
        body: SafeArea(
            child: Column(children: [
          Container(
            width: size.width,
            height: size.height,
            child: VerticalCardPager(
              titles: titles,
              images: images,
              textStyle: TextStyle(color: Colors.black.withOpacity(1)),
            ),
          ),
        ])));
  }
}
