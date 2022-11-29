void main() {
  List<String> words = [];

  _importFromExcel() async {
    var file = "/Users/torhallurbreki/Downloads/hangman/docs/drykkir.xlsx";
    var bytes = File(file).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        rowdetail.add(row.toString());
      }
    }
  }

  return String;
}
