import 'dart:io';

import 'package:tame_of_thrones/caesar_cipher.dart';
import 'package:tame_of_thrones/kingdom.dart';

final NONE = 'NONE';

String runChallenge({String filePath, List<String> messages}) {
  //print('passed in params: filePath = ${filePath}, messages = ${messages}');
  var spaceTrimmedInputs = (filePath != null ? getFileContent(filePath) : messages)
      .map((e) => {e.substring(0, e.indexOf(' ')), e.substring(e.indexOf(' ') + 1).replaceAll(' ', '')}.toList());
  print('spaceTrimmedInputs = ${spaceTrimmedInputs}');
  var msgDecryptedInput = spaceTrimmedInputs.map((e) {
    e[1] = CaesarCipher.decrypt(e[1], Kingdom.valueOf(e[0])?.emblem?.toString()?.split('.')?.last?.length);
    return e;
  }).toList();
  print('msgDecryptedInput = ${msgDecryptedInput}');
  var allies = msgDecryptedInput.where((e) => isMessageMatchingTheCriteria(e)).map((e) => e[0]).toSet();
  print('allies = ${allies}');
  return allies.length > 2 ? Kingdom.SPACE.name + ' ' + allies.map((e) => e).join(' ') : NONE;
}

bool isMessageMatchingTheCriteria(List messageList) {
  var messageMap = buildOccurrenceMap(messageList[1]);
  var emblemMap = buildOccurrenceMap(Kingdom.valueOf(messageList[0])?.emblem?.toString()?.split('.')?.last);
  return emblemMap.entries.map((e) => messageMap.containsKey(e.key) && messageMap[e.key] >= e.value).reduce((value, element) => value && element);
}

Map<String, int> buildOccurrenceMap(String value) {
  var result = <String, int>{};
  value.runes.forEach((element) {
    var charCode = String.fromCharCode(element);
    if (!result.containsKey(charCode)) {
      result[charCode] = 1;
    } else {
      result[charCode] = result[charCode] + 1;
    }
  });
  return result;
}

List<String> getFileContent(String filePath) {
  return File(filePath).readAsLinesSync();
}
