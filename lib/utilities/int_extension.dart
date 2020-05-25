extension IntExtension on int {
  String toStringWithDigits(int digits) {
    String valueAsString = this.toString();
    int length = valueAsString.length;

    if (length >= digits) {
      return valueAsString.substring(0, digits);
    }

    while (length < digits) {
      valueAsString = '0' + valueAsString;
      length = valueAsString.length;
    }

    return valueAsString;
  }
}
