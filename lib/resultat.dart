import 'package:flutter/Material.dart';

class Resultat extends StatelessWidget {
  int totalScore;
  var decisionColor;
  Function onReset;

  Resultat(int totalScore, Function onReset) {
    this.totalScore = totalScore;
    this.onReset = onReset;
  }

  String get decisionFinale {
    String decision;

    if (totalScore < 60) {
      decision = 'Vous avez échoué au test !';
      decisionColor = Colors.red;
    } else {
      decision = 'Vous êtes admis au test !';
      decisionColor = Colors.green;
    }
    return decision;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        totalScore >= 60
            ? Icon(Icons.assignment_turned_in_rounded,
                size: 40, color: Colors.green)
            : Icon(Icons.assignment_turned_in_rounded,
                size: 40, color: Color.fromARGB(255, 246, 33, 10)),
        Text(
          'Vous avez terminé le quiz !',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text('Votre Résultat :'),
        Text(totalScore.toString() + '%',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(decisionFinale,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: decisionColor)),
        ElevatedButton(onPressed: onReset, child: Text('Rejouer'),),
      ]),
    );
  }
}
