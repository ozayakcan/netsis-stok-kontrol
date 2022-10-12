import 'package:decimal/decimal.dart';

class Degiskenler {
  static int parseInt({
    Object? degisken,
    int varsayilan = 0,
  }) {
    return int.tryParse(degisken != null ? degisken.toString() : "0") ??
        varsayilan;
  }

  static Decimal parseDecimal({
    Object? degisken,
    Decimal? varsayilan,
  }) {
    varsayilan = varsayilan ?? Decimal.parse("0.00");
    return Decimal.tryParse(degisken != null ? degisken.toString() : "0.00") ??
        varsayilan;
  }

  static bool parseBool({
    Object? degisken,
  }) {
    return (degisken != null ? degisken.toString() : "false").toLowerCase() ==
            "true"
        ? true
        : false;
  }

  static String parseString({
    Object? degisken,
  }) {
    return degisken != null ? degisken.toString() : "";
  }
}
