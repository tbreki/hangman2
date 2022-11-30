words() {
  var list = ["vanilla", "chocolate", "strawberry", "caramel"];
  var randomItem = (list..shuffle()).first;
  return randomItem;
}
