import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_ad/adsid.dart';
import 'package:slots_132/jc_ad/common_ads.dart';
import 'package:slots_132/jc_gj/audio.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/hero_fly/hero_fly.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_gj/num_e.dart';
import 'package:slots_132/ss_common/diallll/overlay_common_get.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';

import '../../jc_gj/jc_widget/animated_source2target.dart';

class BonusGameController extends GetxController {
  static BonusGameController get to => Get.find();

  static const String card_grand = "card_grand";
  static const String card_major = "card_major";
  static const String card_mini = "card_mini";
  static const String card_cash = "card_cash";
  static const String card_scatter = "card_scatter";
  static const String card_back = "card_back";

  List<String> data = [
    card_grand,
    card_grand,
    card_major,
    card_major,
    card_mini,
    card_mini,
    card_mini,
    card_cash,
    card_scatter,
  ];

  static final Map<String, String> kCardCategory_vCardImg = {
    card_grand: Assets.img.bonusGameCardGrand.path,
    card_major: Assets.img.bonusGameCardMajor.path,
    card_mini: Assets.img.bonusGameCardMini.path,
    card_cash: Assets.img.bonusGameCardMoney.path,
    card_scatter: Assets.img.bonusGameCardScatter.path,
    card_back: Assets.img.bonusGameCardBack.path,
  };

  var clickIndex = <int>{}.obs;

  var find3SameCard = "".obs;
  var cardMoney = <double>[].obs;

  var categoryCount = <String, int>{}.obs;
  var canClick = false.obs;

  Map<int, BuildContext> kZuobiao_vWidgetContext = {};

  // 坐标对应的位置
  Map<int, Offset> kZuobiao_vWidgetContextOffset = {};

  setContext(BuildContext context, int index) {
    kZuobiao_vWidgetContext[index] = context;
  }

  addClickIndex(int index, {required VoidCallback onOnClose}) async {
    if (canClick.value || clickIndex.contains(index)) {
      return;
    }

    int length = clickIndex.length;
    if (length == 1) {
      bool result = await SSCommonAds().showInterstitialAd(
        adPosId: SSAdsPosId.eyomt_bonus_int,
        ignored_hasDisplayAd: true,
      );
      if (!result) {
        // return;
      }
    }

    SSEventReporttttt.bonus_page_click();
    btnBonusGameClick.play();
    Offset endLocation = Offset.zero;
    String category = data[index];
    int jackpotNum = categoryCount[category] ?? -1;
    if (jackpotNum == -1) {
      jackpotNum = 0;
    }

    if (category == card_cash) {
      overlayMainTopMoney.showWithSize(
        childSize: Size(32.w, 32.w),
        onEnd: () {},
        showTargetWidget: true,
      );
      var money = cardMoney[0];
      MainController.to.onAddMoney(
        money,
        showTargetWidget: false,
        showMoneyAnimated: false,
      );
    } else if (category == card_grand) {
      double dx = 175.w;
      if (jackpotNum == 0) {
        dx = 156.w;
      } else if (jackpotNum == 1) {
        dx = 175.w;
      } else if (jackpotNum == 2) {
        dx = 194.w;
      }

      endLocation = Offset(dx, 218.h);
    } else if (category == card_major) {
      double dx = 80.w;
      if (jackpotNum == 0) {
        dx = 60.w;
      } else if (jackpotNum == 1) {
        dx = 80.w;
      } else if (jackpotNum == 2) {
        dx = 100.w;
      }

      endLocation = Offset(dx, 284.h);
    } else if (category == card_mini) {
      double dx = 266.w;
      if (jackpotNum == 0) {
        dx = 250.w;
      } else if (jackpotNum == 1) {
        dx = 266.w;
      } else if (jackpotNum == 2) {
        dx = 285.w;
      }

      endLocation = Offset(dx, 284.h);
    }
    // endLocation = Offset(285.w, 284.h);
    if (endLocation.dx > 0) {
      Widget heroChild = Image.asset(Assets.img.huoqiu.path);
      Offset location = kZuobiao_vWidgetContextOffset[index] ?? Offset.zero;
      OverlayFly2TargetKey().showWithSizeAndEndPosition(
        childSize: Size(10.w, 10.w),
        endSize: Size(30.w, 30.w),
        targetLocation: endLocation,
        topLeftOffset: Offset(location.dx + 40.w, location.dy + 50.h),
        heroChild: heroChild,
        count: 5,
        animTime: Duration(milliseconds: 300),
        delayBetween: Duration(milliseconds: 30),
      );
      await Future.delayed(Duration(milliseconds: 200));
    }
    clickIndex.add(index);
    ssLogggg("=====clickIndex:$clickIndex data:$data");
    double money = 0;
    List<String> newData = [];
    for (var value in clickIndex) {
      String category = data[value];
      if (category == card_cash) {
        money = cardMoney[0];
      }
      newData.add(category);
    }

    var res = findTripleWithScatter(newData);

    if (res != null) {
      canClick.value = true;

      find3SameCard.value = res;
      double tmpmoney = 0;
      int jackpotCount = 2;
      if (res == card_grand) {
        jackpotCount = 5;
        tmpmoney = MainController.jacktopGrand;
      } else if (res == card_major) {
        jackpotCount = 4;
        tmpmoney = MainController.jacktopMajor;
      } else if (res == card_mini) {
        jackpotCount = 2;
        tmpmoney = MainController.jacktopMini;
      }
      money = tmpmoney + money;
      await Future.delayed(Duration(milliseconds: 2500));

      canClick.value = false;
      // OverlayCommonGet().show(
      //   money: money,
      //   exp: 0,
      //   phoneSpice: 0,
      //   onClose: () {
      //     // MainController.to.onAddMoney(money, showMoneyAnimated: true);
      //   },
      // );

      MainController.to.onJackpotPopup(
        jackpotCount: jackpotCount,
        onBtn: (money) {
          onOnClose();
          MainController.to.onAddMoney(money, showMoneyAnimated: true);
        },
        onBtn2: (money) {
          onOnClose();
          MainController.to.onAddMoney(money, showMoneyAnimated: true);
        },
        onNotBtn: (money) {
          onOnClose();

          MainController.to.onAddMoney(money, showMoneyAnimated: true);
        },
        hasFreeSpin: false,
      );
    }

    ssLogggg("=====result:$res");
  }

