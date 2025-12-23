import 'dart:ui';

import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/denglugengzhong.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_common/diallll/overlay_common_get.dart';
import 'package:slots_132/ss_common/model/gift_reward_model.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';

class DailyBonusController extends GetxController {
  static DailyBonusController get to => Get.find();
  var todayClickBonus = false.obs;
  var continueLoginDays = 1.obs;
  var continueLoginWeeks = 0.obs;
  var box = SSHive.box;
  static const int _maxStreak = 7; // 连续7天后重置
  // 连续登录天数
  static  String get hLianxuLoginDay =>SSABChange.isPackageB()?"212iouoijsadf":  "212iouoijsadfAaa";

  // 连续登录多少周
  static  String get hLianxuLoginZhouqi => SSABChange.isPackageB()?"212iouoijsadf": "5dfgwrhs21Aaa";

  //  连续登录时间
  static  String get hLianxuLoginTime =>SSABChange.isPackageB()?"asd54asdf45ad": "asd54asdf45adAaa";
  static const String hkTodayClickBonus = "354ertsafgt8";

  static Map<int, GiftRewardModel> kDay_vGiftModel = {
    1: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 50,
      img: SSABChange.isPackageB()
          ? Assets.img.moneyGift.path
          : Assets.imga.coinFreespin.path,
    ),
    2: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 75,
      img: SSABChange.isPackageB()
          ? Assets.img.moneyGift.path
          : Assets.imga.coinFreespin.path,
    ),
    3: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 75,
      img: SSABChange.isPackageB()
          ? Assets.img.moneyGift.path
          : Assets.imga.coinFreespin.path,
    ),
    4: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 75,
      img: SSABChange.isPackageB()
          ? Assets.img.moneyGift.path
          : Assets.imga.coinFreespin.path,
    ),
    5: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.xp,
      num: 2,
      img: Assets.img.giftXpUnlock.path,
    ),
    6: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 85,
      img: SSABChange.isPackageB()
          ? Assets.img.moneyGift.path
          : Assets.imga.coinFreespin.path,
    ),
    7: SSABChange.isPackageB()
        ? GiftRewardModel(
            rewardModelType: EnumGiftRewardModel.iphoneCard,
            num: 1,
            img: Assets.img.phoneSuip.path,
          )
        : GiftRewardModel(
            rewardModelType: EnumGiftRewardModel.cash,
            num: 150,
            img: SSABChange.isPackageB()
                ? Assets.img.moneyGift.path
                : Assets.imga.coinFreespin.path,
          ),
  };

  /// 检查是否连续登录，并更新计数
  checkLoginStreak() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final lastMillis = box.get(hLianxuLoginTime);
    final lastDate = lastMillis != null
        ? DateTime.fromMillisecondsSinceEpoch(lastMillis)
        : null;

    int streak = box.get(hLianxuLoginDay) ?? 0;

    if (lastDate == null) {
      // 首次登录
      streak = 1;
    } else {
      final lastDay = DateTime(lastDate.year, lastDate.month, lastDate.day);
      final diff = today.difference(lastDay).inDays;

      if (diff == 1) {
        streak += 1; // 连续登录 +1
        if (streak > _maxStreak) {
          streak = 1; // 达到7天后重置
          int value = continueLoginWeeks.value;
          setWeeks(value);
        }
      } else if (diff > 1) {
        streak = 1; // 中断重置
        setWeeks(0);
      } else {
        // diff == 0 => 今天已登录，不变
      }
    }

    // 存储数据
    box.put(hLianxuLoginDay, streak);
    box.put(hLianxuLoginTime, today.millisecondsSinceEpoch);

    return streak;
  }

  setWeeks(int week) {
    int value = week;
    value = value + 1;
    box.put(hLianxuLoginZhouqi, value);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  initData(){
    int days = checkLoginStreak();

    continueLoginDays = days.obs;

    int weeks = box.get(hLianxuLoginZhouqi) ?? 0;
    continueLoginWeeks = weeks.obs;

    bool tmphkTodayClickBonus = box.get(hkTodayClickBonus) ?? false;

    if (SSDlTracking.isFirstLoginToday) {
      tmphkTodayClickBonus = false;
    }
    // tmphkTodayClickBonus = false;
    todayClickBonus = tmphkTodayClickBonus.obs;
    saveTodayClickBonusStatus(tmphkTodayClickBonus);
  }


  resetDataB(){
    int days = checkLoginStreak();

    continueLoginDays.value = days;

    int weeks = box.get(hLianxuLoginZhouqi) ?? 0;
    continueLoginWeeks.value = weeks;

    bool tmphkTodayClickBonus = box.get(hkTodayClickBonus) ?? false;

    if (SSDlTracking.isFirstLoginToday) {
      tmphkTodayClickBonus = false;
    }
    // tmphkTodayClickBonus = false;
    todayClickBonus.value = tmphkTodayClickBonus;
    saveTodayClickBonusStatus(tmphkTodayClickBonus);
  }


  onClick(GiftRewardModel gift, VoidCallback onEnd) async {
    todayClickBonus.value = true;
    saveTodayClickBonusStatus(true);
    GiftRewardModel? giftRewardModel = gift;
    EnumGiftRewardModel? rewardModelType = giftRewardModel?.rewardModelType;
    int exp = 0;
    int phoneSpice = 0;
    int freespin = 0;
    double money2 = 0;
    if (giftRewardModel != null && rewardModelType != null) {
      if (rewardModelType == EnumGiftRewardModel.cash) {
        money2 = giftRewardModel.num * 1.0;
      } else if (rewardModelType == EnumGiftRewardModel.xp) {
        exp = (giftRewardModel.num * MainController.to.levelExp() * 1).toInt();
      } else if (rewardModelType == EnumGiftRewardModel.iphoneCard) {
        phoneSpice = giftRewardModel.num.toInt();
        money2 = 150;
      } else if (rewardModelType == EnumGiftRewardModel.freespin) {
        freespin = giftRewardModel.num.toInt();
        onEnd();
        return;
      }
    }

    if (continueLoginDays.value == _maxStreak) {
      money2 = 150;
    }



    await Future.delayed(Duration(milliseconds: 400));
    OverlayCommonGet().show(
      money: money2,
      exp: exp,
      phoneSpice: phoneSpice,
      onClose: () {
        onEnd();
        // MainController.to.onAddMoney(money, showMoneyAnimated: true);
      },
    );
  }

  saveTodayClickBonusStatus(bool result) {
    box.put(hkTodayClickBonus, result);
  }
}
