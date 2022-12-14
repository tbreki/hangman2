import 'package:flutter/material.dart';
import 'package:hangman/words.dart';

RunHangman() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.orangeAccent,
    body: Runner(),
  )));
}

class Runner extends StatefulWidget {
  const Runner({Key? key}) : super(key: key);

  @override
  State<Runner> createState() => _RunnerState();
}

class _RunnerState extends State<Runner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            words(),
            style: TextStyle(
              fontSize: 50,
              color: Colors.black54,
            ),
          ),
        ),
        Image.asset("images/hangman1.png"),
        Container(
          child: Center(),
        )
      ],
    );
  }
}
