import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Function onExecuteButton;
  String reponse;

  Answer(Function uneFonction, String uneReponse) {
    this.onExecuteButton = uneFonction;
    this.reponse = uneReponse;
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onExecuteButton,
          child: Text(reponse),
        )));
  }
}
