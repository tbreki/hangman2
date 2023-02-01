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

  List<String> wordlist = ["vanilla"];

  List usedLetters = [];
  String wordToGuess = "vanilla";
  List<String> rightGuesses = [];
  List<String> gameBoard = [];
// telur r0ng svor
  int wrongGuesses = 1;

  // nýr leikur, shufflar lista og tekur fyrsta orð út lista.
  newGame() {
    print("newgame");
    // wordlist.shuffle();
    // wordlist.first = wordToGuess;

    print(wordToGuess);

    // return wordToGuess;
  }

// function til að sýna rétt gisk úr orði, disiplayað fyrir ofan mynd.
  createGameBoard() {
    for (int i = 0; i < wordToGuess.length; i++) {
      if (wordToGuess.contains(rightGuesses[i])) {
        gameBoard.add(rightGuesses[i]);
      } else {
        gameBoard.add(wordToGuess[0]);
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
// function til að giska á réttan staf úr orði, bæta við ef er rétt,
  //annars bæta við röng svör

  String guessLetter(String letter) {
    print("guess letter");
    if (wordToGuess.contains(letter)) {
      rightGuesses.add(letter);
      createGameBoard();
    } else {
      wrongGuesses++;
    }
    print(wordToGuess);
    return letter;
  }

// kemur error á list view, veit ekki afhv
  // virkar með venjulegu text en það vill ekki sýna lista
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 30,
      ),
      //gameBoard
      Container(
        width: 25,
        height: 25,
        child: Text(gameBoard
            .toString()), /*ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ListView.builder(
                itemCount: gameBoard.length,
                itemBuilder: (context, index) {
                  return Text(gameBoard[index]);
                },
              ),
            ]),*/
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
            guessLetter(letter);
            createGameBoard();
          },
        ),
      ),
    ]);
  }
}
