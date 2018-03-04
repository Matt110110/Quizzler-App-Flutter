import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {

  final String _question;
  final int _questionNum;

  QuestionText(this._question, this._questionNum);

  State createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin {

  Animation<double> _fontSizeAnimation;
  AnimationController _mController;

  @override
  void initState() {
    super.initState();
    _mController = new AnimationController(duration: new Duration(milliseconds: 500), vsync: this);
    _fontSizeAnimation = new CurvedAnimation(parent: _mController, curve: Curves.bounceOut);
    _fontSizeAnimation.addListener(() => this.setState(() {}));
    _mController.forward();
  }

  @override
  Widget build(BuildContext buildContext) {
    return new Material(
      color: Colors.white,
        child: new Padding(
          padding: new EdgeInsets.symmetric(vertical: 20.0),
          child: new Center(
            child: new Text("Statement " + widget._questionNum.toString() + " : " + widget._question,
              style: new TextStyle(fontSize: _fontSizeAnimation.value * 15),
            ),
          ),
        ),
      );
  }
}