import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_source2target.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_pages/phone_card/ddd/phone_spin_to_pieces.dart';

class PhoneCardController extends GetxController {
  static PhoneCardController get to => Get.find();

  final box = SSHive.box;
  static const String hkCurTime = "wrsag345234";
  static const String hkTimeIndex = "54wqerwhriy";
  static const String hkCollectIndexCard = "989dfgsdwesd";
  static const String hkUserName = "sdfgyu78781asdf";

  var canClickClaim = false.obs;
  var shengyuTime = 0.obs;
  var collectCardNum = 0.obs;

  String toTime() {
    if (PhoneCardController.to.shengyuTime.value <= 0) {
      return "00:00:00";
    }
    final duration = Duration(
      seconds: PhoneCardController.to.shengyuTime.value,
    );
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final secs = (duration.inSeconds % 60).toString().padLeft(2, '0');

    final formatted = "$hours:$minutes:$secs";
    return formatted;
  }

  final List<Duration> durations = [
    const Duration(seconds: 4),
    const Duration(seconds: 8),
    const Duration(seconds: 4),
    const Duration(seconds: 8),
    const Duration(seconds: 4),
    const Duration(seconds: 8),
    const Duration(seconds: 4),
    const Duration(seconds: 8),
    const Duration(seconds: 4),
  ];
  Timer? _timer;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ssLogggg("PhoneCardController onInit");
    init();
    initCollectCardIndex();
    initCollectCardNum();
  }

  List getCardIndexList() {
    var index = box.get(hkCollectIndexCard) ?? [];
    ssLogggg("======getCardIndexList:$index");
    return index;
  }

  // 卡片随机
  initCollectCardIndex() {
    var index = box.get(hkCollectIndexCard);
    List<int> initList = [];
    if (index == null) {
      for (int i = 0; i < durations.length; i++) {
        initList.add(i);
      }
      initList.shuffle();

      box.put(hkCollectIndexCard, initList);
    }
    ssLogggg(
      "=======initCollectCardIndex:$initList=index:$index  ${collectCardNum.value}",
    );
  }

  init() {
    var clickIndex = box.get(hkCurTime);
    if (clickIndex == null) {
      canClickClaim = true.obs;
    }

    if (!canClickClaim.value) {
      initTimer();
    }
  }

  resetCurTime() {
    box.delete(hkCurTime);
    PhoneCardController.to.canClickClaim.value = true;
    PhoneCardController.to.shengyuTime.value = 0;
    _timer?.cancel();
  }

  int get whichStageTime {
    int index = box.get(hkTimeIndex) ?? 0;
    int tmpDiff = durations[index].inSeconds;
    // ssLogggg("=====index:$index= time:$tmpDiff===");
    return tmpDiff;
  }

  int curSecondSinceEpoch() {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }

  var showSelectImage = true.obs;
  onclickClaim() {
    ssLogggg(
      "=====onclickClaim===canClickClaim:${PhoneCardController.to.canClickClaim.value}==",
    );
    if (!canClickClaim.value) {
      return;
    }

    canClickClaim.value = false;
    changeWhichStageIndex();
    initTimer();
    showSelectImage.value = false;
    overlayPhoneCard.showWithSize(
      childSize: Size(96.w, 96.w),
      count: 1,
      topLeftOffset: Offset(ScreenUtil().screenWidth/2-40.w, 100.w),
      heroChild: cardHeroWidget(),
      onEnd: (){
        showSelectImage.value = true;
        OverlayPhoneSpinToPieces().show();
      }
    );

    //
  }

  int curHeroIndex = -1;

  Widget? cardHeroWidget() {
    int index = curHeroIndex;
    String path = Assets.img.phoneCardCard1S.path;
    switch (index) {
      case 0:
        path = Assets.img.phoneCardCard1S.path;
        break;
      case 1:
        path = Assets.img.phoneCardCard2S.path;
        break;
      case 2:
        path = Assets.img.phoneCardCard3S.path;
        break;
      case 3:
        path = Assets.img.phoneCardCard4S.path;
        break;
      case 4:
        path = Assets.img.phoneCardCard5S.path;
        break;
      case 5:
        path = Assets.img.phoneCardCard6S.path;
        break;
      case 6:
        path = Assets.img.phoneCardCard7S.path;
        break;
      case 7:
        path = Assets.img.phoneCardCard8S.path;
        break;
      case 8:
        path = Assets.img.phoneCardCard9S.path;
        break;
    }
    return Image.asset(path, width: 96.h, height: 96.h, fit: BoxFit.contain);
  }

  void changeWhichStageIndex() {
    int? index = box.get(hkTimeIndex);
    if (index == null) {
      index = 0;
    } else {
      index++;
    }

    if (index >= durations.length) {
      index = 0;
    }
    ssLogggg("===changeWhichStageIndex:$index");
    collectCardNum.value = index + 1;
    box.put(hkTimeIndex, index);
  }

  initCollectCardNum() {
    int? index = box.get(hkTimeIndex);
    if (index == null) {
      collectCardNum = 0.obs;
    } else {
      collectCardNum = (index + 1).obs;
    }
  }

  String collectCardIndex() {
    int index = collectCardNum.value;
    return "$index/${durations.length}";
  }

  initTimer() {
    int? time = box.get(hkCurTime);
    // time = null;
    if (time == null) {
      time = curSecondSinceEpoch();
      box.put(hkCurTime, time);
      shengyuTime = whichStageTime.obs;
    } else {
      int curTime = curSecondSinceEpoch();
      int tmpDiff = curTime - time;
      shengyuTime = (whichStageTime - tmpDiff).obs;
    }

    // ssLogggg("=init shengyuTime:$shengyuTime===");
    _timer = Timer.periodic(Duration(seconds: 1), (tmpTimer) {
      int curTime = curSecondSinceEpoch();
      int tmpDiff = curTime - time!;
      PhoneCardController.to.shengyuTime.value = whichStageTime - tmpDiff;
      // ssLogggg("=shengyuTime:$shengyuTime===");
      if (PhoneCardController.to.shengyuTime.value < 0) {
        resetCurTime();
        return;
      }
    });
  }

  void setUserName(String name) {
    box.put(hkUserName, name);
  }

  String getUserName() {
    String? name = box.get(hkUserName);
    ssLogggg("===getUserName:$name=");
    if (name == null) {
      return "";
    }
    return name;
  }

  @override
  void onClose() {
    _timer?.cancel();
    // TODO: implement onClose
    super.onClose();
  }
}
