import 'package:tame_of_thrones/emblem.dart';

class CaesarCipher {
  static String encrypt(String input, int cipher) {
    var retValue = StringBuffer();
    input.runes
        .map((e) => String.fromCharCode(e))
        .map((e) => e == e.toUpperCase() ? (e.codeUnitAt(0) + cipher - 65) % 26 + 65 : (e.codeUnitAt(0) + cipher - 97) % 26 + 97)
        .map((e) => String.fromCharCode(e))
        .forEach((e) => retValue.write(e));
    //print('input: ${input}, cipher: ${cipher}, decrypt: ${retValue.toString()}');
    return retValue.toString();
  }

  static String decrypt(String input, int cipher) {
    var retValue = StringBuffer();
    input.runes
        .map((e) => String.fromCharCode(e))
        .map((e) => e == e.toUpperCase() ? (e.codeUnitAt(0) - cipher + 65) % 26 + 65 : (e.codeUnitAt(0) - cipher + 97) % 26 + 97)
        .map((e) => String.fromCharCode(e))
        .forEach((e) => retValue.write(e));
    //print('input: ${input}, cipher: ${cipher}, decrypt: ${retValue.toString()}');
    return retValue.toString();
  }

  static int getEmblemLength(Emblem emblem) {
    return emblem.toString().split('.').last.length;
  }
}
