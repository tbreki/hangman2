import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
// word listi og listar fyrir function
  String Result = "_______";
  List<String> rightGuesses = [];

  List<String> wordlist = ["vanilla"];

  String wordToGuess = "vanilla";
  //List<String> inputs = [];

// telur r0ng svor
  int wrongGuesses = 1;

  String get letter => "";

// nýr leikur, shufflar lista og tekur fyrsta orð út lista.
  newGame() {
    print("newgame");
// wordlist.shuffle();
// wordlist.first = wordToGuess;

    print(wordToGuess);

// return wordToGuess;
  }

  @override
  void initState() {
    super.initState();
    newGame();
  }

// function til að giska á réttan staf úr orði, bæta við ef er rétt,
// annars bæta við röng svör
  String guessLetter(String letter) {
    print("guess letter");
    if (wordToGuess.contains(letter)) {
      rightGuesses.add(letter);
      Temp(letter);
    } else {
      wrongGuesses++;
    }
    print(wordToGuess);

    return letter;
  }

  void Temp(String letter) {
    print("Temp");
    List<String> correctLetters = wordToGuess.split("");

    for (int i = 0; i <= correctLetters.length - 1; i++) {
      if (letter == correctLetters[i]) {
        print(correctLetters[i]);
        Result = Result.replaceRange(i, i + 1, letter);
      }
    }
    print(Result);
    print(rightGuesses);
  }

  void input(String letter) {
    List<String> lettersList = letter.split("");
    for (String letter in lettersList) {
      Temp(letter);
      guessLetter(letter);
    }
    lettersList.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 30,
      ),
//gameBoard
      Center(
        child: Text(
          Result,
        ),
      ),
//hangedMan
      Image.asset(
        "images/hangman$wrongGuesses.png",
        width: 100,
        height: 100,
      ),
//text input
      Container(
        child: TextField(
          onChanged: (String letter) {
            setState(() {
              input(letter);
              Temp(letter);
              guessLetter(letter);
            });

            //Temp(letter);
            // setState(() {
            //   guessLetter(letter);
            //  });
            //   setState(() {});
          },
        ),
      ),
    ]);
  }
}
