import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/ExpandingCards.dart';
import 'package:personal_website/aboutMe.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:url_launcher/url_launcher.dart';

class projectPage extends StatefulWidget {
  const projectPage({super.key});
  static const String route = '/projects';

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
      Uri.parse(
          "https://steelhacks-2023.github.io/Lost-and-Found-Steelhacks/#/"),
      Uri.parse("https://tbeidlershenk.github.io/Pitt-Challenge/index.html")
    ];

    //Awaits for launch
    Future<void> _launchUrl(int i) async {
      if (!await launchUrl(urls[i])) {
        throw Exception('Could not launch $urls[i]');
      }
    }

    final List<Map<String, dynamic>> items = [
      {
        'title': 'Lost@Pitt',
        'subtitle': 'A virtual lost and found application',
        'image': "assets/lostatpittscreenshot.jpg",
        'icon': Icons.person_search,
        'color': Colors.green.shade400,
        'function': MaterialPageRoute(
            builder: (BuildContext context) => const aboutMe()),
        'webLink': Uri.parse(
            "https://steelhacks-2023.github.io/Lost-At-Pitt/"),
        'githubLink': Uri.parse(
            "https://github.com/Steelhacks-2023/Lost-and-Found-Steelhacks")
      },
      {
        'title': 'Pill Identifier',
        'subtitle':
            'Machine learning model that was trained and transformed into an application that can identify pills.',
        'image': "assets/cutePill.png",
        'icon': Icons.medication,
        'color': Colors.red.shade400,
        'function': MaterialPageRoute(
            builder: (BuildContext context) => const aboutMe()),
        'webLink': Uri.parse("https://tbeidlershenk.github.io/Pitt-Challenge/"),
        'githubLink':
            Uri.parse("https://github.com/tbeidlershenk/Pitt-Challenge")
      },
      {
        'title': 'Tiger Tracker',
        'subtitle': 'A bus tracking solution that utilizes ',
        'image': "assets/stemgearlogo.png",
        'icon': Icons.bus_alert,
        'color': Colors.yellow.shade400,
        'function': MaterialPageRoute(
            builder: (BuildContext context) => const aboutMe()),
        'githubLink':
            Uri.parse("https://github.com/jeffzheng13/tiger_track_public")
      },
      {
        'title': 'Schedule Builder',
        'subtitle':
            'An application that determines the slots where people have open time slots in a given week',
        'image': "assets/schedule.jpg",
        'icon': Icons.event_available,
        'color': Colors.blue.shade400,
        'function': MaterialPageRoute(
            builder: (BuildContext context) => const aboutMe()),
        'githubLink':
            Uri.parse("https://github.com/nickusme/SteelHacks-Schedule-Builder")
      },
      {
        'title': 'Research Publication',
        'subtitle':
            'Ever wondered strategies beginner programmers use? Read more here, a paper I collaborated on with others.',
        'image': 'assets/research.png',
        'icon': Icons.article,
        'color': Colors.purple.shade400,
        'function': MaterialPageRoute(
            builder: (BuildContext context) => const aboutMe()),
        'webLink': Uri.parse(
            "https://isnap.csc.ncsu.edu/home/public/publication/skripchuk-2023-sigcse/")
      }
    ];

    return Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: size.height / 12,
                    child: AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
                      RotateAnimatedText(
                        "Code",
                        textStyle: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      RotateAnimatedText(
                        "Build",
                        textStyle: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      RotateAnimatedText(
                        "Hack",
                        textStyle: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      RotateAnimatedText(
                        rotateOut: false,
                        "My Projects",
                        textStyle: TextStyle(fontSize: 40, color: Colors.white),
                      )
                    ]),
                  )),
              //Text("My Projects", style: TextStyle(fontSize: 30), ,),
              Text(
                "It's a work in progress :)",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              Padding(padding: EdgeInsets.all(32)),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: ExpandingCards(
                  height: 400,
                  items: items,
                ),
              ),
            ]))));
  }
}
