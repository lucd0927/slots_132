import 'dart:math';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
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

  addClickIndex(int index,{
    required VoidCallback onOnClose,
  }) {
    clickIndex.add(index);
    ssLogggg("=====clickIndex:$clickIndex data:$data");
    String category = data[index];
    if (category == card_cash) {
      overlayMainTopMoney.showWithSize(
        childSize: Size(32.w, 32.w),
        onEnd: () {},
      );
    }
    double money = 0;
    List<String> newData = [];
    for (var value in clickIndex) {
      String category = data[value];
      if(category == card_cash){
        money = cardMoney[0];
      }
      newData.add(category);
    }
    var res = findTripleWithScatter(newData);
    if (res != null) {
      onOnClose();
      find3SameCard.value = res;
      double tmpmoney = 0;
      if (res == card_grand) {
        tmpmoney = MainController.jacktopGrand;
      } else if (res == card_major) {
        tmpmoney = MainController.jacktopMajor;
      } else if (res == card_mini) {
        tmpmoney = MainController.jacktopMini;
      }
      money = tmpmoney + money;
      OverlayCommonGet().show(
        money: money,
        exp: 0,
        phoneSpice: 0,
        onClose: () {

        },
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
    double randomDouble = 10 + Random().nextDouble() * (50 - 10);
    return randomDouble.toAsFixedFloor(2);
  }

  void initData() {
    data.shuffle();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    ssLogggg("====BonusGameController close");
  }
}
