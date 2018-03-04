import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = new Quiz([
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
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( // This is our main page
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)), //true button
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)), // false button
          ],
        ),
        overlayShouldBeVisible == true ? new CorrectWrongOverlay(
          isCorrect,
          () {
            if (quiz.length == questionNumber) {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
              return;
            }
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
        ) : new Container()
      ],
    );
  }
}