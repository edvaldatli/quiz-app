import 'package:flutter/material.dart';
import 'dart:async';

import 'package:quiz_app/models/questions_model.dart';
import 'package:quiz_app/pages/end.dart';

/*
  This pages handles all quiz related.
  It gets it's data from "models/questions_model.dart" that keeps all the questions.
  The datafile includes a function that returns random questions that are in the model.
  The app uses minimal asyncronous code to handle the alertbox so it doesn't cause issues with the Future.delayed function.
  When the user finishes answering a predefined amount of questions, the app displays end.dart
*/

// CONFIG

// This tells the app how many questions should be gathered.
const int amountOfQuestions = 5;

// CONFIG END

class QuestionnairePage extends StatefulWidget {
  const QuestionnairePage({super.key});

  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

Future<void> _showResultDialog(BuildContext context, bool isCorrect) {
  Completer<void> completer = Completer();

  showDialog(
    context: context,
    barrierDismissible: false, // Prevents the dialog from closing prematurely.
    builder: (context) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
        if (!completer.isCompleted) {
          completer.complete(); // Complete the Future when the dialog is closed.
        }
      });

      Color textColor = isCorrect ? Colors.green : Colors.red;
      return AlertDialog(
        title: Text(
          isCorrect ? 'Correct!' : 'Oops!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          isCorrect ? 'You are correct!' : 'That\'s not the right answer...',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
          ),
        ),
      );
    },
  );

  return completer.future;
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  List<Question> allQuestions = Question.getRandomQuestions(
      amountOfQuestions); // Choose amount of questions
  int currentQuestionIndex = 0;
  int correctAnswers = 0;

  void answerSelected(int selectedIndex) async {
    bool isAnswerCorrect =
        selectedIndex == allQuestions[currentQuestionIndex].answer;

    if (isAnswerCorrect) {
      correctAnswers++;
    }

    await _showResultDialog(
        context, isAnswerCorrect); // Wait until dialog is closed.

    if (currentQuestionIndex + 1 < allQuestions.length) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EndPage(
            correctAnswers: correctAnswers,
            questionCount: allQuestions.length,
          ),
        ),
      );
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
            const SizedBox(height: 25),
            Text(
              "Question: ${currentQuestionIndex+1}/$amountOfQuestions",
              style: const TextStyle(
                fontSize: 18
              ),
            ),
            const SizedBox(height: 5,),
            const Text(
              'Question:',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5,),
            SizedBox(
              width: 300,
              child: Text(
                allQuestions[currentQuestionIndex].question,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            ...allQuestions[currentQuestionIndex].prompts.asMap().entries.map((entry) {
              int idx = entry.key;
              String option = entry.value;
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 240,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () => answerSelected(idx),
                      child: Text(
                        option,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                ]
              );
            }).toList(),
          ],
        )
      )
    );
  }
}
