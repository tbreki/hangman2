import 'dart:math';

words() {
  var list = ["vanilla", "chocolate", "strawberry", "caramel", "banana"];

  var randomItem = (list..shuffle()).first;
  return randomItem;
}
