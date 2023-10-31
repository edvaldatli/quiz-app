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
            Image.asset('assets/images/flutter_logo.png'),
            SizedBox(height: 30,),
            Container(
              width: 300,
              child: Text('You have fininished the Flutter quiz!',
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 300,
              child: Text(
                'You have answered ${widget.correctAnswers} out of ${widget.questionCount} questions correctly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 30,),
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