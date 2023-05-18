import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:url_launcher/url_launcher.dart';

class projectPage extends StatefulWidget {
  const projectPage({super.key});

  @override
  State<projectPage> createState() => _projectPageState();
}

class _projectPageState extends State<projectPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /**
     * TODO:
     * Add preview on click
     * Transition Tiger Tracker into web friendly application
     * Transition Pitt-Challenge into Flutter App?
     * Transition Schedule Builder into HTML from Nick? or remake into flutter
     */
    //List of project titles
    final List<String> titles = [
      "Lost@Pitt",
      "Pill Identifier",
      "Tiger Tracker",
      "Schedule Builder",
      // "Best Neighborhood in Pittsburgh",
      // "Research Project"
    ];

    //Project Urls go here?
    final List<Uri> urls = [
      Uri.parse("https://steelhacks-2023.github.io/Lost-and-Found-Steelhacks/#/"),
      Uri.parse(
          "https://tbeidlershenk.github.io/Pitt-Challenge/index.html")
    ];

    //Awaits for launch 
    Future<void> _launchUrl(int i) async {
      if (!await launchUrl(urls[i])) {
        throw Exception('Could not launch $urls[i]');
      }
    }

    //Creates a list of each page for page viewer
    //Length of images must equal length of titles ^^
    final List<Widget> images = [
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          fit: BoxFit.cover,
          "lostatpittscreenshot.jpg"
        ),
      ),
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
            child: Image.asset(
              "assets/schedule.jpg",
              fit: BoxFit.cover,
            ),
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
              onSelectedItem: ((index) => _launchUrl(index)),
            ),
          ),
        ])));
  }
}
