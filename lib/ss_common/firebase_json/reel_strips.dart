import 'dart:convert';
import 'dart:math';

import 'package:slots_132/jc_ad/guiyin/firebbbbbb.dart';
import 'package:slots_132/jc_gj/jc_widget/floating.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';

class SSReelStrips {
  static const String TGA = "ReelStrips";
  static Map<String, dynamic>? _onlinJsonnnnn;

  static Map<String, dynamic> local =
  {
  "reel_strips": {
  "Reel1": [
  "M1", "M1", "WILD", "M2", "M2", "WILD", "H1", "M1", "M1", "KEY",
  "M2", "M2", "WILD", "L1", "M1", "M1", "H2", "M2", "M2", "WILD",
  "M1", "M1", "WILD", "M2", "M2", "H3", "M1", "M1", "KEY", "M2",
  "M2", "WILD", "L2", "M1", "M1", "WILD", "M2", "M2", "H1", "M1",
  "M1", "WILD", "M2", "M2", "KEY", "M1", "M1", "WILD", "M2", "M2"
  ],
  "Reel2": [
  "M1", "M1", "WILD", "M2", "M2", "WILD", "H2", "M1", "M1", "KEY",
  "M2", "M2", "WILD", "L2", "M1", "M1", "H3", "M2", "M2", "WILD",
  "M1", "M1", "WILD", "M2", "M2", "H1", "M1", "M1", "KEY", "M2",
  "M2", "WILD", "L1", "M1", "M1", "WILD", "M2", "M2", "H2", "M1",
  "M1", "WILD", "M2", "M2", "KEY", "M1", "M1", "WILD", "M2", "M2"
  ],
  "Reel3": [
  "WILD", "M1", "M1", "M2", "M2", "WILD", "H3", "M1", "M1", "KEY",
  "WILD", "M2", "M2", "L1", "M1", "M1", "H1", "M2", "M2", "WILD",
  "WILD", "M1", "M1", "M2", "M2", "H2", "M1", "M1", "KEY", "M2",
  "WILD", "M2", "L2", "M1", "M1", "WILD", "M2", "M2", "H3", "M1",
  "WILD", "M1", "M2", "M2", "KEY", "M1", "M1", "WILD", "M2", "M2"
  ],
  "Reel4": [
  "M1", "KEY", "M2", "WILD", "H1", "L1", "M1", "M1", "H2", "M2",
  "M2", "WILD", "KEY", "M1", "L2", "H3", "M2", "WILD", "M1", "M1",
  "KEY", "M2", "M2", "WILD", "H1", "L1", "M1", "KEY", "H2", "M2",
  "WILD", "M1", "L2", "H3", "M2", "WILD", "M1", "M1", "KEY", "M2",
  "M2", "WILD", "H1", "L1", "M1", "KEY", "H2", "M2", "WILD", "M1"
  ],
  "Reel5": [
  "H1", "M1", "KEY", "M2", "L1", "WILD", "H2", "M1", "KEY", "M2",
  "L2", "WILD", "H3", "M1", "KEY", "M2", "L1", "WILD", "H1", "M1",
  "KEY", "M2", "L2", "WILD", "H2", "M1", "KEY", "M2", "L1", "WILD",
  "H3", "M1", "KEY", "M2", "L2", "WILD", "H1", "M1", "KEY", "M2",
  "L1", "WILD", "H2", "M1", "KEY", "M2", "L2", "WILD", "H3", "M1"
  ]
  }
  };

  static _onlineJson({bool reset = false}) {
    if (!reset) {
      if (_onlinJsonnnnn != null) {
        return;
      }
    }

    Map<String, dynamic> localJson = local;

    String kFirebase = "reel_strips";
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

  static List<String> reel1ImgName() {
    return _reelImgName(key: "Reel1");
  }

  static List<String> reel2ImgName() {
    return _reelImgName(key: "Reel2");
  }

  static List<String> reel3ImgName() {
    return _reelImgName(key: "Reel3");
  }

  static List<String> reel4ImgName() {
    return _reelImgName(key: "Reel4");
  }

  static List<String> reel5ImgName() {
    return _reelImgName(key: "Reel5");
  }

  static List<String> defaultImgName = MainController.defaultImgName;

  static List<String> _reelImgName({required String key}) {
    _onlineJson();
    var reel_stripsData = _onlinJsonnnnn?['reel_strips'];
    int startPosition = defaultImgName.length - 3;
    if (startPosition <= 0) {
      startPosition = 0;
    }
    int rwwa = startPosition;
    int rssa2 = startPosition + 1;
    int raaa3 = startPosition + 2;
    String img1 = defaultImgName[rwwa];
    String img2 = defaultImgName[rssa2];
    String img3 = defaultImgName[raaa3];

    List<String> reel1s = [img1, img2, img3];
    if (reel_stripsData != null && reel_stripsData[key] != null) {
      List<String> tmpReel = (reel_stripsData[key] as List).cast<String>();
      ssLogggg("=====tmpReel:$tmpReel==");
      int startPosition2 = Random().nextInt(tmpReel.length);

      if (startPosition2 + 3 >= tmpReel.length) {
        startPosition2 = tmpReel.length - 3;
      }

      if (startPosition2 <= 0) {
        startPosition2 = 0;
      }
      rwwa = startPosition2;

      int ra = startPosition2;
      int ra2 = startPosition2 + 1;
      int ra3 = startPosition2 + 2;

      reel1s = [];
      img1 = tmpReel[ra]?.toString()??img1;
      img2 = tmpReel[ra2]?.toString()??img2;
      img3 = tmpReel[ra3]?.toString()??img3;
      // img1 = MainController.slotNumWild;
      // img2 = MainController.slotNumWild;
      // img3 = MainController.slotNumWild;
      if (img1.contains(MainController.slotNumWild)) {
        img1 = MainController.slotNumWild1;
        if (img2.contains(MainController.slotNumWild)) {
          img2 = MainController.slotNumWild2;
          if (img3.contains(MainController.slotNumWild)) {
            img3 = MainController.slotNumWild3;
          }
        } else if (img3.contains(MainController.slotNumWild)) {
          img3 = MainController.slotNumWild2;
        }
      } else if (img2.contains(MainController.slotNumWild)) {
        img2 = MainController.slotNumWild1;
        if (img3.contains(MainController.slotNumWild)) {
          img3 = MainController.slotNumWild2;
        }
      } else if (img3.contains(MainController.slotNumWild)) {
        img3 = MainController.slotNumWild1;
      }

      reel1s.add(img1);
      reel1s.add(img2);
      reel1s.add(img3);
      // reel1s = [ MainController.slotNumWild1,img2, img3];
      // reel1s = [ MainController.slotNumWild1,MainController.slotNumWild2, img3];
      // reel1s = [ img1,MainController.slotNumWild1,MainController.slotNumWild2, ];
      // reel1s = [ MainController.slotNumWild1,MainController.slotNumWild2, MainController.slotNumWild3];
    }

    ssLogggg("===rwwa2:$rwwa=$img1 $img2 $img3");
    return reel1s;
  }
}
