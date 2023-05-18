import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:personal_website/aboutMe.dart';
import 'package:personal_website/projectPage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

/*
TODO:
  - add fade transition 
  - add text from bottom fade in animation
*/

class introPage extends StatefulWidget {
  const introPage({super.key});

  @override
  State<introPage> createState() => _introPageState();
}

class _introPageState extends State<introPage> {
  @override
  Widget build(BuildContext context) {
    //get screen size
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        //Adds the background image
        Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/b_frank_w_me.JPG"),
                  fit: BoxFit.cover),
            )),
        //Everything else is here
        Container(
            height: size.height,
            width: size.width,

            //creates the dark filter on top of image
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.25)
                ])),
            //child contains Animated Text Title
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText("Welcome! My name is Jeff...",
                            textAlign: TextAlign.center,
                            textStyle: const TextStyle(
                                fontSize: 50, color: Colors.white),
                            speed: const Duration(milliseconds: 90)),
                      ],
                    )),

                //Consolidating text into one box
                /*
                Container(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: const Text(
                    "My name is Jeff...",
                    style: TextStyle(
                        fontFamily: 'Unbounded',
                        color: Colors.white,
                        fontSize: 50),
                  ),
                ),
                */

                const Padding(padding: EdgeInsets.only(top: 20, bottom: 20)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //About Me Button
                    Padding(padding: EdgeInsets.all(size.width / 100)),
                    OutlinedButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const projectPage()));
                      }),
                      //Animated Button adds transition, may be able to remove outlined button
                      child: AnimatedButton(
                        text: "About Me",
                        width: 150,
                        height: 30,
                        onPress: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const aboutMe()));
                        }),
                        animatedOn: AnimatedOn.onHover,
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        borderRadius: 60,
                        borderWidth: 1,
                        transitionType: TransitionType.LEFT_TO_RIGHT,
                        selectedTextColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        borderColor: Colors.white,
                      ),
                    ),

                    //My Projects Button
                    OutlinedButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const projectPage()));
                      }),
                      child: AnimatedButton(
                        text: "My Projects",
                        width: 160,
                        height: 30,
                        onPress: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const projectPage()));
                        }),
                        animatedOn: AnimatedOn.onHover,
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                        borderRadius: 60,
                        borderWidth: 1,
                        transitionType: TransitionType.LEFT_TO_RIGHT,
                        selectedTextColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        borderColor: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(size.width / 100)),
                  ],
                )
              ],
            )),
      ],
    ));
  }
}
