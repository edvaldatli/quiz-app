import 'package:flutter/material.dart';
import 'package:quiz_app/pages/questionnaire.dart';

class EndPage extends StatefulWidget{
  final int correctAnswers;
  final int questionCount;

  const EndPage({super.key, required this.correctAnswers, required this.questionCount});

  @override
  EndPageState createState() => EndPageState();
}

class EndPageState extends State<EndPage>{
  @override
  
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/flutter_logo.png'),
            const SizedBox(height: 30,),
            const SizedBox(
              width: 300,
              child: Text('You have fininished the Flutter quiz!',
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: 300,
              child: Text(
                'You have answered ${widget.correctAnswers} out of ${widget.questionCount} questions correctly.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
              child: const Text('Take the Flutter Quiz again!'),
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => QuestionnairePage()));
              }
            ),
        ]),
      ),
    );
  }
}