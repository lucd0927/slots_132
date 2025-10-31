import 'dart:convert';
import 'dart:math';

import 'package:slots_132/jc_ad/guiyin/firebbbbbb.dart';
import 'package:slots_132/jc_gj/jc_widget/floating.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/controller.dart';

class SSPayTable {
  static const String TGA = "SSPayTable";
  static Map<String, dynamic>? _onlinJsonnnnn;

  static Map<String, dynamic> local =
  {
  "paytable": {
  "WILD_x5": 300,  // Wild符号本身连线，支付最高奖励
  "WILD_x4": 150,
  "WILD_x3": 75,

  "H1_x5": 300,    // 高价值符号1 (金发女精灵)
  "H1_x4": 150,
  "H1_x3": 75,

  "H2_x5": 225,    // 高价值符号2 (男精灵A)
  "H2_x4": 115,    // 故意设置一些变化
  "H2_x3": 50,

  "H3_x5": 225,    // 高价值符号3 (男精灵B)
  "H3_x4": 115,
  "H3_x3": 50,

  "M1_x5": 150,    // 中价值符号1 (姜饼人)
  "M1_x4": 75,
  "M1_x3": 30,

  "M2_x5": 150,    // 中价值符号2 (圣诞袜)
  "M2_x4": 75,
  "M2_x3": 30,

  "L1_x5": 75,     // 低价值符号1 (雪花A)
  "L1_x4": 30,
  "L1_x3": 20,     // 最低奖励

  "L2_x5": 75,     // 低价值符号2 (雪花B)
  "L2_x4": 30,
  "L2_x3": 20
  }
  };

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

  static double _payBeishu(String key){
    _onlineJson();
    var tmpData = _onlinJsonnnnn?['paytable']?[key];
    if(tmpData is num){
      return tmpData * 1.0;
    }
    return 1.0;
  }




}
