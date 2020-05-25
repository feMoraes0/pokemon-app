extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String camelCase() {
    List splittedString = this.split('-');
    String result = '';
    for (String splitString in splittedString) {
      result += splitString.capitalize();
      result += ' ';
    }
    return result;
  }
}
