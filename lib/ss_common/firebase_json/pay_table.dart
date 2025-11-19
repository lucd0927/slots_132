import 'dart:convert';
import 'dart:math';

import 'package:slots_132/jc_ad/guiyin/firebbbbbb.dart';
import 'package:slots_132/jc_gj/jc_widget/floating.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';

class SSPayTable {
  static const String TGA = "SSPayTable";
  static Map<String, dynamic>? _onlinJsonnnnn;

  static Map<String, dynamic> local =
  {
    "paytable": {
      "WILD_x5": 70,
      "WILD_x4": 35,
      "WILD_x3": 18,
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
