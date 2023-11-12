import 'package:flutter/material.dart';
import 'package:quiz_app/pages/questionnaire.dart';

/*
  This page welcomes the user to the questionnaire.
  It displays a single button with a welcome message.
  If the user presses the button the user will start questionnaire.dart file.
*/

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('assets/images/2.0x/flutter_logo.png'),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Get ready to learn Flutter!',
          style: TextStyle(
              fontSize: 26, fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            style: const ButtonStyle(
              padding:
                  MaterialStatePropertyAll(EdgeInsets.fromLTRB(30, 15, 30, 15)),
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (builder) => const QuestionnairePage()));
            },
            child: const Text(
              "Let's go!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ))
      ]),
    ));
  }
}
