import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/correct_wrong_overlay.dart';
import '../UI/question_text.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question mQuestion;
  Quiz mQuiz = new Quiz([
    new Question("Valentine's day is banned in Saudi Arabia", true),
    new Question("A slug's blood is green", true),
    new Question("Approximately one quarter of human bones are in the feet.", true),
    new Question("The total surface area of two human lungs is approximately 70 square metres.", true),
    new Question("In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", true),
    new Question("In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", false),
    new Question("It is illegal to pee in the Ocean in Portugal.", true),
    new Question("You can lead a cow down stairs but not up stairs.", false),
    new Question("Google was originally called \"Backrub\".", true),
    new Question("Buzz Aldrin\'s mother\'s maiden name was \"Moon\".", true),
    new Question("The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", false),
    new Question("No piece of square dry paper can be folded in half more than 7 times.", false),
    new Question("Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.", true)
  ]);

  String question;
  int questionNumber;
  bool isCorrect;

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => print("You answered true")),
            new QuestionText("Pizza is fake", 1),
            new AnswerButton(false, () => print("You answered false")),
          ],
        ),
        new CorrectWrongOverlay(true)
      ],
    );
  }
}