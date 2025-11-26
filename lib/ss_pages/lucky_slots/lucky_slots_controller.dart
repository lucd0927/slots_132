import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slots_132/jc_gj/jc_widget/roller_list/roller_list.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_gj/num_e.dart';
import 'package:slots_132/ss_pages/lucky_slots/lucky_slots.dart';

class LuckySlotsController extends GetxController {
  static LuckySlotsController get to => Get.find();

  final firstRoller = GlobalKey<RollerListState>();
  final secondRoller = GlobalKey<RollerListState>();
  final thirdRoller = GlobalKey<RollerListState>();
  final fourthRoller = GlobalKey<RollerListState>();

  int location1 = 1;
  int location2 = 1;
  int location3 = 1;
  int location4 = 1;

  List<String> roller1 = ["6", "7", "8", "1", "2", "3", "4", "5", "9", "0"];
  List<String> roller2 = ["7", "8", "1", "2", "5", "6", "3", "4", "9", "0"];
  List<String> roller4 = ["2", "3", "4", "9", "0", "5", "6", "7", "8", "1"];

  List<List<String>> get rollerData => [
    roller1,
    roller2,
    [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
    roller4,
  ];

  var money = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    double tmpMmm = _cardMonnn();

    money = tmpMmm.obs;
    roller1.shuffle();
    roller2.shuffle();
    roller4.shuffle();
    List<String> spitMmmm = "$tmpMmm".split("");
    location1 = roller1.indexOf(spitMmmm[0]);
    location2 = roller2.indexOf(spitMmmm[1]);
    location3 = 0;
    location4 = roller4.indexOf(spitMmmm[3]);
    ssLogggg(
      "====spitMmmm:$spitMmmm location1:$location1 location2:$location2 location4:$location4",
    );
  }

  double _cardMonnn() {
    double randomDouble = 10 + Random().nextDouble() * (100 - 10);
    return randomDouble.toAsFixedFloor(1);
  }

  _roller(GlobalKey<RollerListState> key, int index) async {
    int allImgs = 10;
    int random = 4;
    if (index == 0) {
      random = location1;
    } else if (index == 1) {
      random = location2;
    } else if (index == 2) {
      random = location3;
    } else if (index == 3) {
      random = location4;
    }
    int time = 800 + index * 100;

    ssLogggg("=======time:$time");
    key.currentState
        ?.smoothScrollToIndex(
          random,
          duration: Duration(milliseconds: time),
          // curve: Curves.easeInOutBack,
          curve: Cubic(0.68, -0.15, 0.265, 1.1),
        )
        .then((v) {
          cunt = cunt + 1;

          ssLogggg("=key:$key=smoothScrollToIndex end==cunt:$cunt==time:$time");
          if (cunt >= 4) {
            result?.complete(4);
            result = null;
          }
        });
    await Future.delayed(Duration(milliseconds: 30));
  }

  Completer<int>? result;
  int cunt = 0;
  var hasScrollerEnd = false.obs;

  onStartRoller({
    required ValueChanged onClose,
}) async {
    if (hasScrollerEnd.value) {
      ssLogggg("==onStartRoller=正在滚动==");
      return;
    }
    ssLogggg("==onStartRoller==start=");

    cunt = 0;
    hasScrollerEnd.value = true;
    result = Completer();
    await _roller(firstRoller, 0);
    await _roller(secondRoller, 1);
    await _roller(thirdRoller, 2);
    await _roller(fourthRoller, 3);
    await result?.future;
    await Future.delayed(Duration(milliseconds: 1200));
    ssLogggg("==onStartRoller==end=cunt:$cunt");

    hasScrollerEnd.value = false;
    onClose(money.value);
  }
}
