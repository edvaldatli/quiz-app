import 'package:flutter/material.dart';
import 'package:quiz_app/pages/questionnaire.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/2.0x/flutter_logo.png'),
            SizedBox(height: 30,),
            Text(
              'Get ready to learn Flutter!',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (builder) => 
                    QuestionnairePage()
                  )
                );
              }, child: Text("Let's go!"))
          ]
      ),)
    );
  }
}