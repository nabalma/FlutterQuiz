import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String libelle;

  Question(String unlibelle) {  
    this.libelle = unlibelle;
  }

  @override
  Widget build(BuildContext context) {
    return Text(libelle);
  }
}
