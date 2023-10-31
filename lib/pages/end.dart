import 'package:flutter/material.dart';

class EndPage extends StatefulWidget{
  final int correctAnswers;

  EndPage({required this.correctAnswers});

  @override
  _EndPage createState() => _EndPage();
}

class _EndPage extends State<EndPage>{
  @override
  
  Widget build(BuildContext context){
    return Scaffold(
      body: Text(widget.correctAnswers.toString()),
    );
  }
}