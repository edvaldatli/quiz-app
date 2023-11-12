import 'dart:math';

class Question {
  final String question;
  final int answer;
  final List<String> prompts;

  Question(
      {required this.question, required this.answer, required this.prompts});

  static List<Question> questions = [
    Question(
        question: 'Which widget allows for layout in a vertical sequence?',
        answer: 2,
        prompts: ['Row', 'Container', 'Column', 'Stack']),
    Question(
        question: 'What is the primary purpose of the `StatefulWidget`?',
        answer: 1,
        prompts: [
          'To provide constant UI',
          'To create mutable state',
          'To optimize performance',
          'To integrate with APIs'
        ]),
    Question(
        question: 'What command initializes a new Flutter project?',
        answer: 0,
        prompts: [
          'flutter create',
          'flutter start',
          'flutter init',
          'flutter new'
        ]),
    Question(
        question: 'Which widget is typically used to style text in Flutter?',
        answer: 1,
        prompts: ['Container', 'TextStyle', 'StyledText', 'TextFormat']),
    Question(
        question: 'What can `ListView.builder` help with?',
        answer: 3,
        prompts: [
          'Navigating between screens',
          'Responding to gestures',
          'Creating animations',
          'Efficiently generating a large number of list items'
        ]),
    Question(
        question: 'Which widget is the root of all Flutter apps?',
        answer: 2,
        prompts: ['StatelessWidget', 'State', 'MaterialApp', 'FlutterApp']),
    Question(
        question: 'What is the primary purpose of a StatefulWidget?',
        answer: 1,
        prompts: ['UI', 'State management', 'Animations', 'Networking']),
    Question(
        question: 'Which widget provides padding?',
        answer: 0,
        prompts: ['Padding', 'Container', 'Box', 'Space']),
    Question(
        question:
            'What is the fundamental visual building block of a Flutter app?',
        answer: 1,
        prompts: ['App', 'Widget', 'Module', 'Block']),
    Question(
        question: 'Which of these is not a Flutter layout widget?',
        answer: 3,
        prompts: ['Column', 'Row', 'Stack', 'FlutterLayout']),
    Question(
        question: 'What is used to manage the lifecycle of a Flutter app?',
        answer: 2,
        prompts: [
          'LifecycleManager',
          'AppLifecycle',
          'WidgetsBindingObserver',
          'LifecycleWidget'
        ]),
    Question(
        question: 'Which widget would you use to implement a basic list?',
        answer: 1,
        prompts: ['BasicList', 'ListView', 'ScrollingList', 'ColumnList']),
    Question(
        question: 'What is the purpose of the `build` method?',
        answer: 2,
        prompts: [
          'To initiate state',
          'To listen to streams',
          'To describe the UI',
          'To manage memory'
        ]),
    Question(
        question: 'How can you retrieve text from a `TextField`?',
        answer: 1,
        prompts: [
          'Using a GlobalKey',
          'Using a TextEditingController',
          'With a Callback',
          'Through BuildContext'
        ]),
    Question(
        question: 'Which of these is NOT a Flutter package?',
        answer: 0,
        prompts: ['flutter_web', 'flutter_bloc', 'shared_preferences', 'http']),
    Question(
        question: 'Where can you import Flutter plugins?',
        answer: 3,
        prompts: [
          'android/build.gradle',
          'ios/Info.plist',
          'android/app/src/main/AndroidManifest.xml',
          'pubspec.yaml'
        ]),
    Question(
        question: 'Which method is called when a StatefulWidget is created?',
        answer: 1,
        prompts: ['onCreated', 'createState', 'onInit', 'buildState']),
    Question(
        question: 'What is the purpose of a `BuildContext`?',
        answer: 0,
        prompts: [
          'To hold metadata for widgets',
          'For animations',
          "To store the app's state",
          'To manage dependencies'
        ]),
    Question(
        question:
            'What is the main difference between `final` and `const` in Dart?',
        answer: 2,
        prompts: [
          'Scope',
          'Memory allocation',
          'Initialization time',
          'Nullability'
        ]),
    Question(
        question: 'Which widget allows for infinite scrolling?',
        answer: 3,
        prompts: ['Container', 'Column', 'Row', 'ListView.builder']),
    Question(
        question:
            "What's the recommended way to store global app state in Flutter?",
        answer: 2,
        prompts: [
          'Singleton',
          'GlobalKey',
          'State Management solutions like Provider',
          'SharedPreferences'
        ]),
    Question(
        question:
            'Which widget is used to ensure a widget sticks to the edge of the screen?',
        answer: 0,
        prompts: ['Positioned', 'Container', 'Align', 'Anchor']),
    Question(
        question:
            'Which of the following is NOT a Flutter performance profiling tool?',
        answer: 2,
        prompts: ['DevTools', 'Timeline', 'Android Studio', 'WidgetInspector']),
    Question(
        question: 'Which widget allows users to swipe away items?',
        answer: 1,
        prompts: ['SwipeList', 'Dismissible', 'SwipeToDelete', 'Draggable']),
    Question(
        question: 'Which widget is typically used for theming?',
        answer: 2,
        prompts: ['ThemeContainer', 'StyleWidget', 'Theme', 'ColorScheme']),
  ];

  // Returns all questions that are available.
  static List<Question> getAllQuestions() {
    return questions;
  }

  // This function returns random questions that are in a database.
  static List<Question> getRandomQuestions(int amountOfQuestions) {
    // int amountOfQuestions is predefined at the top of questionnaire.dart.
    Random random = Random();
    List<Question> allQuestionsCopy = List.from(getAllQuestions());
    List<Question> newListQuestions = [];

    if (amountOfQuestions > allQuestionsCopy.length) {
      // Request asks for too many questions.
      return getAllQuestions();
    }

    // Construct the new list with the random questions.
    for (var i = 0; i < amountOfQuestions; i++) {
      int randomInt = random.nextInt(allQuestionsCopy.length);
      newListQuestions.add(allQuestionsCopy[randomInt]);
      allQuestionsCopy.removeAt(randomInt);
    }

    return newListQuestions;
  }
}
