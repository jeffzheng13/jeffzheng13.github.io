import 'dart:html';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:ionicons/ionicons.dart';
import 'package:personal_website/introPage.dart';
import 'package:personal_website/main.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/projectPage.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class aboutMe extends StatefulWidget {
  const aboutMe({super.key});

  @override
  State<aboutMe> createState() => _aboutMeState();
}

class _aboutMeState extends State<aboutMe> with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 2));
  late final Animation<double> _animation =
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Row(
      children: [
        SizedBox(
          height: size.height,
          width: size.width / 2,
          child: FadeIn(
            duration: Duration(seconds: 2),
            child: Image.asset("assets/bingsu.jpg", fit: BoxFit.cover),
          ),
        ),
        SingleChildScrollView(
            child: Container(
                height: size.height,
                width: size.width / 2,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.fromLTRB(100, size.height / 5, 100, 0)),
                    //first box will be header
                    Container(
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          "Jeffrey Zheng",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                    //second box will be titles
                    const Text(
                      "Software Engineer | Avid Runner | Tech Enthusiast",
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                    //third description box
                    aboutMeDescription,
                    const Padding(padding: EdgeInsets.all(10)),
                    AnimatedButton(
                        width: 160,
                        height: 25,
                        animatedOn: AnimatedOn.onHover,
                        textStyle: const TextStyle(color: Colors.black, fontSize: 15),
                        borderRadius: 60,
                        borderWidth: 1,
                        transitionType: TransitionType.LEFT_TO_RIGHT,
                        selectedTextColor: Colors.black,
                        backgroundColor: Colors.grey.shade300,
                        borderColor: Colors.black,
                        text: "My Projects",
                        onPress: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const projectPage()));
                        })),

                    //contains the icons to various links
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: _onPressedGithub,
                            icon: const Icon(Ionicons.logo_github)),
                        IconButton(
                            onPressed: _onPressedLinkedin,
                            icon: const Icon(Ionicons.logo_linkedin)),
                        IconButton(
                            onPressed: _onPressedEmail,
                            icon: const Icon(Ionicons.mail)),
                        IconButton(
                            onPressed: _onPressedPhone,
                            icon: const Icon(Ionicons.call))
                      ],
                    )
                  ],
                )))
      ],
    ));
  }

  Widget aboutMeDescription = const Padding(
      padding: EdgeInsets.fromLTRB(100, 32, 100, 0),
      child: Column(children: [
        Text(
          "Hey you 🫵, thanks for visiting my webpage! You're probably someone who I know, and you've fallen for my trap of visiting my website. If you're a recruiter, I'm so sorry for my cringey intro. Now that you're here though. Here's a little about me to know me better.",
          softWrap: true,
          textAlign: TextAlign.center,
        ),
        Padding(padding: EdgeInsets.all(10)),
        Text(
          "My SWE origin story began in high school. I was tech savvy as a kid, but never really considered computer science as a field I wanted to pursue. However, working on an app in high school, I fell in love with not only the building aspect of the app, but also the debugging part of it as well. Since then, I gone on and created countless more projects. As my journey in the tech world progresses, I am curious in all branches of software development. Whether it's front-end, back-end, ML/AI, DevOps, or even mobile development, I hope to explore all these fields before having to pick a path as my career.",
          textAlign: TextAlign.center,
        ),
        Padding(padding: EdgeInsets.all(10)),
        Text(
            "Now that you're already here and you know a little about me, why don't you take a look at my projects.👇", textAlign: TextAlign.center,),
      ]));

  //actions when icons are pressed
  void _onPressedGithub() {
    launchUrl(Uri.parse("https://github.com/jeffzheng13"));
  }

  void _onPressedLinkedin() {
    launchUrl(Uri.parse("https://linkedin.com/in/jeffzheng13"));
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void _onPressedEmail() {
    launchUrl(Uri(
      scheme: "mailto",
      path: "jeffreyzheng12@gmail.com",
      query: encodeQueryParameters(<String, String>{
        'subject': 'Contact From Website',
      }),
    ));
  }

  void _onPressedPhone() {
    launchUrl(Uri(
      scheme: "tel",
      path: "18143846260",
      queryParameters: <String, String>{
        'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
      },
    ));
  }
}
