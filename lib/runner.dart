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
  List<String> wordlist = [
    "vanilla",
  ];
  List usedLetters = [];
  List wordToGuess = [];
  List rightGuesses = [];
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
    } else {
      usedLetters.add(letter);

      wrongGuesses++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView(
        body: ListView.builder(
            itemCount: rightGuesses.length,
            itemBuilder: (BuildContext context, int letter) {
              return Text(rightGuesses[letter]);
            }),
        padding: const EdgeInsets.all(50.0),
      ),
      //(rightGuesses,
      //style: const TextStyle(
      //  fontSize: 25,
      //  color: Colors.black54,
      // )),
      // ),
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
            guessLetter(letter);
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
