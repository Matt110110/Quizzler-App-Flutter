import './question.dart';

class Quiz {
  List <Question> _questions;
  var _currentQuestionIndex = -1;
  var _score = 0;
  Quiz(this._questions) {
    _questions.shuffle();
  }
  int get score => _score;
  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get questionNumber => _currentQuestionIndex + 1;
  Question get nextQuestion {
    _currentQuestionIndex++;
    if (_currentQuestionIndex >= length) return null;
    else _questions[_currentQuestionIndex];
  }

  void answer (bool isCorrect) {
    if (isCorrect) _score++;
  }
}