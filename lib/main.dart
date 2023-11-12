import 'package:flutter/material.dart';

import 'pages/home.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// // ...

// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
print("Firebase initialized: ${Firebase.apps[0]}");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  

  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.black38)
          )
        )
      ),
      home: HomePage()
    );
  }
}
