import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_tushi.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_gj/restore_bottom_bar.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_common/firebase_json/base_data.dart';
import 'package:slots_132/ss_common/routes.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_buzu.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_card_bank.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_card_cashapp.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_card_paypal.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_jindu1.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_jindu3.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_one_last_check.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_onelc_jindu1.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_rank.dart';

enum EnumSSPaymentMethod {
  paypal('paypal'),
  cashApp('cashApp'),
  bank('bankTransfer');

  final String name;

  const EnumSSPaymentMethod(this.name);
}

class WithdddController extends GetxController {
  static WithdddController get to => Get.find();
  static const String hkAvatar = 'avatar_path';
  static const String hkVipClick = 'sdfglksdjklsdeqrrfsdg';
  static const String hkVipTime = 'orutgmqqqasdfasfd';
  static const int vipPartnerTime = 60 * 60 * 24;

  // static const double minWithdrawMoney = 1000;

  // static const int vipPartnerTime = 6;
  void onClickVipGetChange() {
    box.put(hkVipClick, true);
  }

  bool hasClickVipGet() {
    return box.get(hkVipClick, defaultValue: false);
  }

  var box = SSHive.box;

  // 新增：头像文件与 ImagePicker 实例
  File? _avatarFile;
  final ImagePicker _picker = ImagePicker();

