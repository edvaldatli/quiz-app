import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage()
    );
  }
}
