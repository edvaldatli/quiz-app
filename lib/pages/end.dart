import 'package:flutter/material.dart';
import 'package:quiz_app/pages/questionnaire.dart';

class EndPage extends StatefulWidget{
  final int correctAnswers;
  final int questionCount;

  EndPage({required this.correctAnswers, required this.questionCount});

  @override
  _EndPage createState() => _EndPage();
}

class _EndPage extends State<EndPage>{
  @override
  
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('You have fininished the Flutter quiz!',
            textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              )
            ),
            Text(
              'You have answered ${widget.correctAnswers} out of ${widget.questionCount} questions correct.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold
              ),
            ),
            ElevatedButton(
              child: Text('Take the Flutter Quiz again!'),
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