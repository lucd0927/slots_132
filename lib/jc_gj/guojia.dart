
import 'dart:io';


class Guojia {
  // 美国
  static const String usCountry = "USA";

  // 巴西
  static const String brCountry = "Brazil";

  static bool hasUSA() {
    bool result = _huoquGuojia() == usCountry;
    // result = false;
    // ggPrint("=Country====isUSA==$result=");
    return result;
  }

  // static bool isBR() {
  //   bool result = _getCountryFromPlatform() == brCountry;
  //   // result = true;
  //   // ggPrint("=Country====isBR==$result=");
  //   return result;
  // }

  // 当前货币符号
  static String curGuojiaFuhao() {
    String symbol = "\$";
    if (!hasUSA()) {
      symbol = "R\$";
    }
    return symbol;
  }

  static String _huoquGuojia() {
    String name = Platform.localeName.toLowerCase(); // e.g. "en_US", "pt_BR"
    // ggPrint("=x_getCountryFromPlatform==localeName:$localeName=Get.deviceLocale:${Get.deviceLocale}");
    if (name.startsWith('en')) {
      return usCountry;
    } else if (name.startsWith('pt')) {
      return brCountry;
    }
    return usCountry;
  }

}
