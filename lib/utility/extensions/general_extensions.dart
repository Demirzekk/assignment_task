import 'dart:developer' as devtools show log;
import 'dart:math' as math;

import 'package:intl/intl.dart';

 
import '../../network/service_config.dart';
import '../enums/service_config_enums.dart';

///Image path extension
extension ImagePathToSVGX on String {
  String get toSvg => "assets/app_icons/$this.svg".toString();
}

extension ImagePathToPngX on String {
  String get toPng => "assets/app_icons/$this.png".toString();
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
}

 

 
 