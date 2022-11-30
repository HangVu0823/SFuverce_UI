class Parse{

  static int parseIntFromJson(dynamic number, {int defaultVal = 0}) {
    // Double
    if (number is double)
      return number.round();
    // Int
    else if (number is int)
      return number;
    else if (number is String) {
      // String double
      if (number.contains('.')) {
        return double.parse(number).round();
      } else {
        // May be string int
        return int.parse(number);
      }
    }
    return defaultVal;
  }

  static double parseDoubleFromJson(dynamic number, {double fault = 0}) {
    if (number != null) {
      // Double
      if (number is double)
        return number;
      // Int
      else if (number is int)
        return number * 1.0;
      else if (number is String) {
        // String double
        if (number.contains('.')) {
          return double.parse(number);
        } else {
          // May be string int
          return int.parse(number) * 1.0;
        }
      }
    }
    return fault;
  }

}
 
 