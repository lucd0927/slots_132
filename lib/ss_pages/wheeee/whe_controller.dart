import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/denglugengzhong.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_common/diallll/overlay_common_get.dart';
import 'package:slots_132/ss_common/model/gift_reward_model.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/wheeee/diaaa/whe_bouns.dart';

enum EnumWheType {
  old, // 老用户
  wheel, // 点击wheel
}

class WheController extends GetxController {
  static WheController get to => Get.find();

  var box = SSHive.box;
  static const int initWheNum = 10;
  static const String hhWheNum = "zioualsknfg";

  var curWheNum = initWheNum.obs;
  var wheelEnd = false.obs;
  static List<double> beisu = [1.0, 1.2, 1.4, 1.8, 2.2, 2.6, 3.0];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    int tmpWheNum = box.get(hhWheNum) ?? initWheNum;
    if (SSDlTracking.isFirstLoginToday) {
      if (tmpWheNum < initWheNum) {
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
    box.put(hhWheNum, tmpN);
  }

  addWheNum() {
    int tmpN = curWheNum.value;

    tmpN = tmpN + 1;
    if (tmpN <= 0) {
      tmpN = 0;
    }
    curWheNum.value = tmpN;
    box.put(hhWheNum, tmpN);
  }

  onSpinSub(dynamic value) {
    ssLogggg("====onSpinSub==");
    int tmpN = curWheNum.value;
    if (tmpN < 0) {
      return;
    }
    wheelEnd.value = true;

    bottomWidget(value as GiftRewardModel);
  }

  var showOneMore = false.obs;

  bottomWidget(GiftRewardModel giftRewardModel) async {
    EnumGiftRewardModel rewardModelType = giftRewardModel.rewardModelType;
    if (rewardModelType == EnumGiftRewardModel.spin) {
      showOneMore.value = true;
      addWheNum();
      return;
    }

    var data = await showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      context: Get.overlayContext!,
      builder: (context) {
        return WheBouns(giftRewardModel: giftRewardModel);
      },
    );
    wheelEnd.value = false;
    int curToday = SSDlTracking.lianxuLoginDay();
    ssLogggg("=======click btn:$data curToday:$curToday");
    if (data == true) {
      double money = 0;
      int exp = 0;
      int phoneSpice = 0;
      double tmpBeisu = 1.0;
      int allLenght = beisu.length;
      if (curToday > allLenght) {
        curToday = 0;
      } else {
        tmpBeisu = beisu[curToday - 1];
      }
      if (rewardModelType == EnumGiftRewardModel.cash) {
        money = giftRewardModel.num * tmpBeisu;
      } else if (rewardModelType == EnumGiftRewardModel.xp) {
        exp =
            giftRewardModel.num *
            MainController.to.levelExp() *
            tmpBeisu.toInt();
      } else if (rewardModelType == EnumGiftRewardModel.iphoneCard) {
        phoneSpice = giftRewardModel.num;
      }

      OverlayCommonGet().show(
        money: money,
        exp: exp,
        phoneSpice: phoneSpice,
        onClose: () {
          MainController.to.onAddMoney(money, showMoneyAnimated: true,showTargetWidget: true);
        },
      );
    } else {}
  }
}
