
import 'dart:io';

import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/jc_huanjing/cccc.dart';
import 'package:slots_132/jc_gj/log.dart';


class SSCountry {
  // 美国
  static const String usCountry = "USA";

  // 巴西
  static const String brCountry = "Brazil";

  // 印尼
  static const String idCountry = "Indonesia";

  // 俄罗斯
  static const String ruCountry = "Russia";

  static bool hasUSA() {
    bool result = _huoquGuojia() == usCountry;
    // result = false;
    // ggPrint("=Country====isUSA==$result=");
    return result;
  }

  static bool hasBr() {
    bool result = _huoquGuojia() == brCountry;
    // result = false;
    // ggPrint("=Country====isUSA==$result=");
    return result;
  }

  static bool hasRu() {
    bool result = _huoquGuojia() == ruCountry;
    // result = false;
    // ggPrint("=Country====isUSA==$result=");
    return result;
  }
  static bool hasIn() {
    bool result = _huoquGuojia() == idCountry;
    // result = false;
    // ggPrint("=Country====isUSA==$result=");
    return result;
  }
  // 当前货币符号
  static String curGuojiaFuhao() {

    if(!SSABChange.isPackageB()){
      return "";
    }

    String symbol = "\$";
    if (_huoquGuojia() == brCountry) {
      symbol = "R\$";
    } else if (_huoquGuojia() == idCountry) {
      symbol = "Rp";
    } else if (_huoquGuojia() == ruCountry) {
      symbol = "₽";
    }
    return symbol;
  }

  static String _huoquGuojia() {
    String name = Platform.localeName.toLowerCase(); // e.g. "en_US", "pt_BR"
    // ssLogggg("=_huoquGuojia==name:$name=");
    if (name.startsWith('en')) {
      return usCountry;
    } else if (name.startsWith('pt')) {
      return brCountry;
    } else if (name.startsWith('id')) {
      return idCountry;
    } else if (name.startsWith('ru')) {
      return ruCountry;
    }
    return usCountry;
  }

}
