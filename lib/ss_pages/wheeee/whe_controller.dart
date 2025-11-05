import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/denglugengzhong.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_pages/wheeee/diaaa/whe_bouns.dart';

enum EnumWheType {
  old, // 老用户
  wheel, // 点击wheel
}

class WheController extends GetxController {
  static WheController get to => Get.find();

  var box = SSHive.box;
  static const int initWheNum = 3;
  static const String hhWheNum = "zioualsknfg";

  var curWheNum = initWheNum.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    int tmpWheNum = box.get(hhWheNum) ?? initWheNum;
    if (SSDlTracking.isFirstLoginToday) {
      if (tmpWheNum < 3) {
        tmpWheNum = initWheNum;
      }
    }

    curWheNum = tmpWheNum.obs;
  }

  subWheNum() {
    int tmpN = curWheNum.value;

    tmpN = tmpN - 1;
    if (tmpN <= 0) {
      tmpN = 0;
    }
    curWheNum.value = tmpN;
  }

  onSpinSub(dynamic value) {
    ssLogggg("====onSpinSub==");
    int tmpN = curWheNum.value;
    if (tmpN <= 0) {
      return;
    }

    subWheNum();
    bottomWidget();
  }

  bottomWidget() {
    showModalBottomSheet(
      context: Get.overlayContext!,
      builder: (context) {
        return WheBouns();
      },
    );
  }
}