  // 新增：从相册选择头像
  Future<void> pickAvatar() async {
    ssLogggg("==_pickAvatar==");
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        imageQuality: 85,
      );
      if (picked == null) return;
      _avatarFile = File(picked.path);
      box.put(hkAvatar, picked.path);
    } catch (e) {
      // 简单处理，可换成 SnackBar 或日志
      ssLogggg('pick avatar error: $e');
    }

    SystemUiHelper.restoreTransparentNavBar();
    update();
  }

  File? get avatarFile => _avatarFile;

  initAvatar() {
    String? path = box.get(hkAvatar);
    if (path != null) {
      _avatarFile = File(path);
    }
  }

  var selectedPaymentBank = (EnumSSPaymentMethod.paypal.name).obs;

  String currentPaymentIconSelected() {
    return selectedPaymentIconSelected2(selectedPaymentBank.value);
  }

  String currentPaymentIconS() {
    return selectedPaymentIconS2(selectedPaymentBank.value);
  }

  String selectedPaymentIconUnSelected(EnumSSPaymentMethod method) {
    return selectedPaymentIconUnSelected2(method.name);
  }

  String selectedPaymentIconUnSelected2(String method) {
    if (method == EnumSSPaymentMethod.paypal.name) {
      return Assets.img.withddPaypal.path;
    } else if (method == EnumSSPaymentMethod.cashApp.name) {
      return Assets.img.withddCashapp.path;
    } else if (method == EnumSSPaymentMethod.bank.name) {
      return Assets.img.withddBank.path;
    }
    return ''; // 默认返回值，防止没有匹配情况
  }

  String selectedPaymentIconSelected(EnumSSPaymentMethod method) {
    return selectedPaymentIconSelected2(method.name);
  }

  String selectedPaymentIconSelected2(String method) {
    if (method == EnumSSPaymentMethod.paypal.name) {
      return Assets.img.withddPaypal2.path;
    } else if (method == EnumSSPaymentMethod.cashApp.name) {
      return Assets.img.withddCashapp.path;
    } else if (method == EnumSSPaymentMethod.bank.name) {
      return Assets.img.withddBank2.path;
    }
    return ''; // 默认返回值，防止没有匹配情况
  }

  String selectedPaymentIconS(EnumSSPaymentMethod method) {
    return selectedPaymentIconS2(method.name);
  }

  String selectedPaymentIconS2(String method) {
    if (method == EnumSSPaymentMethod.paypal.name) {
      return Assets.img.withddPaypalS.path;
    } else if (method == EnumSSPaymentMethod.cashApp.name) {
      return Assets.img.withddCashappS.path;
    } else if (method == EnumSSPaymentMethod.bank.name) {
      return Assets.img.withddBankS.path;
    }
    return ''; // 默认返回值
  }

  Color bgColor() {
    if (selectedPaymentBank.value == EnumSSPaymentMethod.paypal.name) {
      return Color(0xFF263DD9);
    } else if (selectedPaymentBank.value == EnumSSPaymentMethod.cashApp.name) {
      return Color(0xFF3AAD47);
    } else if (selectedPaymentBank.value == EnumSSPaymentMethod.bank.name) {
      return Color(0xFF000000);
    }
    return Color(0xFF263DD9); // 默认颜色
  }

  static const String hkspinCountLiuceng1 = "hkspinCountWithWithdraw";
  static const String hkspinCountLiuceng3 = "hkspinCountLiuceng3";
  static const String hkcurLiucheng1 = "hkcurLiucheng1";
  static const String hkcurLiucheng2Paiming = "curLiucheng2Paiming";
  static const String hkcurLiucheng3SpinsOver = "curLiucheng3SpinsOver";
  static const String hkpaimingData = "paimingData";

  String get hksaveCardId => "saveCardId6dafs_${selectedPaymentBank.value}";

  var showBalance = true.obs;

  var curLiucheng1SpinsOver = false.obs;
  var curLiucheng2PaimingOver = false.obs;
  var curLiucheng3SpinsOver = false.obs;

  var curSaveCardId = "".obs;

  var curSpinLiuceng1 = 0.obs;
  var curSpinLiuceng3 = 0.obs;

  var paimingData = {}.obs;

  int maxSpinCountWithWithdraw() {
    return SSFBBaseData.fee_spin();
  }

  int spinWithLiuceng3(){
    return SSFBBaseData.human_spin();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initAvatar();

    String tmpsaveCardId = box.get(hksaveCardId) ?? "";
    curSaveCardId = tmpsaveCardId.obs;

    int tmphkspinCountWithWithdraw = box.get(hkspinCountLiuceng1) ?? 0;
    curSpinLiuceng1 = tmphkspinCountWithWithdraw.obs;

    int tmpcurSpinLiuceng3 = box.get(hkspinCountLiuceng3) ?? 0;
    curSpinLiuceng3 = tmpcurSpinLiuceng3.obs;

    bool tmpcurLiucheng1 = box.get(hkcurLiucheng1) ?? false;
    curLiucheng1SpinsOver = tmpcurLiucheng1.obs;

    bool tmpcurLiucheng2 = box.get(hkcurLiucheng2Paiming) ?? false;
    curLiucheng2PaimingOver = tmpcurLiucheng2.obs;
    bool tmpcurLiucheng3 = box.get(hkcurLiucheng3SpinsOver) ?? false;
    curLiucheng3SpinsOver = tmpcurLiucheng3.obs;

    Map<dynamic, dynamic> tmppaimingData = box.get(hkpaimingData) ?? {};
    paimingData = tmppaimingData.obs;
  }

  addSpinWithLiuceng1(int count) {
    int tmpppp = curSpinLiuceng1.value;
    tmpppp = tmpppp + count;
    box.put(hkspinCountLiuceng1, tmpppp);
    curSpinLiuceng1.value = tmpppp;
    ssLogggg("======addSpinWithLiuceng1:tmpppp:$tmpppp");

    if (tmpppp == maxSpinCountWithWithdraw()) {
      saveLiuceng1();
      OverlayRank().show();
    }
  }

  addSpinWithLiuceng3(int count) {
    int tmpppp = curSpinLiuceng3.value;
    tmpppp = tmpppp + count;
    box.put(hkspinCountLiuceng3, tmpppp);
    curSpinLiuceng3.value = tmpppp;
    ssLogggg("======addSpinWithLiuceng3:tmpppp:$tmpppp");

    if (tmpppp >= spinWithLiuceng3()) {
      saveLiuceng3();
      OverlayWithddOnelastcheckJindu1().show();
    }
  }

  saveLiuceng1() {
    curLiucheng1SpinsOver.value = true;
    box.put(hkcurLiucheng1, true);
  }

  saveLiuceng2() {
    curLiucheng2PaimingOver.value = true;
    box.put(hkcurLiucheng2Paiming, true);
  }
  saveLiuceng3() {
    curLiucheng3SpinsOver.value = true;
    box.put(hkcurLiucheng3SpinsOver, true);
  }

  bool hasSaveCardId() {
    return curSaveCardId.isNotEmpty;
  }

  List<int> rankToNextCount = [
    50,
    40,
    30,
    25,
    12,
    10,
    9,
    8,
    7,
    6,
    5,
    5,
    4,
    4,
    3,
    3,
    2,
    10,
  ];

  int allRankFirst = 299;
  int curRankFirst = 269;
  final keyAllRank = "allRank";
  final keycurRank = "curRank";
  final keyrankIndex = "rankIndex";

  int savePaimingData() {
    Map tmppaimingData = paimingData;

    int allRank = tmppaimingData[keyAllRank] ?? allRankFirst;
    int curRank = tmppaimingData[keycurRank] ?? curRankFirst;
    int rankIndex = tmppaimingData[keyrankIndex] ?? 0;
    int allLenght = rankToNextCount.length;
    if (rankIndex >= allLenght) {
      rankIndex = allLenght - 1;
    }
    int nextRank = curRank - rankToNextCount[rankIndex];
    if (nextRank <= 1) {
      nextRank = 1;
    }

    rankIndex++;
    tmppaimingData[keyAllRank] = allRank;
    tmppaimingData[keycurRank] = nextRank;
    tmppaimingData[keyrankIndex] = rankIndex;

    box.put(hkpaimingData, tmppaimingData);

    ssTushi(text: "Your Current Rank: $nextRank");

    update();

    return nextRank;
  }

  int curRank() {
    Map tmppaimingData = paimingData;

    int allRank = tmppaimingData[keyAllRank] ?? allRankFirst;
    int curRank = tmppaimingData[keycurRank] ?? curRankFirst;
    return curRank;
  }

  int allRank() {
    Map tmppaimingData = paimingData;

    int allRank = tmppaimingData[keyAllRank] ?? allRankFirst;
    int curRank = tmppaimingData[keycurRank] ?? curRankFirst;
    return allRank;
  }

  saveCardId(String card) {
    box.put(hksaveCardId, card);
    curSaveCardId.value = card;

    MainController.to.onAddMoney(-MainController.minWithdddMoney, showMoneyAnimated: true);

  }

  onShowPayBank()async{
    bool hasSaveCardddd = WithdddController.to.hasSaveCardId();
    if (!hasSaveCardddd) {
      String payType = WithdddController.to.selectedPaymentBank.value;
      await Future.delayed(Duration(milliseconds: 200));
      if (payType == EnumSSPaymentMethod.bank.name) {
        OverlayWithddCardBank().show();
      } else if (payType == EnumSSPaymentMethod.paypal.name) {
        OverlayWithddCardPaypal().show();
      } else if (payType == EnumSSPaymentMethod.cashApp.name) {
        OverlayWithddCardCashapp().show();
      }

      // OverlayJindu1().show();
    }
  }

  onWithdraw({required double money}) {
    double curMmmm = MainController.to.curMonnnn.value;

    bool hasSaveCardddd = hasSaveCardId();
    ssLogggg("=========onWithdraw==hasSaveCardId:$hasSaveCardddd");
    if (hasSaveCardddd) {
      bool hasLiuceng1 = curLiucheng1SpinsOver.value;
      bool hasLiuceng2 = curLiucheng2PaimingOver.value;
      if (!hasLiuceng1) {
        OverlayWithddJindu3().show();
      } else if (!hasLiuceng2) {
        OverlayRank().show();
      } else {
        if(curLiucheng3SpinsOver.value){
          Get.toNamed(SSRouttttt.withdddCompletePaytaber);
          return;
        }
        OverlayOneLastCheck().show();
      }
    } else {
      if (curMmmm >= money) {
        // bool hasLiuceng1 = curLiucheng1SpinsOver.value;
        // if (hasLiuceng1) {
        //   OverlayWithddJindu3().show();
        // } else {
        //   OverlayJindu1().show();
        // }
        onShowPayBank();
      } else {
        OverlayWithddBuzu().show(
          onClose: () {
            Navigator.maybePop(Get.context!);
          },
        );
      }
    }
  }
}
