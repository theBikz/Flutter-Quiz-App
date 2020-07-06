import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'Your Score is ' + resultScore.toString();
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 30),
        ),
        FlatButton(
          color: Colors.redAccent,
          child: Text(
            'Restart Quiz!',
          ),
          onPressed: resetHandler,
        )
      ]),
    );
  }
}
