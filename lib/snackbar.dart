import 'package:flutter/material.dart';
import 'package:hangman/words.dart';

class HangmanGame {
  static const int hanged = 6
}


RunHangman() {
  runApp(MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.orangeAccent,
          body: Container(
            child: Center(
                child: Text(
              words(),
              style: TextStyle(
                fontSize: 50,
                color: Colors.black54,
              ),
            )),
          ))));
}
