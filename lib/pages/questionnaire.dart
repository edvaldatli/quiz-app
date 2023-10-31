import 'package:flutter/material.dart';

import 'package:quiz_app/models/questions_model.dart';
import 'package:quiz_app/pages/end.dart';

class QuestionnairePage extends StatefulWidget {
  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

void _showResultDialog(BuildContext context, bool isCorrect) {
  showDialog(
    context: context,
    builder: (context) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pop();
      });

      Color textColor = isCorrect ? Colors.green : Colors.red;

      return AlertDialog(
        title: Text(
          isCorrect ? 'Correct!' : 'Oops!', 
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        content: Text(
          isCorrect ? 'You are correct!' : 'That\'s not the right answer...', 
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
          )
        ),
      );
    },
  );
}

class _QuestionnairePageState extends State<QuestionnairePage>{
  List<Question> allQuestions = Question.getRandomQuestions(23); // Choose amount of questions
  int currentQuestionIndex = 0;
  int correctAnswers = 0;

  void answerSelected(int selectedIndex) {
  bool isAnswerCorrect = selectedIndex == allQuestions[currentQuestionIndex].answer;
  
  if(isAnswerCorrect){
    correctAnswers++;
  }

  if (currentQuestionIndex + 1 < allQuestions.length) {
    _showResultDialog(context, isAnswerCorrect);
    setState(() {
      currentQuestionIndex++;
    });
  } else {
    Navigator.push(context, 
    MaterialPageRoute(
      builder: (context) => EndPage(correctAnswers: correctAnswers, questionCount: allQuestions.length,)));
  }
} 

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/flutter_logo.png'),
            SizedBox(height: 25),
            Text(
              'Question:',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5,),
            Container(
              width: 300,
              child: Text(
                allQuestions[currentQuestionIndex].question,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            ...allQuestions[currentQuestionIndex].prompts.asMap().entries.map((entry) {
              int idx = entry.key;
              String option = entry.value;
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () => answerSelected(idx),
                      child: Text(
                        option,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                ]
              );
            }).toList(),
          ],
        )
      )
    );
  }
}
