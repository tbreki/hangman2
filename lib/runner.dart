import 'dart:io';
import 'dart:js_util';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:hangman/logic.dart';
import 'package:hangman/words.dart';

import 'keyboard.dart';

void main() {
  runApp(const MaterialApp(
      home: Scaffold(
    body: Runner(),
  )));
}

class Runner extends StatefulWidget {
  const Runner({Key? key}) : super(key: key);

  @override
  State<Runner> createState() => _RunnerState();
}

class _RunnerState extends State<Runner> {
  String? get wordForDisplay => "________ ";

  get wrongGuesses => 1;

  Object get usedLetters => " ";

  String get wordToGuess => " ";

  Object get letter => " ";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(wordForDisplay!,
            style: const TextStyle(
              fontSize: 50,
              color: Colors.black54,
            )),
      ),
      Image.asset("images/hangman$wrongGuesses.png"),
      Container(
        child: TextFormField(
          onChanged: (letter) {
            if (usedLetters == letter) {
              wordForDisplay![letter!];
            }
          },
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Enter Letter',
          ),
        ),
        // todo prufa nota guess letter function
      )
    ]);
  }
}
