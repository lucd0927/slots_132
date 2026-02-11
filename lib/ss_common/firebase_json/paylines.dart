import 'dart:convert';
import 'dart:math';

import 'package:slots_132/jc_ad/guiyin/firebbbbbb.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/jc_widget/floating.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';

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
            [1, 7, 13, 14, 15],
            [11, 7, 3, 4, 5],
            [6, 2, 8, 14, 10],
            [6, 12, 8, 4, 10],
            [1, 7, 8, 9, 5],
            [11, 7, 8, 9, 15],
            [1, 2, 8, 14, 15],
            [11, 12, 8, 4, 5],
            [1, 12, 3, 14, 5],
            [11, 2, 13, 4, 15],
            [1, 2, 13, 4, 5],
            [11, 12, 3, 14, 15],
            [6, 2, 8, 4, 10],
            [6, 12, 8, 14, 10],
            [6, 7, 3, 9, 10],
            [6, 7, 13, 9, 10],
            [1, 12, 8, 14, 5],
            [11, 2, 8, 4, 15],
            [1, 2, 13, 14, 5],
            [11, 12, 3, 4, 15],
            [1, 7, 3, 4, 10],
            [11, 7, 13, 14, 10],
            [6, 2, 13, 4, 10],
          ],
        }
      ;

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

  static List<List<int>> paylines() {
    _onlineJson();
    var tmpData = _onlinJsonnnnn?['paylines'];
    if (tmpData is List) {
      List<List<int>> tmpData2222 = [];
      for (var item in tmpData) {
        if (item is List) {
          // List<int> line = [];
          // for(var subItem in item){
          //   if(subItem is int){
          //     line.add(subItem);
          //   }
          // }
          // tmpData2222.add(line);

          var tmpItem = item.cast<int>();
          tmpData2222.add(tmpItem);
        }
      }

      ssLogggg("=====paylines1111= tmpData2222:$tmpData2222");
      return tmpData2222;
    }
    ssLogggg("=====paylines1222=");
    return local['paylines'].cast<List<int>>();
  }
}
