import 'dart:convert';
import 'dart:math';

import 'package:slots_132/jc_ad/guiyin/firebbbbbb.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class SSFBBaseData {
  static const String TGA = "SSFBBaseData";

  static int claus_spin() {
    String key = "5";
    try {
      key = PBFireBbbbbb().by(name: "claus_spin");
    } catch (e) {
      ssLogggg("======claus_spin error:$e");
    }

    if (key.isNotEmpty) {
      return int.tryParse(key) ?? 5;
    }
    return 10;
  }

  static int fee_spin() {
    String key = PBFireBbbbbb().by(name: "fee_spin");
    try {
      key = PBFireBbbbbb().by(name: "fee_spin");
    } catch (e) {
      ssLogggg("======fee_spin error:$e");
    }

    if (key.isNotEmpty) {
      return int.tryParse(key) ?? 5;
    }
    return 10;
  }

  static int human_spin() {
    String key = "10";
    try {
      key = PBFireBbbbbb().by(name: "human_spin");
    } catch (e) {
      ssLogggg("======human_spin error:$e");
    }
    if (key.isNotEmpty) {
      return int.tryParse(key) ?? 10;
    }
    return 10;
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
  static Map<String, dynamic>? _onlinJsonnnnn_int_ad_value_cash_pop;
  static Map<String, dynamic> local_int_cash_pop = {
    "cash_pop": [
      {"first": 0, "end": 100, "value": 0},
      {"first": 100, "end": 300, "value": 10},
      {"first": 300, "end": 600, "value": 30},
      {"first": 600, "end": 900, "value": 50},
      {"first": 900, "end": 1000, "value": 60},
      {"first": 900, "end": 1000000, "value": 80},
    ],
  };

  static _onlineJson_int_cash_pop({bool reset = false}) {
    if (!reset) {
      if (_onlinJsonnnnn_int_ad_value_cash_pop != null) {
        return;
      }
    }

    Map<String, dynamic> localJson = local_int_cash_pop;

    String kFirebase = "cash_pop";
    try {
      String name = kFirebase;
      String key = PBFireBbbbbb().by(name: name);
      ssLogggg("$TGA=== _onlineJson FirebaseUtils: $name string  $key");

      Map<String, dynamic> json = jsonDecode(key);
      localJson = json;
      ssLogggg("$TGA===FirebaseUtils:cash_pop $name json $json");
    } on Exception catch (e) {
      ssLogggg("$TGA===onlineJson error:$e");
    }
    _onlinJsonnnnn_int_ad_value_cash_pop = localJson;
    // ssLogggg("$TGA===FirebaseUtils:cash_pop ${jsonEncode(localJson)}");
    return localJson;
  }

  static bool int_ad_value_cash_pop() {
    _onlineJson_int_cash_pop();
    _onlinJsonnnnn_int_ad_value_cash_pop ??= local_int_cash_pop;
    var intadPointData = _onlinJsonnnnn_int_ad_value_cash_pop!["cash_pop"];
    bool showIntad = false;

    double tmpCurMoney = MainController.to.curMonnnn.value;
    bool hasSave = WithdddController.to.hasSaveCardId();
    if (hasSave) {
      tmpCurMoney = MainController.minWithdddMoney + 200;
    }
    if (intadPointData is List) {
      for (var action in intadPointData) {
        double diyi = (action['first'] ?? 0.0) * 1.0;
        double dier = (action['end'] ?? 0.0) * 1.0;

        if (diyi <= tmpCurMoney && tmpCurMoney <= dier) {
          double point = (action['value'] ?? 0) * 1.0;
          double random = Random().nextDouble() * 100;
          ssLogggg(
            "===intad_point=point:$point random:$random diyi:$diyi dier:$dier tmpCurMoney:$tmpCurMoney action:$action",
          );
          showIntad = point >= random;
          break;
        }
      }
    }
    ssLogggg("===intad_point cash pop=point showIntad：$showIntad");
    return showIntad;
  }

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
    bool hasSave = WithdddController.to.hasSaveCardId();
    if (hasSave) {
      tmpCurMoney = MainController.minWithdddMoney + 200;
    }
    if (intadPointData is List) {
      for (var action in intadPointData) {
        double diyi = (action['first'] ?? 0.0) * 1.0;
        double dier = (action['end'] ?? 0.0) * 1.0;

        if (diyi <= tmpCurMoney && tmpCurMoney <= dier) {
          double point = (action['value'] ?? 0) * 1.0;
          double random = Random().nextDouble() * 100;
          ssLogggg(
            "===intad_point=point:$point random:$random diyi:$diyi dier:$dier tmpCurMoney:$tmpCurMoney action:$action",
          );
          showIntad = point >= random;
          break;
        }
      }
    }
    ssLogggg("===intad_point=point showIntad：$showIntad");
    // showIntad = true;

    return showIntad;
  }

  static Map<String, dynamic>? _onlinJsonnnnn_win_pop;
  static Map<String, dynamic> local_int_win_pop = {
    "win_pop": {"bigwin": 2, "megawin": 3, "superwin": 4},
  };

  static _onlineJson_win_pop({bool reset = false}) {
    if (!reset) {
      if (_onlinJsonnnnn_win_pop != null) {
        return;
      }
    }

    Map<String, dynamic> localJson = local_int_win_pop;

    String kFirebase = "win_pop";
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
    _onlinJsonnnnn_win_pop = localJson;
    // ssLogggg("$TGA===FirebaseUtils: ${jsonEncode(localJson)}");
    return localJson;
  }

  static int bigwinBet() {
    _onlineJson_win_pop();
    _onlinJsonnnnn_win_pop ??= local_int_win_pop;
    var win_popdata = _onlinJsonnnnn_win_pop!["win_pop"];
    int count = 2;
    if (win_popdata is Map) {
      count = win_popdata['bigwin'] ?? 2;
    }

    return count;
  }

  static int megawinBet() {
    _onlineJson_win_pop();
    _onlinJsonnnnn_win_pop ??= local_int_win_pop;
    var win_popdata = _onlinJsonnnnn_win_pop!["win_pop"];
    int count = 3;
    if (win_popdata is Map) {
      count = win_popdata['megawin'] ?? 3;
    }

    return count;
  }

  static int superwinBet() {
    _onlineJson_win_pop();
    _onlinJsonnnnn_win_pop ??= local_int_win_pop;
    var win_popdata = _onlinJsonnnnn_win_pop!["win_pop"];
    int count = 4;
    if (win_popdata is Map) {
      count = win_popdata['superwin'] ?? 4;
    }

    return count;
  }
}
