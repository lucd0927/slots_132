import 'dart:convert';
import 'dart:math';

import 'package:slots_132/jc_ad/guiyin/firebbbbbb.dart';
import 'package:slots_132/jc_gj/jc_widget/floating.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/controller.dart';

class SSPaylines {
  static const String TGA = "SSPaylines";
  static Map<String, dynamic>? _onlinJsonnnnn;

  static Map<String, dynamic> local = {
    "paylines": [
      [6, 7, 8, 9, 10],
      [1, 2, 3, 4, 5],
      [11, 12, 13, 14, 15],
      [1, 7, 13, 9, 5],
      [11, 7, 3, 9, 15],
      [6, 2, 3, 4, 10],
      [6, 12, 13, 14, 10],
      [1, 2, 8, 14, 15],
      [11, 12, 8, 4, 5],
      [1, 2, 8, 14, 15],
      [6, 12, 8, 4, 10],
      [6, 2, 8, 10, 14],
      [1, 7, 8, 9, 5],
      [1, 3, 5, 7, 9],
      [7, 9, 11, 13, 15],
      [3, 6, 7, 9, 10],
      [6, 7, 9, 10, 13],
      [1, 2, 4, 5, 13],
      [3, 11, 12, 14, 15],
      [1, 5, 12, 13, 14],
      [2, 3, 4, 11, 15],
      [3, 6, 10, 12, 14],
      [2, 4, 6, 10, 13],
      [1, 3, 5, 12, 14],
      [2, 4, 11, 13, 15],
      [2, 5, 8, 11, 14],
      [1, 4, 8, 12, 15],
      [1, 5, 8, 12, 14],
      [2, 6, 9, 13, 15],
      [3, 4, 7, 10, 11],
    ],
  };

  static _onlineJson({bool reset = false}) {
    if (!reset) {
      if (_onlinJsonnnnn != null) {
        return;
      }
    }

    Map<String, dynamic> localJson = local;

    String kFirebase = "paylines";
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
    // ssLogggg("$TGA===FirebaseUtils: ${jsonEncode(localJson)}");
    return localJson;
  }

  static List paylines() {
    _onlineJson();
    var tmpData = _onlinJsonnnnn?['paylines'];
    if (tmpData is List) {
      return tmpData;
    }

    return local['paylines'];
  }
}
