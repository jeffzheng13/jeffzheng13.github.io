import 'package:flutter/material.dart';
import 'package:personal_website/ExpandingCards.dart';
import 'package:personal_website/aboutMe.dart';
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
        //'learnMore': Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const aboutMe()))
      },
      {
        'title': 'Pill Identifier',
        'subtitle':
            'Machine learning model that was trained and transformed into an application that can identify pills.',
        'image': "cutePill.png",
        'icon': Icons.medication,
        'color': Colors.red.shade400,
        //'learnMore': Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const aboutMe()))
      },
      {
        'title': 'Tiger Tracker',
        'subtitle': 'A bus tracking solution that utilizes ',
        'image': "assets/stemgearlogo.png",
        'icon': Icons.bus_alert,
        'color': Colors.yellow.shade400,
        //'learnMore': Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const aboutMe()))
      },
      {
        'title' : 'Schedule Builder',
        'subtitle' : 'An application that determines the slots where people have open time slots in a given week',
        'image' : "assets/schedule.jpg",
        'icon' : Icons.event_available,
        'color' : Colors.blue.shade400,
        //'learnMore': Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const aboutMe()))
      }
    ];

    return Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: SafeArea(
                child: 
          Center(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: ExpandingCards(
                height: 400,
                items: items,
              ),
            ),
          )
        ));
  }
}
