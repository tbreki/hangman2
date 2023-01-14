import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'logic.dart';

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
  String? get wordForDisplay => " ";

  HangmanGame game = new HangmanGame();

  get wrongGuesses => 1;

  Object get usedLetters => " ";

  String get wordToGuess => " ";

  Object get letter => " ";

  String get rightGuesses => "";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(rightGuesses,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black54,
            )),
      ),
      Image.asset(
        "images/hangman$wrongGuesses.png",
        width: 50,
        height: 50,
      ),
      Container(
        child: TextFormField(
          onChanged: (letter) {
            // if (usedLetters == letter) {
            //   wordForDisplay![letter!];
            //   }
            game.guessLetter(letter);
            print("input $letter");
          },
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Enter Letter',
          ),
        ),
        // setja word for display i lista break up
        //hvert gisk er er strengur inni lista
        // ef guess letter.lenght = hanged .. hanged
        // todo prufa nota guess letter function
      ),
    ]);
    //todo row með wrong guesses
  }
}
