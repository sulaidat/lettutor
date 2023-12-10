List<String> properSpit(String s) {
  List<String> list = [];
  var arr = s.split(',');
  for (var element in arr) {
    if (element.trim() != "") {
      list.add(element.trim());
    }
  }
  return list;
}
