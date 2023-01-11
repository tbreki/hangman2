import 'package:hangman/words.dart';
import 'dart:core';
import 'dart:async';

//int hanGd() {
//int wrongGuesses = 0;
//int hanged = 1;

//int sum = wrongGuesses + hanged;

//return sum;
//}
class HangmanGame {
  List<String> usedLetters = [""];
  List<String> wordToGuess = [" "];

  int wrongGuesses = 1;

  final StreamController<void> _onWin = StreamController<void>.broadcast();
  Stream<void> get onWin => _onWin.stream;

  final StreamController<void> _onLose = StreamController<void>.broadcast();
  Stream<void> get onLose => _onLose.stream;

  final StreamController<int> _onWrong = StreamController<int>.broadcast();
  Stream<int> get onWrong => _onWrong.stream;

  final StreamController<String> _onRight =
      StreamController<String>.broadcast();
  Stream<String> get onRight => _onRight.stream;

  final StreamController<String> _onChange =
      StreamController<String>.broadcast();
  Stream<String> get onChange => _onChange.stream;

  String wordForDisplay = "___________";

  //HangmanGame(List<String> words) : wordList = new List<String>.from(words);
  void newGame() {
    // shuffle the word list into a random order
    wordlist.shuffle();

    // break the first word from the shuffled list into a list of letters
    wordToGuess = wordlist.first.split('_');

    // reset the wrong guess count

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
    if (wordToGuess.contains(letter)) {
      _onRight.add(letter);

      // if (isWordComplete) {
      //  _onChange.add(fullWord);
      //  _onWin.add(null);
    } else {
      _onChange.add(wordForDisplay);

      //else {
      wrongGuesses++;

      _onWrong.add(wrongGuesses);
    }

    //if (_wrongGuesses == hanged) {
    //  _onChange.add(fullWord);
    //  _onLose.add(null);
  }

  String get fullWord => wordToGuess.join();

  // String get wordForDisplay => wordToGuess.map((String letter) =>
  // lettersGuessed.contains(letter) ? letter : "_").join();

  // check to see if every letter in the word has been guessed
  bool get isWordComplete {
    for (String letter in wordToGuess) {
      if (!usedLetters.contains(letter)) {
        return false;
      }
    }

    return true;
  }
}
