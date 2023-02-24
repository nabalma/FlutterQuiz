import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/resultat.dart';

import './console.dart';
import './question.dart';
import './resultat.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var reponseCountIndex = 0;
  var totalScore = 0;

  void onButtonNext() {
    setState(() {
      if (questionIndex >= 0 && questionIndex < questions.length - 1) {
        questionIndex++;
      }
    });
  }

  void onButtonPreviews() {
    setState(() {
      if (questionIndex > 0 && questionIndex <= questions.length - 1) {
        questionIndex--;
      }
    });
  }

  void onReponse(int score) {
    reponseCountIndex++;

    totalScore += score;
  }

  void onReset() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
      reponseCountIndex = 0;
    });
  }

  var questions = [
    {
      'id': 1,
      'libelle': 'Combien y a t-il de sept (7) entre 0 et 100 ?',
      'reponses': [
        {'textReponse': 'A-11', 'scoreReponse': 0},
        {'textReponse': 'B-15', 'scoreReponse': 0},
        {'textReponse': 'C-20', 'scoreReponse': 20}
      ]
    },
    {
      'id': 2,
      'libelle': 'De quel pays provient la groseille chinoise ?',
      'reponses': [
        {'textReponse': 'A-Maroc', 'scoreReponse': 0},
        {'textReponse': 'B-Nouvelle Zélande', 'scoreReponse': 20},
        {'textReponse': 'C-Chine', 'scoreReponse': 0},
        {'textReponse': 'D-Japon', 'scoreReponse': 0},
      ]
    },
    {
      'id': 3,
      'libelle': 'Combien de temps a duré la guerre de cent ans ?',
      'reponses': [
        {'textReponse': 'A-99 ans', 'scoreReponse': 0},
        {'textReponse': 'B-100 ans', 'scoreReponse': 0},
        {'textReponse': 'C-Plus de 100 ans', 'scoreReponse': 20}
      ]
    },
    {
      'id': 4,
      'libelle': 'Quel est le prénom du roi George VI',
      'reponses': [
        {'textReponse': 'A-Albert', 'scoreReponse': 20},
        {'textReponse': 'B-Georges', 'scoreReponse': 0},
        {'textReponse': 'C-Richard', 'scoreReponse': 0},
        {'textReponse': 'D-Godefroy', 'scoreReponse': 0}
      ]
    },
    {
      'id': 5,
      'libelle': 'Quelle couleur a la boîte noire d\'avion de ligne ?',
      'reponses': [
        {'textReponse': 'A-Bleu', 'scoreReponse': 0},
        {'textReponse': 'B-Rouge', 'scoreReponse': 0},
        {'textReponse': 'C-Orange,Jaune', 'scoreReponse': 20},
        {'textReponse': 'D-Noire', 'scoreReponse': 0}
      ]
    },
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('My First App')),
            body: reponseCountIndex < questions.length
                ? Quiz(
                    questions: questions,
                    questionIndex: questionIndex,
                    onButtonPreviews: onButtonPreviews,
                    onButtonNext: onButtonNext,
                    onReponse: onReponse)
                : Resultat(totalScore,onReset)));
  }
}
