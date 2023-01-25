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
  //HangmanGame game = HangmanGame();

  List<String> wordlist = ["vanilla"];

  List usedLetters = [];
  String wordToGuess = "";
  List<String> rightGuesses = [];
  List<String> gameBoard = [];

  int wrongGuesses = 1;

  //HangmanGame(List<String> words) : wordList = new List<String>.from(words);
  String newGame() {
    // shuffle the word list into a random order
    //  wordlist.shuffle();
    print("newgame");
    wordlist.shuffle();
    wordlist[0] = wordToGuess;
    // break the first word from the shuffled list into a list of letters
    //wordToGuess = wordlist;
    //print("wordlist split");

    // reset the wrong guess count
    return wordToGuess;
    // clear the set of guessed letters
    //usedLetters.clear();

    // declare the change (new word)
    //onChange.add(wordForDisplay);
  }

  void createGameBoard() {
    gameBoard.clear();
    for (int i = 0; i < wordToGuess.length; i++) {
      if (wordToGuess.contains(rightGuesses[i])) {
        gameBoard.add(wordToGuess[i]);
      } else {
        gameBoard.add("_");
      }
    }
    print("create gameboard");
    setState(() {
      this.gameBoard = gameBoard;
    });
  }

  @override
  void initState() {
    super.initState();
    newGame();
    createGameBoard();
  }

  String guessLetter(String letter) {
    // store guessed letter
    //usedLetters.add(letter);

    // if the guessed letter is present in the word, check for a win
    // otherwise, check for player death
    print("guess letter");
    if (wordToGuess.contains(letter)) {
      rightGuesses.add(letter);
      createGameBoard();
    } else {
      wrongGuesses++;
    }
    return letter;
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(
        height: 25,
        width: 25,
        child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ListView.builder(
                itemCount: gameBoard.length,
                itemBuilder: (context, index) {
                  return Text(gameBoard[index]);
                },
              ),
            ]),
      ),
      Image.asset(
        "images/hangman$wrongGuesses.png",
        width: 100,
        height: 100,
      ),
      Container(
        child: TextField(
          onChanged: (String letter) {
            guessLetter(letter);
          },
        ),

        //setState(() {});
        //createGameBoard();
        // print("input $value");
      ),
      Container(
          // child: FloatingActionButton(

          ),
    ]);
    //todo row með wrong guesses
  }
}
