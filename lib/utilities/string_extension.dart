extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String camelCase() {
    List splitedString = this.split('-');
    String result = '';
    for (String splitString in splitedString) {
      result += splitString.capitalize();
      result += ' ';
    }
    return result;
  }
}
