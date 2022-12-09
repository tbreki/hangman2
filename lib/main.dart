import 'package:flutter/material.dart';
import 'package:hangman/snackbar.dart';
import 'package:hangman/words.dart';
import 'dart:async';
import 'dart:html';

class HangmanGame {
  static const int hanged = 6
}


void main() {
  runApp(MaterialApp(
      home: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              runApp(RunHangman());
            },
            label: const Text('START'),
            icon: const Icon(Icons.thumb_up),
            backgroundColor: Colors.blue[900],
          ),
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
