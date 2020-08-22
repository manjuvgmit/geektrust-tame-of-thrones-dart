import 'emblem.dart';

class Kingdom {
  static final Kingdom SPACE = Kingdom('SPACE', Emblem.GORILLA);
  static final Kingdom LAND = Kingdom('LAND', Emblem.PANDA);
  static final Kingdom WATER = Kingdom('WATER', Emblem.OCTOPUS);
  static final Kingdom ICE = Kingdom('ICE', Emblem.MAMMOTH);
  static final Kingdom AIR = Kingdom('AIR', Emblem.OWL);
  static final Kingdom FIRE = Kingdom('FIRE', Emblem.DRAGON);

  String name;
  Emblem emblem;

  Kingdom(this.name, this.emblem);

  static Kingdom valueOf(String name) {
    if (SPACE.name == name) {
      return SPACE;
    } else if (LAND.name == name) {
      return LAND;
    } else if (WATER.name == name) {
      return WATER;
    } else if (ICE.name == name) {
      return ICE;
    } else if (AIR.name == name) {
      return AIR;
    } else if (FIRE.name == name) {
      return FIRE;
    } else {
      return null;
    }
  }
}
