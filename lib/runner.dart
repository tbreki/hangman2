import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      home: Scaffold(
    body: Runner(),
  )));
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next step.
    return TextField(
      controller: myController,
    );
  }
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

  List<String> createGameBoard() {
    for (int i = 0; i < wordToGuess.length; i++) {
      if (rightGuesses.contains(wordToGuess[i])) {
        gameBoard.add(wordToGuess[i]);
      } else {
        gameBoard.add("_");
      }
    }
    print("create gameboard");
    setState(() {
      this.gameBoard = gameBoard;
    });
    return gameBoard;
    ;
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
    createGameBoard();
    return Column(children: [
      SizedBox(height: 50),
      ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child: Center(child: Text(gameBoard.toString())),
            )
          ]),
      Image.asset(
        "images/hangman$wrongGuesses.png",
        width: 100,
        height: 100,
      ),
      Container(
        child: TextFormField(
          // gera controler

          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                var myController;
                return AlertDialog(
                  // Retrieve the text that the user has entered by using the
                  // TextEditingController.
                  content: Text(myController.text),
                );
              },
            );
          },
          /* onChanged: (letter) {
            print("guess letter 2");
            guessLetter(letter);

            setState(() {});
            createGameBoard();
            print("input $letter");
          },*/
        ),
      ),
    ]);
    //todo row með wrong guesses
  }
}
