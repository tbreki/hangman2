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
  List<String> wordlist = [
    "vanilla",
  ];
  List<String> usedLetters = [];
  List<String> wordToGuess = [];
// todo hafa array right guesses sem er sýnt i text function!!
  List<String> rightGuesses = [];
  int wrongGuesses = 1;

  //HangmanGame(List<String> words) : wordList = new List<String>.from(words);
  void newGame() {
    // shuffle the word list into a random order
    wordlist.shuffle();
    print("shuffle");

    // break the first word from the shuffled list into a list of letters
    wordToGuess = wordlist.first.split('_');
    print("wordlist split");

    // reset the wrong guess count

    // clear the set of guessed letters
    usedLetters.clear();

    // declare the change (new word)
    //onChange.add(wordForDisplay);
  }

  void guessLetter(String letter) {
    // store guessed letter
    //usedLetters.add(letter);

    // if the guessed letter is present in the word, check for a win
    // otherwise, check for player death

    if (wordToGuess.contains(letter)) {
      rightGuesses.add(letter);
      // not working? rightGuesses.add(wordToGuess[letter]);
      //todo hugsanlega finna utur hvernig setja a rettan stað [letter]
      print("if loopa");
      // _onRight.add(letter);
      //todo add right guesses to list sem er wordToDisiplay

      // if (isWordComplete) {
      //  _onChange.add(fullWord);
      //  _onWin.add(null);
    } else {
      usedLetters.add(letter);
// todo gera mikklu meira simple, ef letter er rétt add rightLetter to rightGuesses = wordtodisiplay
      //todo else{ wrong guesses++
      //else {
      wrongGuesses++;

      // _onWrong.add(wrongGuesses);
    }

    //if (_wrongGuesses == hanged) {
    //  _onChange.add(fullWord);
    //  _onLose.add(null);
  }

  //String get fullWord => wordToGuess.join();

  // String get wordForDisplay => wordToGuess.map((String letter) =>
  // lettersGuessed.contains(letter) ? letter : "_").join();

  // check to see if every letter in the word has been guessed
//todo hugsanlege hægt að nota
  // bool get isWordComplete {
  //  for (String letter in wordToGuess) {
  //      return false;
  //    }
  //  }

  // return true;
  // }
}
