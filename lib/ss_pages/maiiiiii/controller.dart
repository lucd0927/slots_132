import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/roller_list/roller_list.dart';

import '../../jc_gj/log.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();


  var showFreeSpin = false.obs;

  final firstRoller = GlobalKey<RollerListState>();
  final secondRoller = GlobalKey<RollerListState>();
  final thirdRoller = GlobalKey<RollerListState>();
  final fourthRoller = GlobalKey<RollerListState>();
  final fiveRoller = GlobalKey<RollerListState>();
  int? first;
  int? second;
  int? third;
  int? fourth;
  int? five;

  onStartRoller() async {

    ssLogggg("==onStartRoller===");
    showFreeSpin.value = false;
    await _roller(firstRoller);
    await _roller(secondRoller);
    await _roller(thirdRoller);
    await _roller(fourthRoller);
    await _roller(fiveRoller);
    await Future.delayed(Duration(milliseconds: 3000));
    _resetRoller(firstRoller);
    _resetRoller(secondRoller);
    _resetRoller(thirdRoller);
    _resetRoller(fourthRoller);
    _resetRoller(fiveRoller);

    showFreeSpin.value = true;
    // await Future.delayed(Duration(milliseconds: 2500));
    // showFreeSpin.value = false;
  }

  _resetRoller(GlobalKey<RollerListState> key) {
    key.currentState?.smoothJumpToIndex(0);
  }

  _roller(GlobalKey<RollerListState> key) async {
    int random = Random().nextInt(6) + 30;
    key.currentState
        ?.smoothScrollToIndex(
          random,
          duration: Duration(milliseconds: 1200),
          curve: Curves.easeIn,
          // curve: Curves.easeInQuad,
        )
        .then((v) {
          ssLogggg("==smoothScrollToIndex end====");
        });
    await Future.delayed(Duration(milliseconds: 200));
  }
}
