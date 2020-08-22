import 'package:tame_of_thrones/caesar_cipher.dart';
import 'package:tame_of_thrones/kingdom.dart';
import 'package:tame_of_thrones/tame_of_thrones_dart.dart';
import 'package:test/test.dart';

void main() {
  // A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
  test('CaesarCipher Test 01', () => expect(CaesarCipher.decrypt('DEF', CaesarCipher.getEmblemLength(Kingdom.AIR.emblem)), 'ABC'));

  test('CaesarCipher Test 02', () => expect(CaesarCipher.decrypt('ROZO', CaesarCipher.getEmblemLength(Kingdom.AIR.emblem)), 'OLWL'));

  test('CaesarCipher Test 03',
      () => expect(CaesarCipher.decrypt('FAIJWJSOOFAMAU', CaesarCipher.getEmblemLength(Kingdom.LAND.emblem)), 'AVDERENJJAVHVP'));

  test(
      'CaesarCipher Test 04', () => expect(CaesarCipher.decrypt('STHSTSTVSASOS', CaesarCipher.getEmblemLength(Kingdom.ICE.emblem)), 'LMALMLMOLTLHL'));

  test('Test 01', () => expect(runChallenge(messages: ['AIR ROZO', 'LAND FAIJWJSOOFAMAU', 'ICE STHSTSTVSASOS']), 'SPACE AIR LAND ICE'));

  test('Test 02', () => expect(runChallenge(messages: ['AIR RMZM', 'LAND FAIJWJSOOFAMAU', 'ICE STHSTSTVSASOS']), NONE));

  test('Test 03', () => expect(runChallenge(messages: ['AIR RMZM', 'LAND FAJJWJSOOFAMAU', 'ICE STHSTSTVSBSOS']), NONE));

  test('Test 04', () => expect(runChallenge(messages: ['AIR ROZO', 'AIR ROZO', 'AIR ROZO']), NONE));

  test('Test 05',
      () => expect(runChallenge(messages: ['AIR OWL', 'LAND FAIJWJSOOFAMAU', 'ICE STHSTSTVSASOS', 'FIRE JXGOOMUTOO']), 'SPACE LAND ICE FIRE'));

  test(
      'Test 06',
      () => expect(runChallenge(messages: ['LAND PANDAUFSI', 'ICE MAMMOTH THVAO', 'FIRE DRAGON JXGMUT', 'AIR ZORRO', 'WATER OCTO VJAVWBZ PUS']),
          'SPACE FIRE AIR WATER'));
}
