import 'package:hangman/words.dart';
import 'dart:core';
import 'dart:async';

class HangmanGame {
  static const int hanged = 6;

  final Set<String> lettersGuessed = <String>{};
}