  /// 主函数：返回找到的 3 连字符（如果有）
  String? findTripleWithScatter(List<String> cards) {
    // 先统计每种卡的数量
    final Map<String, int> count = {};
    int scatterCount = 0;

    for (var card in cards) {
      if (card == card_scatter) {
        scatterCount++;
      } else {
        count[card] = (count[card] ?? 0) + 1;
      }
    }
    List<String> data = [];
    // 遍历非 scatter 的卡，使用 scatter 补齐看是否 >=3
    for (var entry in count.entries) {
      int tmpCount = entry.value + scatterCount;
      if (tmpCount >= 3) {
        String containKey = entry.key; // 找到符合条件的卡
        count[containKey] = tmpCount;
        data.add(containKey);
      }
    }
    ssLogggg("======findTripleWithScatter:$data count:$count");
    categoryCount.value = count;
    if (data.isNotEmpty) {
      if (data.contains(card_grand)) {
        return card_grand;
      } else if (data.contains(card_major)) {
        return card_major;
      } else if (data.contains(card_mini)) {
        return card_mini;
      }
    }
    // 如果全是 scatter，也算 3 连
    if (scatterCount >= 3) {
      return card_scatter;
    }

    return null;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    initData();

    cardMoney.add(_cardMonnn());
  }

  double _cardMonnn() {
    double randomDouble = 10 + Random().nextDouble() * (20 - 10);
    return randomDouble.toAsFixedFloor(2);
  }

  void initData() {
    data.shuffle();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // ssLogggg("=======kZuobiao_vWidgetContex onReady:$kZuobiao_vWidgetContext");
    recordZuobiaoPosition();
    // ssLogggg(
    //   "=======kZuobiao_vWidgetContextOffset onReady:$kZuobiao_vWidgetContextOffset",
    // );
  }

  recordZuobiaoPosition() {
    kZuobiao_vWidgetContext.forEach((int zuobiao, BuildContext context) {
      RenderBox targetBox = context.findRenderObject() as RenderBox;
      var targetLocation = targetBox.localToGlobal(Offset.zero);
      kZuobiao_vWidgetContextOffset[zuobiao] = targetLocation;
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    ssLogggg("====BonusGameController close");
  }
}
