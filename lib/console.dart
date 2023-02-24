import 'package:flutter/Material.dart';

class Console extends StatelessWidget {
  Function onConsole;

  Console(Function uneFonction) {
    this.onConsole = uneFonction;
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
        child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Color.fromARGB(125, 200, 13, 12))),
      onPressed: onConsole,
      child: Text('Console'),
    )));
  }
}
