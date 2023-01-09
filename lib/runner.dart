import 'package:flutter/material.dart';
import 'dart:async';

RunHangman() {
  runApp(MaterialApp(
      home: Scaffold(
    body: Runner(),
  )));
}

class HangmanGame {
  List<String> wordlist = [
    "vanilla",
    "chocolate",
    "strawberry",
    "caramel",
    "banana"
  ];

  List<String> usedLetters = [];
  List<String> _wordToGuess = [" "];
  int _wrongGuesses = 0;

  StreamController<Null> _onWin = new StreamController<Null>.broadcast();
  Stream<Null> get onWin => _onWin.stream;

  StreamController<Null> _onLose = new StreamController<Null>.broadcast();
  Stream<Null> get onLose => _onLose.stream;

  StreamController<int> _onWrong = new StreamController<int>.broadcast();
  Stream<int> get onWrong => _onWrong.stream;

  StreamController<String> _onRight = new StreamController<String>.broadcast();
  Stream<String> get onRight => _onRight.stream;

  StreamController<String> _onChange = new StreamController<String>.broadcast();
  Stream<String> get onChange => _onChange.stream;

  String wordForDisplay = "";

  //HangmanGame(List<String> words) : wordList = new List<String>.from(words);
  void newGame() {
    // shuffle the word list into a random order
    wordlist.shuffle();

    // break the first word from the shuffled list into a list of letters
    _wordToGuess = wordlist.first.split('');

    // reset the wrong guess count
    _wrongGuesses = 0;

    // clear the set of guessed letters
    usedLetters.clear();

    // declare the change (new word)
    _onChange.add(wordForDisplay);
  }

  void guessLetter(String letter) {
    // store guessed letter
    usedLetters.add(letter);

    // if the guessed letter is present in the word, check for a win
    // otherwise, check for player death
    if (_wordToGuess.contains(letter)) {
      _onRight.add(letter);

      // if (isWordComplete) {
      //  _onChange.add(fullWord);
      //  _onWin.add(null);
    } else {
      _onChange.add(wordForDisplay);

      //else {
      _wrongGuesses++;

      _onWrong.add(_wrongGuesses);
    }

    //if (_wrongGuesses == hanged) {
    //  _onChange.add(fullWord);
    //  _onLose.add(null);
  }

  int get wrongGuesses => _wrongGuesses;
  List<String> get wordToGuess => _wordToGuess;
  String get fullWord => wordToGuess.join();

  // String get wordForDisplay => wordToGuess.map((String letter) =>
  // lettersGuessed.contains(letter) ? letter : "_").join();

  // check to see if every letter in the word has been guessed
  bool get isWordComplete {
    for (String letter in _wordToGuess) {
      if (!usedLetters.contains(letter)) {
        return false;
      }
    }

    return true;
  }
}

class Runner extends StatefulWidget {
  const Runner({Key? key}) : super(key: key);

  @override
  State<Runner> createState() => _RunnerState();
}

class _RunnerState extends State<Runner> {
  get wordForDisplay => " ";

  get wrongGuesses => 1;

  String? get usedLetters => " ";

  num hanged() {
    num hanged = 1 + wrongGuesses;
    return hanged;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(wordForDisplay,
              style: TextStyle(
                fontSize: 50,
                color: Colors.black54,
              )),
        ),
        Image.asset("images/hangman$hanged().png"),
        Container(
          child: Center(),
        ),
        // todo input keybord to input String!
        Text(usedLetters!),
      ],
    );
  }
}
