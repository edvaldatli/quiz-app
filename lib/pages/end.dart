import 'package:flutter/material.dart';
import 'package:quiz_app/pages/questionnaire.dart';
import 'package:quiz_app/models/questions_model.dart';

class EndPage extends StatefulWidget{
  final int correctAnswers;
  final int questionCount;
  final List<Question> questionsAsked;
  final List<int> answers;


  const EndPage({super.key, required this.correctAnswers, required this.questionCount, required this.questionsAsked, required this.answers});

  @override
  EndPageState createState() => EndPageState();
}

class EndPageState extends State<EndPage>{
  bool checkAnswer(index){
    bool isCorrect = false;
    if(widget.questionsAsked[index].prompts[widget.answers[index]] == widget.questionsAsked[index].prompts[widget.questionsAsked[index].answer]){
      isCorrect = true;
    }
    return isCorrect;
  }

  @override
  
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 80,),
          const LinearProgressIndicator(
            value: 1,
            minHeight: 20,
          ),
          const SizedBox(height: 100,),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/flutter_logo.png'),
                const SizedBox(height: 30,),
                SizedBox(
                  width: 300,
                  child: Text(
                    widget.questionCount == widget.correctAnswers ? 'Perfect score!' : "You have answered ${widget.correctAnswers} out of ${widget.questionCount} questions correctly.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  padding: EdgeInsets.only(left: 10),
                  child: ListView.builder(
                    itemCount: widget.questionCount,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          height: double.infinity,
                          child: Icon(
                            checkAnswer(index) ? Icons.check_circle : Icons.cancel,
                            color: checkAnswer(index) ? Colors.green : Colors.red
                          ),
                        ),
                        title: Text(
                          widget.questionsAsked[index].question,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.questionsAsked[index].prompts[widget.questionsAsked[index].answer],
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 20
                              ),
                            ),
                            Text(
                              checkAnswer(index) ? '' : widget.questionsAsked[index].prompts[widget.answers[index]],
                              style: checkAnswer(index)
                              ? const TextStyle(
                                color: Colors.green,
                                fontSize: 16
                              )
                              : const TextStyle(
                                color: Colors.red,
                                fontSize: 16
                              )
                            )
                          ]
                        ),
                      );
                    }),
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(30, 15, 30, 15))
                  ),
                  child: const Text(
                    'Try the Flutter Quiz again!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  onPressed: () {
                    Navigator.push(context, 
                    MaterialPageRoute(
                      builder: (context) => const QuestionnairePage()));
                  }
                ),
            ]),
          ),
        ],
      ),
    );
  }
}