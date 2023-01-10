import 'dart:developer' as devtools show log;
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../network/service_config.dart';
import '../enums/service_config_enums.dart';

///Image path extension
extension ImagePathToSVGX on String {
  String get toSvg => "assets/$this.svg".toString();
}

extension ImagePathToPngX on String {
  String get toPng => "assets/$this.png".toString();
}

///Console Log extension
extension ProviderLogX on Object {
  void log() => devtools.log(toString());
}

//Iterable object random element
extension RandomElementIterableX<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

//Iterable object random element
extension RandomElementListX<T> on List<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

//Api path extension
extension ServiceConfigX on ServiceConfigEnum {
  String get urlToString {
    switch (this) {
      case ServiceConfigEnum.serverUrl:
        return ServisConfig.serverUrl;
      case ServiceConfigEnum.serverUrl2:
        return ServisConfig.serverUrl2;
    }
  }
}

extension DateFormatX on String {
  String dateFormatWithHour() =>
      DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(this));
  String dateFormatWithoutHour() =>
      DateFormat('dd/MM/yyyy').format(DateTime.parse(this));
  String dateFormatJustHour() =>
      DateFormat('HH:mm').format(DateTime.parse(this));
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension StarsNameGenX on int {
  String? get starsIndexToNamed {
    switch (this) {
      case 0:
        return "Çok kötü";
      case 1:
        return "Kötü";
      case 2:
        return "Orta";
      case 3:
        return "İyi";
      case 4:
        return "Çok iyi";
    }
    return null;
  }
}
