import 'dart:math';

import 'package:flutter/material.dart';

class CorrectWrongOverlay extends StatefulWidget {

  final bool _isCorrect;
  CorrectWrongOverlay(this._isCorrect);

  @override
  State createState() => new CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {

  Animation<double> _mAnimation;
  AnimationController _mController;

  @override
  void initState() {
    super.initState();
      _mController = new AnimationController(duration: new Duration(seconds: 2), vsync: this);
      _mAnimation = new CurvedAnimation(parent: _mController, curve: Curves.elasticOut);
      _mAnimation.addListener(() => this.setState(() {}));
      _mController.forward();
  }

  @override
  Widget build(BuildContext buildContext) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => print("You tapped the overlay"),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: new Transform.rotate(
                angle: _mAnimation.value * 2 * PI,
                child: new Icon(widget._isCorrect == true ? Icons.done : Icons.clear , size: _mAnimation.value * 80,),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
            ),
            new Text(widget._isCorrect == true ? "Correct!" : "Wrong!", style: new TextStyle(
              color: Colors.white, fontSize: 30.0
            ),)
          ],
        ),
      ),
    );
  }
}