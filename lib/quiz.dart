import 'package:flutter/Material.dart';

import './answer.dart';
import './question.dart';
import './console.dart';

class Picture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 150,
        child: Image.network(
            'https://i5.walmartimages.com/asr/a776b4c7-d7ae-4297-925e-1ab319079676.edaf40d27c471368d6d2667b27bb34fa.jpeg'));
  }
}


  void onConsole() {
    print('OnConsole');
  }

class Quiz extends StatelessWidget {

  List<Map<String,Object>> questions;
  int questionIndex;
  Function onButtonPreviews;
  Function onButtonNext;
  Function onReponse;

  Quiz({List<Map<String,Object>> questions, int questionIndex, Function onButtonPreviews, Function onButtonNext, Function onReponse}){
    this.questions = questions;
    this.questionIndex = questionIndex;
    this.onButtonPreviews = onButtonPreviews;
    this.onButtonNext = onButtonNext;
    this. onReponse = onReponse;
  }


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        questions.elementAt(questionIndex)['libelle'],
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color.fromARGB(255, 55, 3, 244)),
      ),
      Question(questions.elementAt(questionIndex)['libelle']),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ElevatedButton(
            onPressed: onButtonPreviews, child: Text('<< Precedente')),
        ElevatedButton(onPressed: onButtonNext, child: Text('Suivante >>')),
      ]),
      Picture(),
      Column(
        children: [
        //  Console(onConsole),
          ...(questions.elementAt(questionIndex)['reponses'] as List<Map<String,Object>>)
              .map((reponse) {
            return Answer(()=>onReponse(reponse['scoreReponse']), reponse['textReponse']);
          }),
        ],
      )
    ]);
  }
}
