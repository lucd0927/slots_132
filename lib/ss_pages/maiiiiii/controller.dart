import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/ss_common/firebase_json/reel_strips.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/roller_list/roller_list.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/slot_machine.dart';

import '../../jc_gj/log.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();

  var showFreeSpin = false.obs;

  final firstRoller = GlobalKey<RollerListState>();
  final secondRoller = GlobalKey<RollerListState>();
  final thirdRoller = GlobalKey<RollerListState>();
  final fourthRoller = GlobalKey<RollerListState>();
  final fiveRoller = GlobalKey<RollerListState>();
  final slotMachineKey = GlobalKey<SSSlotMachineState>();
  int? first;
  int? second;
  int? third;
  int? fourth;
  int? five;
  static const String slotNumWild = "WILD";
  static const String slotNumH1 = "H1";
  static const String slotNumH2 = "H2";
  static const String slotNumH3 = "H3";
  static const String slotNumM1 = "M1";
  static const String slotNumM2 = "M2";
  static const String slotNumL1 = "L1";
  static const String slotNumL2 = "L2";
  static const String slotNumKEY = "KEY";
  static const String slotNumSCATTER = "SCATTER";

  static const defaultImgName = [
    slotNumWild,
    slotNumH1,
    slotNumH2,
    slotNumH3,
    slotNumM1,
    slotNumM2,
    slotNumL1,
    slotNumL2,
    slotNumKEY,
    slotNumSCATTER,
  ];
  static final Map<String, String> kName_vImgName = {
    slotNumWild: Assets.img.slots.slotsWild.path,
    slotNumH1: Assets.img.slots.slotsJ.path,
    slotNumH2: Assets.img.slots.slotsK.path,
    slotNumH3: Assets.img.slots.slotsXuehua.path,
    slotNumM1: Assets.img.slots.slotsLingdang.path,
    slotNumM2: Assets.img.slots.slotsShengdanshu.path,
    slotNumL1: Assets.img.slots.slotsXuehua.path,
    slotNumL2: Assets.img.slots.slotsXuehua.path,
    slotNumKEY: Assets.img.slots.slotsBouns.path,
    slotNumSCATTER: Assets.img.slots.slotsBouns.path,
  };

  List<List<String>> rollerImgs = [
    [
      slotNumWild,
      slotNumH1,
      slotNumH2,
      slotNumH3,
      slotNumM1,
      slotNumM2,
      slotNumL1,
      slotNumL2,
      slotNumKEY,
      slotNumSCATTER,
    ],
    [
      slotNumWild,
      slotNumH1,
      slotNumH3,
      slotNumM1,
      slotNumM2,
      slotNumL1,
      slotNumL2,
      slotNumH2,

      slotNumKEY,
      slotNumSCATTER,
    ],
    [
      slotNumH3,
      slotNumM1,
      slotNumM2,
      slotNumL1,
      slotNumL2,
      slotNumWild,
      slotNumH1,
      slotNumH2,

      slotNumKEY,
      slotNumSCATTER,
    ],
    [
      slotNumWild,
      slotNumH3,
      slotNumM1,
      slotNumM2,
      slotNumL1,
      slotNumH1,
      slotNumH2,

      slotNumL2,
      slotNumKEY,
      slotNumSCATTER,
    ],
    [
      slotNumL1,
      slotNumL2,
      slotNumKEY,
      slotNumSCATTER,
      slotNumWild,
      slotNumH1,
      slotNumH2,
      slotNumH3,
      slotNumM1,
      slotNumM2,
    ],
  ];

  initRoller5({bool hasFirstInit = false}) {
    // 中奖图案
    List<String> winReel1 = SSReelStrips.reel1ImgName();
    List<String> winReel2 = SSReelStrips.reel2ImgName();
    List<String> winReel3 = SSReelStrips.reel3ImgName();
    List<String> winReel4 = SSReelStrips.reel4ImgName();
    List<String> winReel5 = SSReelStrips.reel5ImgName();
    // 原来的图案
    List<String> preReel1 = rollerImgs[0];
    List<String> preReel2 = rollerImgs[1];
    List<String> preReel3 = rollerImgs[2];
    List<String> preReel4 = rollerImgs[3];
    List<String> preReel5 = rollerImgs[4];
    ssLogggg("rollerImgs before:$rollerImgs");
    int start = preReel1.length - winReel2.length;
    int end = preReel1.length;
    // 获取原来最后的中奖3个图案
    List<String> preWinReel1 = preReel1.sublist(start, end);
    List<String> preWinReel2 = preReel2.sublist(start, end);
    List<String> preWinReel3 = preReel3.sublist(start, end);
    List<String> preWinReel4 = preReel4.sublist(start, end);
    List<String> preWinReel5 = preReel5.sublist(start, end);

    if (!hasFirstInit) {
      int end = preWinReel1.length;
      preReel1.setRange(0, end, preWinReel1);
      preReel2.setRange(0, end, preWinReel2);
      preReel3.setRange(0, end, preWinReel3);
      preReel4.setRange(0, end, preWinReel4);
      preReel5.setRange(0, end, preWinReel5);
      ssLogggg("rollerImgs change first-end:0-$end:$rollerImgs");
    }

    preReel1.setRange(start, end, winReel1);
    preReel2.setRange(start, end, winReel2);
    preReel3.setRange(start, end, winReel3);
    preReel4.setRange(start, end, winReel4);
    preReel5.setRange(start, end, winReel5);

    ssLogggg("rollerImgs after:$rollerImgs");
  }

  @override
  void onInit() {
    super.onInit();
    initRoller5(hasFirstInit: true);
  }

  Completer<int>? result;
  int cunt = 0;
  var hasScrollerEnd = false.obs;
  onStartRoller() async {
    if(hasScrollerEnd.value){
      ssLogggg("==onStartRoller=正在滚动==");
      return;
    }
    ssLogggg("==onStartRoller==start=");
    showFreeSpin.value = false;
    cunt = 0;
    hasScrollerEnd.value = true;
    result = Completer();
    await _roller(firstRoller);
    await _roller(secondRoller);
    await _roller(thirdRoller);
    await _roller(fourthRoller);
    await _roller(fiveRoller);
    await result?.future;
    await Future.delayed(Duration(milliseconds: 1000));

    ssLogggg("==onStartRoller==end=cunt:$cunt");

    initRoller5();

    _changeChild(firstRoller, 0);
    _changeChild(secondRoller, 1);
    _changeChild(thirdRoller, 2);
    _changeChild(fourthRoller, 3);
    _changeChild(fiveRoller, 4);

    _resetRoller(firstRoller);
    _resetRoller(secondRoller);
    _resetRoller(thirdRoller);
    _resetRoller(fourthRoller);
    _resetRoller(fiveRoller);
    hasScrollerEnd.value = false;
    // await Future.delayed(Duration(milliseconds: 1000));
    // showFreeSpin.value = true;
  }

  _changeChild(GlobalKey<RollerListState> key, int index) {
    List<Widget> slotsWidget1 =
        slotMachineKey.currentState?.getSlots(index) ?? [];
    // ssLogggg("==onStartRoller==${slotMachineKey.currentState} slotsWidget1:${slotsWidget1.length}=",);
    key.currentState?.changeChildItem(slotsWidget1);
  }

  _resetRoller(GlobalKey<RollerListState> key) {
    key.currentState?.smoothJumpToIndex(1);
  }

  _roller(GlobalKey<RollerListState> key) async {
    int allImgs = defaultImgName.length;
    int random = allImgs + (allImgs - 2);
    key.currentState
        ?.smoothScrollToIndex(
          random,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeIn,
          // curve: Curves.easeInQuad,
        )
        .then((v) {
          cunt = cunt + 1;

          ssLogggg("=key:$key=smoothScrollToIndex end==cunt:$cunt==");
          if (cunt >= 5) {
            result?.complete(5);
            result = null;
          }
        });
    await Future.delayed(Duration(milliseconds: 20));
  }
}
