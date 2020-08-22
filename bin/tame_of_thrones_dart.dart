import 'package:args/args.dart';
import 'package:tame_of_thrones/tame_of_thrones_dart.dart';

const filePath = 'filePath';
const messages = 'messages';

void main(List<String> arguments) {
  var args = ArgParser().parse(arguments).rest;
  args.length == 1 ? print('${runChallenge(filePath: args[0])}') : args.forEach((e) => print('${runChallenge(filePath: e)}'));
}
