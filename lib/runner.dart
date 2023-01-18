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
    for (int i = 0; i < wordToGuess.length; i++) {
      if (rightGuesses.contains(wordToGuess[i])) {
        gameBoard.add(Text(wordToGuess[i]));
      } else {
        gameBoard.add(Text("_"));
      }
    }
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
    createGameBoard();
    return Column(children: [
      SizedBox(height: 50),
      ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        )
      ]),
      Image.asset(
        "images/hangman$wrongGuesses.png",
        width: 100,
        height: 100,
      ),
      Container(
        child: TextFormField(
          onChanged: (letter) {
            // if (usedLetters == letter) {
            //   wordForDisplay![letter!];
            //   }
            guessLetter(letter);
            setState(() {});
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
