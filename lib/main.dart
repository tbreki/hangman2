import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white54,
          body: Container(
            child: Center(
                child: Text(
              textAlign: TextAlign.center,
              "HANGMAN",
              style: TextStyle(
                fontSize: 50,
                color: Colors.black54,
              ),
            )),
          ))));
}
