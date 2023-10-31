class Question{
  final String question;
  final int answer;
  final List<String> prompts;

  Question({required this.question, required this.answer, required this.prompts});

  static List<Question> questions = [
    Question(
      question: 'Which widget allows for layout in a vertical sequence?',
      answer: 2,
      prompts: ['Row', 'Container', 'Column', 'Stack']
    ),
    Question(
      question: 'What is the primary purpose of the `StatefulWidget`?',
      answer: 1,
      prompts: ['To provide constant UI', 'To create mutable state', 'To optimize performance', 'To integrate with APIs']
    ),
    Question(
      question: 'What command initializes a new Flutter project?',
      answer: 0,
      prompts: ['flutter create', 'flutter start', 'flutter init', 'flutter new']
    ),
    Question(
      question: 'Which widget is typically used to style text in Flutter?',
      answer: 1,
      prompts: ['Container', 'TextStyle', 'StyledText', 'TextFormat']
    ),
    Question(
      question: 'What can `ListView.builder` help with?',
      answer: 3,
      prompts: ['Navigating between screens', 'Responding to gestures', 'Creating animations', 'Efficiently generating a large number of list items']
    ),
  ];

  static List<Question> getAllQuestions(){
    return questions;
  }
}