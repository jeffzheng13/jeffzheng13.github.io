import 'package:flutter/material.dart';

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
        Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/b_frank_w_me.JPG"),
                  fit: BoxFit.cover),
            )),
        Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.25)
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: const Text(
                    "Welcome!",
                    style: TextStyle(
                        fontFamily: 'Unbounded',
                        color: Colors.white,
                        fontSize: 50),
                  ),
                ),
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
                Padding(padding: EdgeInsets.only(top: 20, bottom: 20)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //About Me Button
                    OutlinedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10.0)),
                          side: MaterialStateProperty.resolveWith<BorderSide>(
                              (states) => BorderSide(
                                  color: Colors.white)),
                          shape:
                              MaterialStateProperty.resolveWith<OutlinedBorder>(
                                  (_) {
                            return RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60));
                          }),
                        ),
                      onPressed: null,
                      child: const Text("About Me",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),

                    //My Projects Button
                    OutlinedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10.0)),
                          side: MaterialStateProperty.resolveWith<BorderSide>(
                              (states) => BorderSide(
                                  color: Colors.white)),
                          shape:
                              MaterialStateProperty.resolveWith<OutlinedBorder>(
                                  (_) {
                            return RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60));
                          }),
                        ),
                        onPressed: (() {
                          print("pressed");
                        }),
                        child: const Text("My Projects",
                            style: TextStyle(color: Colors.white, fontSize: 20)))
                  ],
                )
              ],
            )),
      ],
    ));
  }
}
