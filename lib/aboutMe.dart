import 'dart:html';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:ionicons/ionicons.dart';
import 'package:personal_website/introPage.dart';
import 'package:personal_website/main.dart';
import 'package:flutter/material.dart';
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
        Container(
          height: size.height,
          width: size.width / 2,
          child: FadeIn(
            duration: Duration(seconds: 2),
            child: Image.asset("assets/bingsu.jpg", fit: BoxFit.cover),
          ),
        ),
        Container(
            height: size.height,
            width: size.width / 2,
            alignment: Alignment.center,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(100, size.height / 5, 100, 0)),
                //first box will be header
                Container(
                    padding: EdgeInsets.all(5),
                    child: const Text(
                      "Jeffrey Zheng",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                //second box will be titles
                Text("Software Engineer | Avid Runner | Tech Enthusiast"),
                //third description box
                aboutMeDescription,
                //contains the icons to various links
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: _onPressedGithub,
                          icon: Icon(Ionicons.logo_github)),
                      IconButton(
                          onPressed: _onPressedLinkedin,
                          icon: Icon(Ionicons.logo_linkedin)),
                      IconButton(
                          onPressed: _onPressedEmail,
                          icon: Icon(Ionicons.mail)),
                      IconButton(
                          onPressed: _onPressedPhone, icon: Icon(Ionicons.call))
                    ],
                  ),
                )
              ],
            ))
      ],
    ));
  }

  Widget aboutMeDescription = const Padding(
      padding: EdgeInsets.all(32),
      child: Text("My About Me Page -- Work in Progress ;)"));

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
      path: "jeffreyzheng12@gmail",
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
