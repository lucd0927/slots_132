import 'dart:convert';
import 'dart:math';

import 'package:slots_132/jc_ad/guiyin/firebbbbbb.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';

class SSFBBaseData {
  static const String TGA = "SSFBBaseData";

  static int claus_spin() {
    String key = PBFireBbbbbb().by(name: "claus_spin");

    if (key.isNotEmpty) {
      return int.tryParse(key) ?? 5;
    }
    return 5;
  }

  static int fee_spin() {
    String key = PBFireBbbbbb().by(name: "fee_spin");

    if (key.isNotEmpty) {
      return int.tryParse(key) ?? 5;
    }
    return 3;
  }

  static int human_spin() {
    String key = PBFireBbbbbb().by(name: "human_spin");

    if (key.isNotEmpty) {
      return int.tryParse(key) ?? 10;
    }
    return 3;
  }

  static Map<String, dynamic>? _onlinJsonnnnn_int_ad_value;

  static Map<String, dynamic> local_int_ad_value = {
    "int_ad_value": [
      {"first": 0, "end": 100, "value": 0},
      {"first": 100, "end": 300, "value": 10},
      {"first": 300, "end": 600, "value": 30},
      {"first": 600, "end": 900, "value": 50},
      {"first": 900, "end": 1000, "value": 60},
      {"first": 900, "end": 1000000, "value": 80},
    ],
  };

  static _onlineJson_int_ad_value({bool reset = false}) {
    if (!reset) {
      if (_onlinJsonnnnn_int_ad_value != null) {
        return;
      }
    }

    Map<String, dynamic> localJson = local_int_ad_value;

    String kFirebase = "int_ad_value";
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
    _onlinJsonnnnn_int_ad_value = localJson;
    // ssLogggg("$TGA===FirebaseUtils: ${jsonEncode(localJson)}");
    return localJson;
  }

  static bool int_ad_value() {
    _onlineJson_int_ad_value();
    _onlinJsonnnnn_int_ad_value ??= local_int_ad_value;
    var intadPointData = _onlinJsonnnnn_int_ad_value!["int_ad_value"];
    bool showIntad = false;

    double tmpCurMoney = MainController.to.curMonnnn.value;
    if (intadPointData is List) {
      for (var action in intadPointData) {
        double diyi = (action['first'] ?? 0.0) * 1.0;
        double dier = (action['end'] ?? 0.0) * 1.0;

        if (diyi <= tmpCurMoney && tmpCurMoney <= dier) {
          double point = (action['value'] ?? 0) * 1.0;
          double random = Random().nextDouble() * 100;
          ssLogggg(
            "===intad_point=point:$point random:$random diyi:$diyi dier:$dier tmpCurMoney:$tmpCurMoney",
          );
          showIntad = point >= random;
          break;
        }
      }
    }
    ssLogggg(
      "===intad_point=point showIntad：$showIntad",
    );
    return showIntad;
  }
}
