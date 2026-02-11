import 'dart:convert';
import 'dart:math';

import 'package:slots_132/jc_ad/guiyin/firebbbbbb.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/jc_widget/floating.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';

class SSPayTable {
  static const String TGA = "SSPayTable";
  static Map<String, dynamic>? _onlinJsonnnnn;

  static Map<String, dynamic> local =SSABChange.isPackageB()?
  {
    "paytable": {
      // "WILD_x5": 70,
      // "WILD_x4": 35,
      // "WILD_x3": 18,
      "H1_x5": 70,
      "H1_x4": 35,
      "H1_x3": 18,
      "H2_x5": 55,
      "H2_x4": 28,
      "H2_x3": 12,
      "H3_x5": 55,
      "H3_x4": 28,
      "H3_x3": 12,
      "M1_x5": 35,
      "M1_x4": 18,
      "M1_x3": 7,
      "M2_x5": 35,
      "M2_x4": 18,
      "M2_x3": 7,
      "L1_x5": 18,
      "L1_x4": 7,
      "L1_x3": 5,
      "L2_x5": 18,
      "L2_x4": 7,
      "L2_x3": 5
    }
  }: {
  "paytable": {
  "WILD_x5": 400,
  "WILD_x4": 138,
  "WILD_x3": 34,
  "H1_x5": 400,
  "H1_x4": 104,
  "H1_x3": 27,
  "H2_x5": 277,
  "H2_x4": 69,
  "H2_x3": 20,
  "H3_x5": 208,
  "H3_x4": 55,
  "H3_x3": 13,
  "M1_x5": 104,
  "M1_x4": 34,
  "M1_x3": 10,
  "M2_x5": 69,
  "M2_x4": 27,
  "M2_x3": 6,
  "L1_x5": 34,
  "L1_x4": 13,
  "L1_x3": 3,
  "L2_x5": 34,
  "L2_x4": 13,
  "L2_x3": 3,
  },
  };

  static int lines() {
    _onlineJson();

    var tmpData = _onlinJsonnnnn?['paytable'];
    if (tmpData is List) {
      return tmpData.length;
    }
    return 30;
  }

  static double payBeishu(String category, int count) {
    _onlineJson();
    if (category.contains(MainController.slotNumWild)) {
      category = MainController.slotNumWild;
    }

    String key = "${category}_x${count}";
    var tmpData = _onlinJsonnnnn?['paytable']?[key];
    double tmpBeisu = 1.0;
    if (tmpData is num) {
      tmpBeisu = tmpData * 1.0;
    }
    ssLogggg("======tmpBeisu:$tmpBeisu");
    return tmpBeisu;
  }

  static _onlineJson({bool reset = false}) {
    if (!SSABChange.isPackageB()) {
      return local;
    }
    if (!reset) {
      if (_onlinJsonnnnn != null) {
        return;
      }
    }

    Map<String, dynamic> localJson = local;

    String kFirebase = "paytable";
    try {
      String name = kFirebase;
      String key = PBFireBbbbbb().by(name: name);
      ssLogggg("$TGA=== _onlineJson FirebaseUtils: $name string  $key");

      Map<String, dynamic> json = jsonDecode(key);
      localJson = json;
      ssLogggg("$TGA===FirebaseUtils: $name json $json");
    } on Exception catch (e) {
      ssLogggg("$TGA===onlineJson error:$e");
    }
    _onlinJsonnnnn = localJson;
    ssLogggg("$TGA===FirebaseUtils: ${jsonEncode(localJson)}");
    return localJson;
  }
}
