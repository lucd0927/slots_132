import 'dart:async';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_ad/gg_common_config.dart';
import 'package:slots_132/jc_gj/audio.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_source2target.dart';
import 'package:slots_132/jc_gj/jc_widget/hero_fly/hero_fly.dart';
import 'package:slots_132/jc_gj/jc_widget/roller_list/roller_list.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_common/diallll/overlay_bigwin.dart';
import 'package:slots_132/ss_common/diallll/overlay_free_spins.dart';
import 'package:slots_132/ss_common/diallll/overlay_free_spins_over.dart';
import 'package:slots_132/ss_common/diallll/overlay_jackpot_grand.dart';
import 'package:slots_132/ss_common/diallll/overlay_jackpot_major.dart';
import 'package:slots_132/ss_common/diallll/overlay_jackpot_mini.dart';
import 'package:slots_132/ss_common/diallll/overlay_megawin.dart';
import 'package:slots_132/ss_common/diallll/overlay_superwin.dart';
import 'package:slots_132/ss_common/diallll/overlay_wow.dart';
import 'package:slots_132/ss_common/firebase_json/base_data.dart';
import 'package:slots_132/ss_common/firebase_json/pay_table.dart';
import 'package:slots_132/ss_common/firebase_json/paylines.dart';
import 'package:slots_132/ss_common/firebase_json/reel_strips.dart';
import 'package:slots_132/ss_common/model/gift_reward_model.dart';
import 'package:slots_132/ss_pages/bonus_game/bonus_game.dart';
import 'package:slots_132/ss_pages/lucky_slots/lucky_slots.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/center_view.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/slot_machine.dart';
import 'package:slots_132/ss_pages/phone_card/phone_card_controller.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_card_bank.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_card_cashapp.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_card_paypal.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_jindu1.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_jindu3.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';
import 'package:spine_flutter/spine_widget.dart';

import '../../jc_gj/log.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    initOther();
    initRoller5(hasFirstInit: true, hasFreeSpin: false);
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

  // 显示free spins
  var curShowFreeSpin = false.obs;
  var curFreeSpinCount = 0.obs;

  // 显示中奖路
  var showWinLines = false.obs;

  // 滚动是否开始
  var hasScrollerStart = false.obs;

  var jackpotType = EnumJackpot.unknow.obs;

  final firstRoller = GlobalKey<RollerListState>();
  final secondRoller = GlobalKey<RollerListState>();
  final thirdRoller = GlobalKey<RollerListState>();
  final fourthRoller = GlobalKey<RollerListState>();
  final fiveRoller = GlobalKey<RollerListState>();
  final slotMachineKey = GlobalKey<SSSlotMachineState>();
  final keyCenterJinling = GlobalKey();
  final keyBonusGame = GlobalKey();
  final keyPhoneSpice = GlobalKey();
  final keyFreeSpin = GlobalKey<FreeSpinState>();

  static const String slotNumWild = "WILD";
  static const String slotNumWild1 = "WILD1";
  static const String slotNumWild2 = "WILD2";
  static const String slotNumWild3 = "WILD3";
  static const String slotNumH1 = "H1";
  static const String slotNumH2 = "H2";
  static const String slotNumH3 = "H3";
  static const String slotNumM1 = "M1";
  static const String slotNumM2 = "M2";
  static const String slotNumL1 = "L1";
  static const String slotNumL2 = "L2";
  static const String slotNumKEY = "KEY";
  static const String slotNumSCATTER = "SCATTER";
  static const String slotNumPhoneSpice = "PhoneSpice";

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
    // slotNumPhoneSpice,
  ];
  static final Map<String, String> kCategoryName_vImgName = {
    slotNumWild: Assets.img.slots.slotsWild1.path,
    slotNumWild1: Assets.img.slots.slotsWild1.path,
    slotNumWild2: Assets.img.slots.slotsWild2.path,
    slotNumWild3: Assets.img.slots.slotsWild3.path,
    slotNumH1: Assets.img.slots.slotsH1.path,
    slotNumH2: Assets.img.slots.slotsH2.path,
    slotNumH3: Assets.img.slots.slotsH3.path,
    slotNumM1: Assets.img.slots.slotsM1.path,
    slotNumM2: Assets.img.slots.slotsM2.path,
    slotNumL1: Assets.img.slots.slotsL1.path,
    slotNumL2: Assets.img.slots.slotsL2.path,
    slotNumKEY: Assets.img.slots.slotsKey.path,
    slotNumSCATTER: Assets.img.slots.slotsScatter.path,
    slotNumPhoneSpice: Assets.img.slots.slotsPhoneSpice.path,
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

  final int slotsColumn = 5;

  Map<String, Map<String, int>> _recordZuobiao(List<String> keys, int column) {
    Map<String, Map<String, int>> tmp = {};
    int length = keys.length;
    ssLogggg("=_recordZuobiao==length:$length==keys:$keys");
    for (int i = 0; i < length; i++) {
      int value = 1 + column + i * slotsColumn;
      String key = "${keys[i]}";
      String tmpKkkk = "$value";
      Map<String, int> tmpppp = {key: value};
      tmp[tmpKkkk] = tmpppp;
    }
    return tmp;
  }

  Map<int, String> _recordWinZuobiaoCategory(List<String> keys, int column) {
    Map<int, String> tmp = {};
    int length = keys.length;
    // ssLogggg("=_recordZuobiao==length:$length==keys:$keys");
    for (int i = 0; i < length; i++) {
      int value = 1 + column + i * slotsColumn;
      String key = "${keys[i]}";
      String tmpKkkk = "$value";
      Map<String, int> tmpppp = {key: value};
      tmp[value] = key;
    }
    return tmp;
  }

  List<String> newList(List<String> source, String removeS) {
    List<String> tmpS = [];
    for (var v in source) {
      if (v != removeS) {
        tmpS.add(v);
      }
    }
    tmpS.remove(removeS);
    return tmpS;
  }

  List<String> pickUniqueStrings(List<String> source, int n) {
    if (n > source.length) {
      throw Exception("n cannot exceed source.length when unique=true");
    }

    final temp = List<String>.from(source)..shuffle();
    return temp.take(n).toList();
  }

  _resetColumnWinReel({
    required List<String> winReel1,
    required List<String> winReel2,
    required List<String> winReel3,
    required List<String> winReel4,
    required List<String> winReel5,
    required bool hasFreeSpin,
  }) {
    int tmpSpinCount1 = curSpinCount.value;

    int tmpSpinCount = tmpSpinCount1 % 15;
    // tmpSpinCount = 12;
    tmpSpinCount = 5;
    if (tmpSpinCount == 5) {
      if (hasFreeSpin || curFreeSpinCount.value > 0) {
        tmpSpinCount = 3;
      }
    }
    ssLogggg(
      "===tmpSpinCount1:$tmpSpinCount1=tmpSpinCount:$tmpSpinCount=hasFreeSpin:$hasFreeSpin",
    );
    int length = defaultImgName.length;
    if (tmpSpinCount == 1 && tmpSpinCount1 == 1) {
      winReel1
        ..clear()
        ..addAll([slotNumWild1, slotNumWild2, slotNumWild3]);
      winReel2
        ..clear()
        ..addAll([slotNumWild1, slotNumWild2, slotNumWild3]);
      winReel3
        ..clear()
        ..addAll([slotNumWild1, slotNumWild2, slotNumWild3]);
      winReel4
        ..clear()
        ..addAll([slotNumH1, slotNumH1, slotNumH1]);
      winReel5
        ..clear()
        ..addAll([slotNumWild1, slotNumWild2, slotNumWild3]);
    } else if (tmpSpinCount == 2 && tmpSpinCount1 == 2) {
      winReel5 = winReel5
        ..clear()
        ..addAll([slotNumWild1, slotNumWild2, slotNumPhoneSpice]);
    } else if (tmpSpinCount == 5) {
      List<String> tmpList = newList(defaultImgName, slotNumSCATTER);
      List<String> tmpList1 = pickUniqueStrings(tmpList, 2);
      List<String> tmpList2 = pickUniqueStrings(tmpList, 2);
      List<String> tmpList3 = pickUniqueStrings(tmpList, 2);
      List<String> tmpList4 = pickUniqueStrings(defaultImgName, 3);
      List<String> tmpList5 = pickUniqueStrings(defaultImgName, 3);
      var imgCategories = [
        [...tmpList1, slotNumSCATTER]..shuffle(),
        [...tmpList2, slotNumSCATTER]..shuffle(),
        [...tmpList3, slotNumSCATTER]..shuffle(),
        tmpList4,
        tmpList5,
      ]..shuffle();
      winReel1
        ..clear()
        ..addAll(imgCategories[0]);
      winReel2
        ..clear()
        ..addAll(imgCategories[1]);
      winReel3
        ..clear()
        ..addAll(imgCategories[2]);
      winReel4
        ..clear()
        ..addAll(imgCategories[3]);
      winReel5
        ..clear()
        ..addAll(imgCategories[4]);
    } else if (tmpSpinCount == 9) {
      int tmpBonusGameCount = curBonusGameCount.value;
      int shengyuCount = maxBonusGameCount - tmpBonusGameCount;
      ssLogggg(
        "===shengyuCount:$shengyuCount=tmpBonusGameCount:$tmpBonusGameCount=",
      );
      List<String> imgCategories = [];
      for (int i = 0; i < 16; i++) {
        if (i < shengyuCount) {
          imgCategories.add(slotNumKEY);
        } else {
          imgCategories.add(defaultImgName[Random().nextInt(length)]);
        }
      }
      imgCategories.shuffle();
      winReel1
        ..clear()
        ..addAll(imgCategories.sublist(0, 3));
      winReel2
        ..clear()
        ..addAll(imgCategories.sublist(3, 6));
      winReel3
        ..clear()
        ..addAll(imgCategories.sublist(6, 9));
      winReel4
        ..clear()
        ..addAll(imgCategories.sublist(9, 12));
      winReel5
        ..clear()
        ..addAll(imgCategories.sublist(12, 15));
    } else if (tmpSpinCount == 12) {
      int random = Random().nextInt(5);
      var imgCategories = [];
      for (int i = 0; i < 5; i++) {
        var item;
        if (i <= random) {
          item = [slotNumWild1, slotNumWild2, slotNumWild3];
        } else {
          item = [
            defaultImgName[Random().nextInt(length)],
            defaultImgName[Random().nextInt(length)],
            defaultImgName[Random().nextInt(length)],
          ];
        }
        imgCategories.add(item);
      }
      imgCategories.shuffle();

      winReel1
        ..clear()
        ..addAll(imgCategories[0]);
      winReel2
        ..clear()
        ..addAll(imgCategories[1]);
      winReel3
        ..clear()
        ..addAll(imgCategories[2]);
      winReel4
        ..clear()
        ..addAll(imgCategories[3]);
      winReel5
        ..clear()
        ..addAll(imgCategories[4]);
    }
  }

  initRoller5({bool hasFirstInit = false, required bool hasFreeSpin}) {
    // 中奖图案
    List<String> winReel1 = SSReelStrips.reel1ImgName();
    List<String> winReel2 = SSReelStrips.reel2ImgName();
    List<String> winReel3 = SSReelStrips.reel3ImgName();
    List<String> winReel4 = SSReelStrips.reel4ImgName();
    List<String> winReel5 = SSReelStrips.reel5ImgName();
    ssLogggg("rollerImgs win:$winReel1");
    _resetColumnWinReel(
      winReel1: winReel1,
      winReel2: winReel2,
      winReel3: winReel3,
      winReel4: winReel4,
      winReel5: winReel5,
      hasFreeSpin: hasFreeSpin,
    );
    ssLogggg("rollerImgs win2:$winReel1");
    // 原来的图案
    List<String> preReel1 = rollerImgs[0];
    List<String> preReel2 = rollerImgs[1];
    List<String> preReel3 = rollerImgs[2];
    List<String> preReel4 = rollerImgs[3];
    List<String> preReel5 = rollerImgs[4];
    ssLogggg("rollerImgs before:$rollerImgs");
    // 中奖放到最后的第几个位置
    int start = preReel1.length - winReel2.length;
    int end = preReel1.length;
    // 获取原来最后的中奖3个图案
    List<String> preWinReel1 = preReel1.sublist(start, end);
    List<String> preWinReel2 = preReel2.sublist(start, end);
    List<String> preWinReel3 = preReel3.sublist(start, end);
    List<String> preWinReel4 = preReel4.sublist(start, end);
    List<String> preWinReel5 = preReel5.sublist(start, end);
    // 不是第一次加载
    if (!hasFirstInit) {
      int end = preWinReel1.length;
      preReel1.setRange(0, end, preWinReel1);
      preReel2.setRange(0, end, preWinReel2);
      preReel3.setRange(0, end, preWinReel3);
      preReel4.setRange(0, end, preWinReel4);
      preReel5.setRange(0, end, preWinReel5);
      ssLogggg("rollerImgs change first-end:0-$end:$rollerImgs");
    } else {}
    // 设置最后的几个中奖图
    preReel1.setRange(start, end, winReel1);
    preReel2.setRange(start, end, winReel2);
    preReel3.setRange(start, end, winReel3);
    preReel4.setRange(start, end, winReel4);
    preReel5.setRange(start, end, winReel5);

    // 整复杂了，只需要记录<int,String> 坐标，类型
    Map<String, Map<String, int>> kImgName_vIndex1 = _recordZuobiao(
      winReel1,
      0,
    );
    Map<String, Map<String, int>> kImgName_vIndex2 = _recordZuobiao(
      winReel2,
      1,
    );
    Map<String, Map<String, int>> kImgName_vIndex3 = _recordZuobiao(
      winReel3,
      2,
    );
    Map<String, Map<String, int>> kImgName_vIndex4 = _recordZuobiao(
      winReel4,
      3,
    );
    Map<String, Map<String, int>> kImgName_vIndex5 = _recordZuobiao(
      winReel5,
      4,
    );

    // 记录中奖坐标
    Map<String, List<List<int>>> winLines = {};

    kImgName_vIndex1.forEach((tmpkey1, value1) {
      String key1 = value1.keys.first;

      ssLogggg("=tmp:$key1===");
      if (key1.contains(slotNumWild)) {
        kImgName_vIndex2.forEach((tmpkey2, value2) {
          String key2 = value2.keys.first;
          if (key2.contains(slotNumWild)) {
            kImgName_vIndex3.forEach((tmpkey3, value3) {
              List<List<int>> tmpWins = [];
              String key3 = value3.keys.first;
              String winKey =
                  "${value1.values.first}_${value2.values.first}_${value3.values.first}";
              List<int> tmp = [
                value1.values.first,
                value2.values.first,
                value3.values.first,
              ];
              tmpWins.add(tmp);
              winLines[winKey] = tmpWins;

              if (key3.contains(slotNumWild)) {
                // 记录中奖

                kImgName_vIndex4.forEach((tmpkey4, value4) {
                  String key4 = value4.keys.first;
                  if (key4.contains(slotNumWild)) {
                    // 记录中奖
                    List<int> tmp = [
                      value1.values.first,
                      value2.values.first,
                      value3.values.first,
                      value4.values.first,
                    ];
                    tmpWins.add(tmp);
                    kImgName_vIndex5.forEach((tmpkey5, value5) {
                      String key5 = value5.keys.first;
                      // 记录中奖
                      List<int> tmp = [
                        value1.values.first,
                        value2.values.first,
                        value3.values.first,
                        value4.values.first,
                        value5.values.first,
                      ];
                      tmpWins.add(tmp);
                    });
                  } else {
                    // 记录中奖
                    List<int> tmp = [
                      value1.values.first,
                      value2.values.first,
                      value3.values.first,
                      value4.values.first,
                    ];
                    tmpWins.add(tmp);
                    kImgName_vIndex5.forEach((tmpkey5, value5) {
                      String key5 = value5.keys.first;
                      if (key5.contains(slotNumWild) || key5 == key4) {
                        // 记录中奖
                        List<int> tmp = [
                          value1.values.first,
                          value2.values.first,
                          value3.values.first,
                          value4.values.first,
                          value5.values.first,
                        ];
                        tmpWins.add(tmp);
                      }
                    });
                  }
                });
              } else {
                // 记录中奖
                kImgName_vIndex4.forEach((tmpkey4, value4) {
                  String key4 = value4.keys.first;
                  if (key4.contains(slotNumWild) || key4 == key3) {
                    List<int> tmp = [
                      value1.values.first,
                      value2.values.first,
                      value3.values.first,
                      value4.values.first,
                    ];
                    tmpWins.add(tmp);
                    // 记录中奖
                    kImgName_vIndex5.forEach((tmpkey5, value5) {
                      String key5 = value5.keys.first;
                      if (key5.contains(slotNumWild) || key5 == key3) {
                        List<int> tmp = [
                          value1.values.first,
                          value2.values.first,
                          value3.values.first,
                          value4.values.first,
                          value5.values.first,
                        ];
                        tmpWins.add(tmp);
                        // 记录中奖
                      }
                    });
                  }
                });
              }
            });
          } else {
            kImgName_vIndex3.forEach((tmpkey3, value3) {
              List<List<int>> tmpWins = [];
              String key3 = value3.keys.first;
              if (key3.contains(slotNumWild) || key3 == key2) {
                // 记录中奖

                String winKey =
                    "${value1.values.first}_${value2.values.first}_${value3.values.first}";
                List<int> tmp = [
                  value1.values.first,
                  value2.values.first,
                  value3.values.first,
                ];
                winLines[winKey] = tmpWins;
                tmpWins.add(tmp);
                kImgName_vIndex4.forEach((tmpkey4, value4) {
                  String key4 = value4.keys.first;
                  if (key4.contains(slotNumWild) || key4 == key2) {
                    // 记录中奖
                    List<int> tmp = [
                      value1.values.first,
                      value2.values.first,
                      value3.values.first,
                      value4.values.first,
                    ];
                    tmpWins.add(tmp);
                    kImgName_vIndex5.forEach((tmpkey5, value5) {
                      String key5 = value5.keys.first;
                      if (key5.contains(slotNumWild) || key5 == key2) {
                        // 记录中奖
                        List<int> tmp = [
                          value1.values.first,
                          value2.values.first,
                          value3.values.first,
                          value4.values.first,
                          value5.values.first,
                        ];
                        tmpWins.add(tmp);
                      }
                    });
                  }
                });
              }
            });
          }
        });
      } else {
        kImgName_vIndex2.forEach((tmpkey2, value2) {
          String key2 = value2.keys.first;
          if (key2.contains(slotNumWild) || key2 == key1) {
            kImgName_vIndex3.forEach((tmpkey3, value3) {
              String key3 = value3.keys.first;
              List<List<int>> tmpWins = [];
              if (key3.contains(slotNumWild) || key3 == key1) {
                // 记录中奖
                String winKey =
                    "${value1.values.first}_${value2.values.first}_${value3.values.first}";
                List<int> tmp = [
                  value1.values.first,
                  value2.values.first,
                  value3.values.first,
                ];
                tmpWins.add(tmp);
                winLines[winKey] = tmpWins;
                kImgName_vIndex4.forEach((tmpkey4, value4) {
                  String key4 = value4.keys.first;
                  if (key4.contains(slotNumWild) || key4 == key1) {
                    // 记录中奖
                    List<int> tmp = [
                      value1.values.first,
                      value2.values.first,
                      value3.values.first,
                      value4.values.first,
                    ];
                    tmpWins.add(tmp);
                    kImgName_vIndex5.forEach((tmpkey5, value5) {
                      String key5 = value5.keys.first;
                      if (key5.contains(slotNumWild) || key5 == key1) {
                        // 记录中奖
                        List<int> tmp = [
                          value1.values.first,
                          value2.values.first,
                          value3.values.first,
                          value4.values.first,
                          value5.values.first,
                        ];
                        tmpWins.add(tmp);
                      }
                    });
                  }
                });
              }
            });
          }
        });
      }
    });

    ssLogggg("rollerImgs win lines:$kImgName_vIndex1");
    ssLogggg("rollerImgs win lines:$kImgName_vIndex2");
    ssLogggg("rollerImgs win lines:$kImgName_vIndex3");
    ssLogggg("rollerImgs win lines:$kImgName_vIndex4");
    ssLogggg("rollerImgs win lines:$kImgName_vIndex5");
    ssLogggg("rollerImgs win lines last:$winLines");
    ssLogggg("rollerImgs after:$rollerImgs");
    // 记录坐标对应的类型
    Map<int, String> kZuobiao_vCategory = {};
    Map<int, String> kZuobiao_vCategory1 = _recordWinZuobiaoCategory(
      winReel1,
      0,
    );
    Map<int, String> kZuobiao_vCategory2 = _recordWinZuobiaoCategory(
      winReel2,
      1,
    );
    Map<int, String> kZuobiao_vCategory3 = _recordWinZuobiaoCategory(
      winReel3,
      2,
    );
    Map<int, String> kZuobiao_vCategory4 = _recordWinZuobiaoCategory(
      winReel4,
      3,
    );
    Map<int, String> kZuobiao_vCategory5 = _recordWinZuobiaoCategory(
      winReel5,
      4,
    );
    kZuobiao_vCategory.addAll(kZuobiao_vCategory1);
    kZuobiao_vCategory.addAll(kZuobiao_vCategory2);
    kZuobiao_vCategory.addAll(kZuobiao_vCategory3);
    kZuobiao_vCategory.addAll(kZuobiao_vCategory4);
    kZuobiao_vCategory.addAll(kZuobiao_vCategory5);
    ssLogggg("rollerImgs zuobiao_category:$kZuobiao_vCategory");
    kZuobiao_vCategory_next = kZuobiao_vCategory;

    var paylines = SSPaylines.paylines();
    winNextZuobiao = {};
    winNextCategoryLines = [];
    if (paylines is List<List<int>>) {
      for (var values in winLines.values) {
        // 筛选当前数组中最长的数组，可以是多个一样长的数组线路
        List tmpDddd = findAllLongestLists(values);
        // ssLogggg("rollerImgs 中奖 winLines:$tmpDddd");
        for (var ddddaaa in tmpDddd) {
          // 是否再给的中奖线路上
          bool container = containsPrefix(paylines, ddddaaa);
          if (container) {
            if (ddddaaa is List<int>) {
              Map<String, List<int>> tmp = {};
              String key = "";
              int count = 0;
              int allLenght = ddddaaa.length;
              // ssLogggg("=====win lines last=zuobiao:$ddddaaa ");
              Set<int> tmpWinNextZuobiao = {};
              for (int i = 0; i < allLenght; i++) {
                var zuobiao = ddddaaa[i];
                bool result = kZuobiao_vCategory.containsKey(zuobiao);
                if (result) {
                  var value = kZuobiao_vCategory[zuobiao] ?? "";
                  // ssLogggg("=====win lines last=zuobiao:$zuobiao key:$value");

                  if (value.isEmpty ||
                      value == slotNumKEY ||
                      value == slotNumSCATTER) {
                    tmpWinNextZuobiao = {};
                    break;
                  } else {
                    tmpWinNextZuobiao.add(zuobiao);
                    if (value.contains(slotNumWild)) {
                      count = count + 1;
                    } else {
                      key = value;
                    }
                  }
                }
              }
              winNextZuobiao.addAll(tmpWinNextZuobiao);
              if (count == allLenght && key.isEmpty) {
                key = slotNumWild;
              }
              if (key.isNotEmpty) {
                tmp[key] = ddddaaa;
                winNextCategoryLines.add(tmp);
              }

              // ssLogggg("=====win lines last=下次中奖线路:$ddddaaa key:$key count:$count allLength:$allLenght",);
            }
          }
        }
      }
    }
    ssLogggg("=====win lines last=winNextCategoryLines:$winNextCategoryLines");
    ssLogggg("=====win lines last=winNextZuobiao:$winNextZuobiao");
  }

  // 找出二维数组中最长的数组
  List<List<T>> findAllLongestLists<T>(List<List<T>> lists) {
    if (lists.isEmpty) return [];

    // 1️⃣ 找出最大长度
    final maxLen = lists.fold<int>(
      0,
      (prev, list) => list.length > prev ? list.length : prev,
    );

    // 2️⃣ 过滤出所有长度等于 maxLen 的数组
    return lists.where((list) => list.length == maxLen).toList();
  }

  // 在一个二维数组中，判断是否存在一个内部数组，它的前几个元素与目标数组完全一致。
  bool containsPrefix<T>(List<List<T>> data, List<T> target) {
    if (target.isEmpty) return false;

    return data.any((list) {
      // 如果内部数组长度比目标短，肯定不可能匹配
      if (list.length < target.length) return false;

      // 从头开始比较 target 长度的部分
      for (int i = 0; i < target.length; i++) {
        if (list[i] != target[i]) return false;
      }
      return true;
    });
  }

  // 当前中奖的坐标
  Set<int> winCurZuobiao = {};

  // 当前中奖的类型对应的坐标
  List<Map<String, List<int>>> winCurCategoryLines = [];

  // key:坐标 value:种类 [    slotNumWild,
  //     slotNumH1,
  //     slotNumH2,
  //     slotNumH3,
  //     slotNumM1,
  //     slotNumM2,
  //     slotNumL1,
  //     slotNumL2,
  //     slotNumKEY,
  //     slotNumSCATTER,]
  Map<int, String> kZuobiao_vCategory_cur = {};

  // 下一次中奖的坐标
  Set<int> winNextZuobiao = {};

  // 下一次中奖的类型对应的坐标
  List<Map<String, List<int>>> winNextCategoryLines = [];

  // 下一次类型对应的坐标
  Map<int, String> kZuobiao_vCategory_next = {};
  Completer<int>? result;
  int cunt = 0;

  // hasFreeSpin 是否处于freespin的状态
  onStartRoller({bool hasFreeSpin = false}) async {
    if (hasScrollerStart.value) {
      ssLogggg("==onStartRoller=正在滚动==");
      return;
    }
    var rollerOver = Completer();

    SSEventReporttttt.home_page_spin();

    onAddSpin(1);
    ssLogggg("==onStartRoller==start=");
    kZuobiao_vWidgetContext = {};
    showWinLines.value = false;
    cunt = 0;
    hasScrollerStart.value = true;
    result = Completer();

    if (!hasFreeSpin) {
      double tpmBeisu = -curBeisu.value;
      curSpinMoney.value = tpmBeisu;
      // curShowFreeSpin.value = false;
      onAddMoney(tpmBeisu, onEnd: () {}, showMoneyAnimated: false);
    }
    btnSpinClick.play();
    // if (await Vibration.hasVibrator()) {
    //   Vibration.vibrate();
    // }
    await _roller(firstRoller, 0);
    await _roller(secondRoller, 1);
    await _roller(thirdRoller, 2);
    await _roller(fourthRoller, 3);
    await _roller(fiveRoller, 4);
    await result?.future;
    await Future.delayed(Duration(milliseconds: 300));
    showWinLines.value = true;
    ssLogggg("==onStartRoller==end=cunt:$cunt");
    winCurZuobiao = {};
    for (var v in winNextZuobiao) {
      winCurZuobiao.add(v);
    }
    winCurCategoryLines = [];
    for (var v in winNextCategoryLines) {
      winCurCategoryLines.add(v);
    }
    kZuobiao_vCategory_cur = {};
    kZuobiao_vCategory_next.forEach((key, value) {
      kZuobiao_vCategory_cur[key] = value;
    });
    int slotNumSCATTERLength = kZuobiao_vCategory_cur.values
        .where((e) => e == slotNumSCATTER)
        .length;
    bool showScatterAnimated = slotNumSCATTERLength >= 3;
    initRoller5(hasFreeSpin: showScatterAnimated || curShowFreeSpin.value);

    _changeChild(firstRoller, 0, showScatterAnimated: showScatterAnimated);
    _changeChild(secondRoller, 1, showScatterAnimated: showScatterAnimated);
    _changeChild(thirdRoller, 2, showScatterAnimated: showScatterAnimated);
    _changeChild(fourthRoller, 3, showScatterAnimated: showScatterAnimated);
    _changeChild(fiveRoller, 4, showScatterAnimated: showScatterAnimated);

    _resetRoller(firstRoller, 0);
    _resetRoller(secondRoller, 1);
    _resetRoller(thirdRoller, 2);
    _resetRoller(fourthRoller, 3);
    _resetRoller(fiveRoller, 4);

    if (!hasFreeSpin) {
      // 添加经验
      onAddExp(100);
    }

    double tmpAddMoney = 0.0;
    List<double> payBeisu = [];
    int lines = SSPayTable.lines();
    double beisu = curBeisu.value;
    ssLogggg("==onStartRoller==end=winCurCategoryLines:$winCurCategoryLines");
    for (var data in winCurCategoryLines) {
      String category = data.keys.first;
      int count = data.values.first.length;
      double tmpPay = SSPayTable.payBeishu(category, count);

      double tmpPayyy = beisu / lines * tmpPay;
      ssLogggg("==onStartRoller==end=tmpPayyy:$tmpPayyy");
      tmpAddMoney = tmpAddMoney + tmpPayyy;
      payBeisu.add(tmpPay);
    }

    ssLogggg("====winCurZuobiao:$winCurZuobiao");
    ssLogggg("====kZuobiao_vCategory_cur:$kZuobiao_vCategory_cur");
    await onFlyHeroWidget();
    DateTime curTime = DateTime.now();
    ssLogggg("==onStartRoller==end=curTime:${curTime.millisecondsSinceEpoch}");

    int jackpotCount = 0;
    bool zuobiao1 = kZuobiao_vCategory_cur[1]?.contains(slotNumWild) ?? false;
    bool zuobiao6 = kZuobiao_vCategory_cur[6]?.contains(slotNumWild) ?? false;
    bool zuobiao11 = kZuobiao_vCategory_cur[11]?.contains(slotNumWild) ?? false;
    bool column1 = zuobiao1 && zuobiao6 && zuobiao11;
    if (column1) {
      jackpotCount++;
    }

    bool zuobiao2 = kZuobiao_vCategory_cur[2]?.contains(slotNumWild) ?? false;
    bool zuobiao7 = kZuobiao_vCategory_cur[7]?.contains(slotNumWild) ?? false;
    bool zuobiao12 = kZuobiao_vCategory_cur[12]?.contains(slotNumWild) ?? false;
    bool column2 = zuobiao2 && zuobiao7 && zuobiao12;
    if (column2) {
      jackpotCount++;
    }
    bool zuobiao3 = kZuobiao_vCategory_cur[3]?.contains(slotNumWild) ?? false;
    bool zuobiao8 = kZuobiao_vCategory_cur[8]?.contains(slotNumWild) ?? false;
    bool zuobiao13 = kZuobiao_vCategory_cur[13]?.contains(slotNumWild) ?? false;
    bool column3 = zuobiao3 && zuobiao8 && zuobiao13;
    if (column3) {
      jackpotCount++;
    }
    bool zuobiao4 = kZuobiao_vCategory_cur[4]?.contains(slotNumWild) ?? false;
    bool zuobiao9 = kZuobiao_vCategory_cur[9]?.contains(slotNumWild) ?? false;
    bool zuobiao14 = kZuobiao_vCategory_cur[14]?.contains(slotNumWild) ?? false;
    bool column4 = zuobiao4 && zuobiao9 && zuobiao14;
    if (column4) {
      jackpotCount++;
    }
    bool zuobiao5 = kZuobiao_vCategory_cur[5]?.contains(slotNumWild) ?? false;
    bool zuobiao10 = kZuobiao_vCategory_cur[10]?.contains(slotNumWild) ?? false;
    bool zuobiao15 = kZuobiao_vCategory_cur[15]?.contains(slotNumWild) ?? false;
    bool column5 = zuobiao5 && zuobiao10 && zuobiao15;
    if (column5) {
      jackpotCount++;
    }
    ssLogggg("======jackpotCount:$jackpotCount");
    // jackpotCount = 2;
    await Future.delayed(Duration(milliseconds: 200), () {});
    if (jackpotCount >= 2) {
      onJackpotPopup(
        jackpotCount: jackpotCount,
        hasFreeSpin: hasFreeSpin,
        onBtn: (money) {
          _rollerEnd(
            tmpAddMoney: money,
            onEnd: () {
              rollerOver.complete();
            },
          );
        },
        onBtn2: (money) {
          _rollerEnd(
            tmpAddMoney: money,
            onEnd: () {
              rollerOver.complete();
            },
          );
        },
        onNotBtn: (money) {
          _rollerEnd(
            tmpAddMoney: money,
            onEnd: () {
              rollerOver.complete();
            },
          );
        },
      );
    } else {
      onWinPopup(
        scene: EnumGetScene.spin,
        tmpAddMoney: tmpAddMoney,
        onBtn: (money) {
          _rollerEnd(
            tmpAddMoney: money,
            onEnd: () {
              rollerOver.complete();
            },
          );
        },
        onBtn2: (money) {
          _rollerEnd(
            tmpAddMoney: money,
            onEnd: () {
              rollerOver.complete();
            },
          );
        },
        onNotBtn: (money) {
          _rollerEnd(
            tmpAddMoney: money,
            onEnd: () {
              rollerOver.complete();
            },
          );
        },
        hasFreeSpin: hasFreeSpin,
      );
    }

    await rollerOver.future;
    ssLogggg("==onStartRoller==end=winCurZuobiao:$winCurZuobiao");
    ssLogggg("==onStartRoller==end=winCurCategoryLines:$winCurCategoryLines");
    ssLogggg(
      "==onStartRoller==end=payBeisu:$payBeisu  tmpAddMoney:$tmpAddMoney",
    );
  }

  // 每个飞的动画
  Future<void> onFlyHeroWidget() async {
    bool containerslotNumH1 = false;
    int starCount = 0;
    kZuobiao_vCategory_cur.forEach((int zuobiao, value) {
      Offset? startPosition = kZuobiao_vWidgetContextOffset[zuobiao];
      String img = kCategoryName_vImgName[value] ?? "";
      if (value == slotNumH1) {
        if (startPosition != null) {
          // slotNumH1
          img = Assets.img.slots.slotsH1.path;
          Widget heroChild = Image.asset(img);
          containerslotNumH1 = true;
          starCount++;
          if (keyCenterJinling.currentContext != null) {
            OverlayFly2TargetKey().showWithSize(
              childSize: Size(64.w, 64.w),
              targetContext: keyCenterJinling.currentContext!,
              topLeftOffset: startPosition,
              heroChild: heroChild,
            );
          }
        }
      }
    });
    if (containerslotNumH1) {
      if (keyCenterJinling.currentContext != null) {
        btnSpinLastIndex.play();
      }
      onAddCollectStar(starCount);
      await Future.delayed(Duration(milliseconds: 1000), () {});
    }
    bool containerslotNumKEY = false;
    int bonusGameCount = 0;
    kZuobiao_vCategory_cur.forEach((int zuobiao, value) {
      Offset? startPosition = kZuobiao_vWidgetContextOffset[zuobiao];
      String img = kCategoryName_vImgName[value] ?? "";

      if (value == slotNumKEY) {
        if (startPosition != null) {
          img = Assets.img.mainBottomBonus.path;
          // img = Assets.img.slots.slotsH1.path;
          Widget heroChild = Image.asset(img);
          containerslotNumKEY = true;
          bonusGameCount++;
          if (keyBonusGame.currentContext != null) {
            OverlayFly2TargetKey().showWithSize(
              childSize: Size(64.w, 64.w),
              targetContext: keyBonusGame.currentContext!,
              topLeftOffset: startPosition,
              heroChild: heroChild,
            );
          }
        }
      }
    });

    if (containerslotNumKEY) {
      if (keyBonusGame.currentContext != null) {
        btnSpinLastIndex.play();
      }

      await Future.delayed(Duration(milliseconds: 1200), () {});
      onAddBonusGameCount(bonusGameCount);
    }
    bool containerslotNumPhoneSpice = false;
    kZuobiao_vCategory_cur.forEach((int zuobiao, value) {
      Offset? startPosition = kZuobiao_vWidgetContextOffset[zuobiao];
      String img = kCategoryName_vImgName[value] ?? "";

      if (value == slotNumPhoneSpice) {
        if (startPosition != null) {
          img = Assets.img.phoneSuip.path;
          // img = Assets.img.slots.slotsH1.path;
          Widget heroChild = Image.asset(img);
          containerslotNumKEY = true;
          bonusGameCount++;
          containerslotNumPhoneSpice = true;
          if (keyPhoneSpice.currentContext != null) {
            OverlayFly2TargetKey().showWithSize(
              childSize: Size(80.w, 80.w),
              targetContext: keyPhoneSpice.currentContext!,
              topLeftOffset: startPosition,
              heroChild: heroChild,
            );
          }
        }
      }
    });
    if (containerslotNumPhoneSpice) {
      if (keyPhoneSpice.currentContext != null) {
        btnSpinLastIndex.play();
      }
      await Future.delayed(Duration(milliseconds: 1200), () {});
      PhoneCardController.to.changeWhichStageIndex();
    }
  }

  onJackpotPopup({
    required int jackpotCount,
    required bool hasFreeSpin,
    required ValueChanged onBtn,
    required ValueChanged onBtn2,
    required ValueChanged? onNotBtn,
  }) {
    if (jackpotCount == 2) {
      curSpinMoney.value = jacktopMini;
      OverlayJackpotMini().show(
        scene: EnumGetScene.spin,
        money: jacktopMini,
        onBtn: (money) {
          onBtn(money);
        },
        onBtn2: (money) {
          onBtn2(money);
        },
      );
    } else if (jackpotCount == 3 || jackpotCount == 4) {
      curSpinMoney.value = jacktopMajor;
      OverlayJackpotMajor().show(
        scene: EnumGetScene.spin,
        money: jacktopMajor,
        onBtn: (money) {
          onBtn(money);
        },
        onBtn2: (money) {
          onBtn2(money);
        },
      );
    } else if (jackpotCount >= 5) {
      curSpinMoney.value = jacktopGrand;
      OverlayJackpotGrand().show(
        scene: EnumGetScene.spin,
        money: jacktopGrand,
        onBtn: (money) {
          onBtn(money);
        },
        onBtn2: (money) {
          onBtn2(money);
        },
      );
    }
  }

  // super win/ mega win/ mini win
  onWinPopup({
    required double tmpAddMoney,
    required ValueChanged onBtn,
    required ValueChanged onBtn2,
    required ValueChanged? onNotBtn,
    required EnumGetScene scene,
    required bool hasFreeSpin,
  }) {
    curSpinMoney.value = tmpAddMoney;
    double tmpBeisu = curBeisu.value;

    double addBeisu = tmpAddMoney / tmpBeisu;

    if (addBeisu >= SSFBBaseData.superwinBet()) {
      OverlaySuperwin().show(
        scene: scene,
        money: tmpAddMoney,
        onBtn: (money) {
          onBtn(money);
        },
        onBtn2: (money) {
          onBtn2(money);
        },
      );
    } else if (addBeisu >= SSFBBaseData.megawinBet()) {
      OverlayMegawin().show(
        scene: scene,
        money: tmpAddMoney,
        onBtn: (money) {
          onBtn(money);
        },
        onBtn2: (money) {
          onBtn2(money);
        },
      );
    } else if (addBeisu >= SSFBBaseData.bigwinBet()) {
      OverlayBigwin().show(
        scene: scene,
        money: tmpAddMoney,
        onBtn: (money) {
          onBtn(money);
        },
        onBtn2: (money) {
          onBtn2(money);
        },
      );
    } else {
      onNotBtn?.call(tmpAddMoney);
    }
  }

  _rollerEnd({required double tmpAddMoney, required VoidCallback onEnd}) {
    onAddMoney(
      tmpAddMoney,
      onEnd: () async {
        ssLogggg("======_rollerEnd");
        await Future.delayed(Duration(milliseconds: 500), () {});
        DateTime curTime2 = DateTime.now();

        int slotNumSCATTERLength = kZuobiao_vCategory_cur.values
            .where((e) => e == slotNumSCATTER)
            .length;

        if (slotNumSCATTERLength >= 3) {
          ssLogggg("======_rollerEnd 1");

          kZuobiao_vCategory_cur.forEach((int zuobiao, value) {
            Offset? startPosition = kZuobiao_vWidgetContextOffset[zuobiao];
            String img = kCategoryName_vImgName[value] ?? "";

            if (value == slotNumSCATTER) {
              if (startPosition != null) {
                img = Assets.img.slots.slotsScatter.path;
                // img = Assets.img.slots.slotsH1.path;
                Widget heroChild = Image.asset(img);

                OverlayFly2TargetKey().showWithSizeAndEndPosition(
                  childSize: Size(50.w, 50.w),
                  targetLocation: Offset(
                    ScreenUtil().screenWidth / 2 - 20.w,
                    300.h,
                  ),
                  topLeftOffset: startPosition,
                  heroChild: heroChild,
                );
              }
            }
          });
          await Future.delayed(Duration(milliseconds: 400), () {});
          double count = 6;
          if (slotNumSCATTERLength == 3) {
            count = 6;
          } else if (slotNumSCATTERLength == 4) {
            count = 7;
          } else if (slotNumSCATTERLength == 5) {
            count = 8;
          }
          count = 3;
          OverlayFreeSpins().show(
            count: count,
            onClose: (value) async {
              curShowFreeSpin.value = true;
              hasScrollerStart.value = false;
              SSEventReporttttt.home_page(source_from: "FREESPIN");
              await Future.delayed(Duration(milliseconds: 200));
              onEnd.call();
              bgMusic.stop();
              bgMusicFreeSpin.play(loopMode: LoopMode.single);
              onFreeSpin();
            },
          );
          return;
        }
        ssLogggg("======_rollerEnd 1 1");
        hasScrollerStart.value = false;
        bool hasFreeSpin = curShowFreeSpin.value;
        ssLogggg("==onStartRoller=slotNumSCATTERLength:$slotNumSCATTERLength=");
        bool hasSaveCardddd = WithdddController.to.hasSaveCardId();
        if (hasSaveCardddd && !hasFreeSpin) {
          bool hasLiucheng1 = WithdddController.to.curLiucheng1SpinsOver.value;
          bool hasLiucheng2 =
              WithdddController.to.curLiucheng2PaimingOver.value;

          if (!hasLiucheng1) {
            WithdddController.to.addSpinWithLiuceng1(1);
          } else if (hasLiucheng2) {
            WithdddController.to.addSpinWithLiuceng3(1);
          }
        }

        int tmpBonusGameCount = curBonusGameCount.value;
        if (tmpBonusGameCount >= maxBonusGameCount) {
          ssLogggg("======_rollerEnd 2 1 OverlayBonusGame");
          OverlayBonusGame().show(
            onEnd: () {
              resetToZeroBonusGameCount();
              onEnd.call();
            },
          );
        } else {
          ssLogggg("======_rollerEnd 2 2 onShowPayBank");
          double minWithdd = minWithdddMoney;
          if (minWithdd <= curMonnnn.value && !curShowFreeSpin.value) {
            WithdddController.to.onShowPayBank();
          }
          await Future.delayed(Duration(milliseconds: 100));
          onEnd.call();
        }
      },
      showMoneyAnimated: true,
    );
  }

  _changeChild(
    GlobalKey<RollerListState> key,
    int index, {
    required bool showScatterAnimated,
  }) {
    List<Widget> slotsWidget1 =
        slotMachineKey.currentState?.getSlots(
          index,
          showScatterAnimated: showScatterAnimated,
        ) ??
        [];
    // ssLogggg("==onStartRoller==${slotMachineKey.currentState} slotsWidget1:${slotsWidget1.length}=",);
    key.currentState?.changeChildItem(slotsWidget1);
  }

  _resetRoller(GlobalKey<RollerListState> key, int index) {
    key.currentState?.smoothJumpToIndex(initRollerIndex(index));
  }

  int initRollerIndex(int index) {
    int random = index + 5;
    if (random.isOdd) {
      random = random + 1;
    }
    return 1 + rollerImgs.length * random;
  }

  _roller(GlobalKey<RollerListState> key, int index) async {
    int allImgs = defaultImgName.length;
    int random = allImgs - 2;
    int time = 800 + index * 100;
    ssLogggg("=======time:$time index:$index");
    if (index == 4) {
      time = 1100;
      // btnSpinLastIndex.play();
    }
    if (index == 2) {
      // btnSpinCenterIndex.play();
    }

    key.currentState
        ?.smoothScrollToIndex(
          random,
          duration: Duration(milliseconds: time),
          // curve: Curves.easeInOutBack,
          curve: Cubic(0.68, -0.15, 0.265, 1.1),
        )
        .then((v) {
          cunt = cunt + 1;

          // ssLogggg("=key:$key=smoothScrollToIndex end==cunt:$cunt==time:$time");
          if (cunt >= 5) {
            // btnSpinLastIndex.play();
            result?.complete(5);
            result = null;
          }
        });
    await Future.delayed(Duration(milliseconds: 30));
  }

  // BuildContext? keyWidgetZuobiao_1;
  // BuildContext? keyWidgetZuobiao_2;
  // BuildContext? keyWidgetZuobiao_3;
  // BuildContext? keyWidgetZuobiao_4;
  // BuildContext? keyWidgetZuobiao_5;
  // BuildContext? keyWidgetZuobiao_6;
  // BuildContext? keyWidgetZuobiao_7;
  // BuildContext? keyWidgetZuobiao_8;
  // BuildContext? keyWidgetZuobiao_9;
  // BuildContext? keyWidgetZuobiao_10;
  // BuildContext? keyWidgetZuobiao_11;
  // BuildContext? keyWidgetZuobiao_12;
  // BuildContext? keyWidgetZuobiao_13;
  // BuildContext? keyWidgetZuobiao_14;
  // BuildContext? keyWidgetZuobiao_15;
  // BuildContext? keyWidgetZuobiao_16;

  Map<int, BuildContext> kZuobiao_vWidgetContext = {};

  // 坐标对应的位置
  Map<int, Offset> kZuobiao_vWidgetContextOffset = {};
  Map<int, BuildContext> kFreespinIndex_vWidgetContextOffset = {};

  setFreespinContext(BuildContext context, int index) {
    kFreespinIndex_vWidgetContextOffset[index] = context;
  }

  setContext(BuildContext context, int index) {
    kZuobiao_vWidgetContext[index] = context;
  }

  /// ****************************************************************************************************************
  /// 除去slot machine的逻辑

  var box = SSHive.box;
  var boxHistory = SSHive.boxHistory;
  var curMonnnn = 0.0.obs;

  static const int maxLevel = 32;
  static const int maxStarCount = 32;
  static const int maxBonusGameCount = 10;
  static const double minWithdddMoney = 1000;
  static const double jacktopGrand = 128.0;
  static const double jacktopMajor = 80.0;
  static const double jacktopMini = 48.0;

  String get minWithdddMoneyWithCountry {
    return "${SSCountry.curGuojiaFuhao()}${MainController.minWithdddMoney.toStringAsFixed(0)}";
  }

  static const String hkLevelExp = "9151iuwriyhi";
  static const String hkBeisuNum = "fa3323werfgdsg";
  static const String hkMonnnn = "54ewqr2g45sd4g5";
  static const String hkCollectStar = "dfgs656ytiu232wq";
  static const String hkBonusGameCount = "87sdghkjszdfght33";
  static const String hkcurSpinCount = "hkcurSpinCountaaa";
  static const double minBet = 8.0;
  static const double maxBet = 10.0;

  var curBonusGameCount = 0.obs;

  // 经验值
  var curLevelExp = 0.obs;

  // 当前倍数
  var curBeisu = 8.0.obs;

  // 转spin的时候消耗或者获取的money
  var curSpinMoney = 0.0.obs;

  // 当前收集的星星
  var curCollectStar = 0.obs;

  // 转动spin的次数
  var curSpinCount = 0.obs;

  var showBoxTime = true.obs;

  // key: 经验值
  // value： 等级范围
  Map<int, List<int>> kExp_vLevels = {
    100: [1, 5],
    200: [6, 15],
    400: [16, 1000],
  };
  static const int stage1_5 = 5;
  static const int stage1_5Exp = 100;
  static const int stage6_15 = 10;
  static const int stage6_15Exp = 200;
  static const int stage16_1MaxExp = 400;
  static const int level1_5 = stage1_5Exp * stage1_5;
  static const int level6_15 = stage6_15Exp * stage6_15;
  static const int level1_15 = level1_5 + level6_15;

  static final Map<int, GiftRewardModel> kStarNum_vReward = {
    3: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 25,
      img: Assets.img.moneyGift.path,
    ),
    6: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.xp,
      num: 200,
      img: Assets.img.giftXpUnlock.path,
    ),
    2: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 25,
      img: Assets.img.moneyGift.path,
    ),
    8: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.iphoneCard,
      num: 1,
      img: Assets.img.popupGetPhoneSpice.path,
    ),
    5: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 120,
      img: Assets.img.moneyGift.path,
    ),
    1: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.freespin,
      num: 20,
      img: Assets.img.giftFreespins.path,
    ),
    9: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.iphoneCard,
      num: 1,
      img: Assets.img.popupGetPhoneSpice.path,
    ),
    4: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.freespin,
      num: 100,
      img: Assets.img.giftFreespins.path,
    ),
    7: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.xp,
      num: 200,
      img: Assets.img.giftXpUnlock.path,
    ),
    10: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.iphoneCard,
      num: 1,
      img: Assets.img.popupGetPhoneSpice.path,
    ),
  };

  int nextNeedStar() {
    List<int> jumpToNextStar = kStarNum_vReward.keys.toList();
    int loopMaxN = 0;
    for (var v in jumpToNextStar) {
      loopMaxN = loopMaxN + v;
    }
    // 获取女精灵总数量
    int curGirlJinglingN = MainController.to.curCollectStar.value;
    // curGirlJinglingN = 100;
    // 取于
    int tmpQuyu = curGirlJinglingN % loopMaxN;
    int loopNum = jumpToNextStar.length;
    int tmpAddN = 0;
    int needStar = 0;
    for (int i = 0; i < loopNum; i++) {
      int quyu = i % loopNum;
      int star = jumpToNextStar[quyu];
      int tmpAddN2 = tmpAddN + star;
      bool result = tmpQuyu < tmpAddN2;
      if (result) {
        needStar = tmpAddN2 - tmpQuyu;
        break;
      } else {
        tmpAddN = tmpAddN2;
      }
    }
    return needStar;
  }

  double curLevelProgress() {
    double pro = 0.0;
    int tmpLevelExp = curLevelExp.value;

    int tmpLevel = level();
    if (tmpLevelExp <= level1_5) {
      pro = (tmpLevelExp - tmpLevel * stage1_5Exp) / stage1_5Exp;

      // pro = (tmpLevelExp - (tmpLevel - 1) * stage1_5Exp) / stage1_5Exp;
    }
    // 6-15
    else if (tmpLevelExp <= level1_15) {
      int tmpExp = tmpLevelExp - level1_5;
      int tmpLevel = tmpExp ~/ stage6_15Exp;
      pro = (tmpExp - tmpLevel * stage6_15Exp) / stage6_15Exp;
    }
    // 16 - infinity
    else {
      int tmpExp = tmpLevelExp - level1_5 - level6_15;
      int tmpLevel = tmpExp ~/ stage16_1MaxExp;
      pro = (tmpExp - tmpLevel * stage16_1MaxExp) / stage16_1MaxExp;
    }
    ssLogggg(
      "======curLevelProgress:$pro=tmpLevelExp:$tmpLevelExp level1_15:$level1_15",
    );
    return pro;
  }

  int allLevelExp(int level) {
    int tmpAllExp = 0;
    if (level <= stage1_5) {
      return stage1_5Exp * level;
    } else if (level <= (stage1_5 + stage6_15)) {
      int tmp6_15 = level - stage1_5;
      return level1_5 + tmp6_15 * stage6_15Exp;
    } else {
      int tmp6_15 = level - stage1_5 - stage6_15;
      return level1_15 + tmp6_15 * stage16_1MaxExp;
    }

    return tmpAllExp;
  }

  int levelExp() {
    int tmpLevel = 1;
    int tmpLevelExp = curLevelExp.value;
    // curLevelExp = 2900;

    // 1-5
    if (tmpLevelExp <= level1_5) {
      return stage1_5Exp;
    }
    // 6-15
    else if (tmpLevelExp <= level1_15) {
      int tmpExp = tmpLevelExp - level1_5;

      return stage6_15Exp;
    }
    // 16 - infinity
    else {
      return stage16_1MaxExp;
    }

    ssLogggg("=====Level:$tmpLevel curLevelExp:$tmpLevelExp");
    return tmpLevel;
  }

  int level() {
    int tmpLevel = 1;
    int tmpLevelExp = curLevelExp.value;
    // curLevelExp = 2900;

    // 1-5
    if (tmpLevelExp <= level1_5) {
      tmpLevel = tmpLevelExp ~/ stage1_5Exp;
    }
    // 6-15
    else if (tmpLevelExp <= level1_15) {
      int tmpExp = tmpLevelExp - level1_5;

      tmpLevel = tmpExp ~/ stage6_15Exp + stage1_5;
    }
    // 16 - infinity
    else {
      int tmpExp = tmpLevelExp - level1_15;
      tmpLevel = tmpExp ~/ stage16_1MaxExp + stage1_5 + stage6_15;
    }

    ssLogggg("=====Level:$tmpLevel curLevelExp:$tmpLevelExp");
    return tmpLevel;
  }

  static const String hkHistoryData = "hkHistoryData12dd";

  List<GiftRewardModel> getHistory() {
    var data = boxHistory.get(hkHistoryData) ?? [];
    ssLogggg("=====getHistory:$data");

    List<GiftRewardModel> tmpGR = [];
    if (data is List) {
      data.forEach((value) {
        if (value is Map) {
          var rewardModelType = value['rewardModelType'] ?? "";

          EnumGiftRewardModel tmpEnumGiftRewardModel = EnumGiftRewardModel.cash;
          if (rewardModelType == EnumGiftRewardModel.cash.name) {
            tmpEnumGiftRewardModel = EnumGiftRewardModel.cash;
          } else if (rewardModelType == EnumGiftRewardModel.xp.name) {
            tmpEnumGiftRewardModel = EnumGiftRewardModel.xp;
          }

          var num = value['num'] ?? "";
          var time = value['time'] ?? 0;
          GiftRewardModel tmp = GiftRewardModel(
            rewardModelType: tmpEnumGiftRewardModel,
            num: num,
            time: time,
            img: "",
          );
          tmpGR.add(tmp);
        }
      });
    }
    ssLogggg("=====getHistory tmpGR:${tmpGR.length}");
    return tmpGR.reversed.toList();
  }

  addHistory({required GiftRewardModel giftModel}) {
    var data = boxHistory.get(hkHistoryData) ?? [];
    if (data is List && data.length > 100) {
      data.removeAt(0);
    }
    data.add(giftModel.toJson());
    ssLogggg("=====addHistory:$data");

    boxHistory.put(hkHistoryData, data);
  }

  onAddMoney(
    double money, {
    VoidCallback? onEnd,
    required bool showMoneyAnimated,
    bool showTargetWidget = false,
  }) {
    if (money == 0) {
      onEnd?.call();
      return;
    }

    addHistory(
      giftModel: GiftRewardModel(
        rewardModelType: EnumGiftRewardModel.cash,
        num: money,
        img: "",
      ),
    );
    if (money > 0) {
      btnSpinLastIndex.play();

      if (showMoneyAnimated) {
        overlayMainTopMoney.showWithSize(
          childSize: Size(32.w, 32.w),
          onEnd: () {
            // btnSpinLastIndex.play();
            _onAddMoney(money, onEnd);
          },
          showTargetWidget: showTargetWidget,
        );
      } else {
        _onAddMoney(money, onEnd);
      }
    } else {
      _onAddMoney(money, onEnd);
    }
  }

  void _onAddMoney(double money, VoidCallback? onEnd) {
    double tmpCurMmmm2 = curMonnnn.value;
    double tmpCurMmmm = tmpCurMmmm2 + money;
    box.put(hkMonnnn, tmpCurMmmm);
    curMonnnn.value = tmpCurMmmm;
    ssLogggg("=======onAddMoney tmpCurMmmm:$tmpCurMmmm");

    if (money > 0) {
      // btnSpinLastIndex.play();
      double tmpCoin = tmpCurMmmm;
      int i = tmpCurMmmm2 ~/ 100;
      int next = tmpCoin ~/ 100;

      if (i != next) {
        SSEventReporttttt.cash_numer(number_type: "${next * 100}");
      }
    }
    onEnd?.call();
  }

  onAddExp(int exp) {
    int tmpExp2 = curLevelExp.value;

    int curLevel = level();

    int tmpExp = tmpExp2 + exp;

    box.put(hkLevelExp, tmpExp);
    addHistory(
      giftModel: GiftRewardModel(
        rewardModelType: EnumGiftRewardModel.xp,
        num: exp * 1.0,
        img: "",
      ),
    );
    curLevelExp.value = tmpExp;
    int nextLevel = level();
    int i = curLevel ~/ 1;
    int next = nextLevel ~/ 1;
    ssLogggg("====preLevel:$curLevel= curLevel:$nextLevel");
    if (i != next) {
      SSEventReporttttt.level_number(level_type: "$next");
    }

    ssLogggg("======tmpExp:$tmpExp=");
  }

  onAddSpin(int exp) {
    int tmppp = curSpinCount.value;

    tmppp = tmppp + exp;

    box.put(hkcurSpinCount, tmppp);

    curSpinCount.value = tmppp;
    ssLogggg("======onAddSpin:$tmppp=");
  }

  onChangeBeisu(double addNum) {
    double beisu = curBeisu.value + addNum * 1.0;
    if (beisu < 8.0) {
      beisu = 8.0;
    }
    if (beisu > 10.0) {
      beisu = 10.0;
    }

    box.put(hkBeisuNum, beisu);
    curBeisu.value = beisu;
    ssLogggg("=====changeBeisu curBeisu:$beisu");
  }

  onAddMaxBeisu() {
    box.put(hkBeisuNum, 10.0);
    curBeisu.value = 10.0;
    SSEventReporttttt.home_page_bet();
    ssLogggg("=====addMaxBeisu curBeisu:10.0");
  }

  onAddCollectStar(int star) {
    int tmpCount = curCollectStar.value;
    tmpCount = tmpCount + star;
    box.put(hkCollectStar, tmpCount);
    curCollectStar.value = tmpCount;
    ssLogggg("======onAddCollectStar:$tmpCount=");
  }

  onAddBonusGameCount(int star) {
    int tmpCount = curBonusGameCount.value;
    tmpCount = tmpCount + star;
    box.put(hkBonusGameCount, tmpCount);
    curBonusGameCount.value = tmpCount;
    ssLogggg("======onAddCollectStar:$tmpCount=");
  }

  resetToZeroBonusGameCount() {
    int tmpCount = 0;
    box.put(hkBonusGameCount, tmpCount);
    curBonusGameCount.value = tmpCount;
    ssLogggg("======resetToZeroBonusGameCount:$tmpCount=");
  }

  double progressBonusGame() {
    int tmpCount = curBonusGameCount.value;
    double progress = tmpCount / maxBonusGameCount;
    return progress;
  }

  int _curFreeSpinCount = -1;
  double _curFreeSpinMoney = 0;

  resetFreeSpinStatus() {
    _curFreeSpinCount = -1;
    _curFreeSpinMoney = 0;
    curFreeSpinCount.value = 0;
    hasScrollerStart.value = false;
    curShowFreeSpin.value = false;
    bgMusicFreeSpin.stop();
    bgMusic.play(loopMode: LoopMode.single);

    SSEventReporttttt.home_page(source_from: "NORMAL");
  }

  onFreeSpin() async {
    int tmpCount = curFreeSpinCount.value;
    if (_curFreeSpinCount == -1) {
      _curFreeSpinCount = tmpCount;
      _curFreeSpinMoney = 0;
    }
    tmpCount = tmpCount - 1;
    if (tmpCount >= 0) {
      curFreeSpinCount.value = tmpCount;
    } else {
      OverlayFreeSpinsOver().show(
        money: _curFreeSpinMoney,
        onClose: (v) {
          resetFreeSpinStatus();
        },
        spinCount: _curFreeSpinCount,
      );

      return;
    }
    ssLogggg("=======onFreeSpin=onStartRoller");
    await onStartRoller(hasFreeSpin: true);
    await Future.delayed(Duration(milliseconds: 300));
    hasScrollerStart.value = false;
    ssLogggg("=======onFreeSpin=onStartRoller end");
    btnBonusGameClick.play();
    keyFreeSpin.currentState?.onStar(
      onEnd: (EnumGiftRewardModel tmpEnumGiftRewardModel) {
        if (tmpEnumGiftRewardModel == EnumGiftRewardModel.cash) {
          double money = Random().nextDouble() * 20 + 10;
          SSEventReporttttt.free_spin_cash();
          OverlayWow().show(
            scene: EnumGetScene.spin,
            money: money,
            onBtn: (v) {
              _onNextFreeSpin(money: money);
            },
            onBtn2: (money) {
              _onNextFreeSpin(money: money);
            },
          );
        } else if (tmpEnumGiftRewardModel == EnumGiftRewardModel.freespin) {
          OverlayLuckySlots().show(
            onClose: (money) {
              onWinPopup(
                scene: EnumGetScene.single_slots,
                tmpAddMoney: money,
                onBtn: (money) {
                  _onNextFreeSpin(money: money);
                },
                onBtn2: (money) {
                  _onNextFreeSpin(money: money);
                },
                onNotBtn: (money) {
                  _onNextFreeSpin(money: money);
                },
                hasFreeSpin: false,
              );

              // overlayMainTopMoney.showWithSize(
              //   childSize: Size(32.w, 32.w),
              //   onEnd: () {
              //     onFreeSpin();
              //   },
              // );
            },
          );
        }
      },
    );
  }

  _onNextFreeSpin({required double money}) {
    onAddMoney(
      money,
      showMoneyAnimated: true,
      onEnd: () {
        _curFreeSpinMoney = _curFreeSpinMoney + money;
        onFreeSpin();
      },
    );
  }

  initOther() {
    int tmpCurLevelExp = box.get(hkLevelExp) ?? 0;
    curLevelExp = tmpCurLevelExp.obs;
    ssLogggg("=====initOther curLevelExp:$tmpCurLevelExp");

    double tmpcurBeisu = box.get(hkBeisuNum) ?? 8.0;
    curBeisu = tmpcurBeisu.obs;
    ssLogggg("=====initOther curBeisu:$tmpcurBeisu");

    double tmpMooon = box.get(hkMonnnn) ?? 0.0;
    curMonnnn = tmpMooon.obs;
    ssLogggg("=====initOther money:$tmpMooon");

    int tmpCollectStar = box.get(hkCollectStar) ?? 0;
    curCollectStar = tmpCollectStar.obs;
    ssLogggg("=====initOther tmpCollectStar:$tmpCollectStar");

    int tmphkBonusGameCount = box.get(hkBonusGameCount) ?? 0;
    curBonusGameCount = tmphkBonusGameCount.obs;
    ssLogggg("=====initOther curBonusGameCount:$curBonusGameCount");

    int tmpcurSpinCount = box.get(hkcurSpinCount) ?? 1;
    curSpinCount = tmpcurSpinCount.obs;
    ssLogggg("=====initOther tmpcurSpinCount:$tmpcurSpinCount");

    initTimerBoxGift();
  }

  static Map<EnumLottieType, LottieComposition>
  _kLottieType_vLottieComposition = {};

  static initLottieComposition() async {
    // AssetLottie(Assets.lottt.superwin.data).load().then((result) {
    //   _kLottieType_vLottieComposition[EnumLottieType.superwin] = result;
    // });
    // AssetLottie(Assets.lottt.megawin.data).load().then((result) {
    //   _kLottieType_vLottieComposition[EnumLottieType.megawin] = result;
    // });
    // AssetLottie(Assets.lottt.wow.data).load().then((result) {
    //   _kLottieType_vLottieComposition[EnumLottieType.wow] = result;
    // });
    // AssetLottie(Assets.lottt.bigwin.data).load().then((result) {
    //   _kLottieType_vLottieComposition[EnumLottieType.bigwin] = result;
    // });
    AssetLottie(Assets.lottt.bian.data).load().then((result) {
      _kLottieType_vLottieComposition[EnumLottieType.bian] = result;
    });
    // AssetLottie(Assets.lottt.bian2.data).load().then((result) {
    //   _kLottieType_vLottieComposition[EnumLottieType.bian2] = result;
    // });
    AssetLottie(Assets.lottt.bian3.data).load().then((result) {
      _kLottieType_vLottieComposition[EnumLottieType.bian3] = result;
    });

    // AssetLottie(Assets.lottt.jackpotGrand.data).load().then((result) {
    //   _kLottieType_vLottieComposition[EnumLottieType.jackpotGrand] = result;
    // });
    // AssetLottie(Assets.lottt.jackpotMajor.data).load().then((result) {
    //   _kLottieType_vLottieComposition[EnumLottieType.jackpotMajor] = result;
    // });
    // AssetLottie(Assets.lottt.jackpotMini.data).load().then((result) {
    //   _kLottieType_vLottieComposition[EnumLottieType.jackpotMini] = result;
    // });

    // AssetLottie(Assets.donghua.lottieMoney.data).load().then((result) {
    //   _kLottieType_vLottieComposition[EnumLottieType.money] = result;
    // });

    // spineControllerMajor = SpineWidgetController(
    //   onInitialized: (controller) {
    //     // Set the default mixing time between animations
    //
    //     controller.animationState.data.defaultMix = 0.2;
    //     // Set the portal animation on track 0
    //     controller.animationState.setAnimation(0, "animation", true);
    //     // Queue the run animation after the portal animation
    //     // controller.animationState.addAnimationByName(0, "run", true, 0);
    //   },
    // );
  }

  // static SpineWidgetController? spineControllerMajor;

  static LottieComposition? composition(EnumLottieType type) {
    LottieComposition? tmp = _kLottieType_vLottieComposition[type];
    if (tmp == null) {}

    return tmp;
  }

  static const hkTimeBoxGift = "af45ewrdf7u5hffj";
  Timer? _timerBoxGfit;

  int maxSeconds = 60 * 60 * 8;
  // static const int maxSeconds = 60 * 1;

  var textBoxGiftTime = "".obs;
  var boxGiftTime = (-1).obs;

  int shengyuTime() {
    int mill = DateTime.now().millisecondsSinceEpoch;
    var tmpData = box.get(hkTimeBoxGift) ?? {"count": 0, "time": mill};
    int time = tmpData['time'];
    saveTimeBoxGift(time);
    // 过了多少时间
    int diff = mill - time;
    // 剩下多少时间
    int shengyu = ((maxSeconds * 1000 - diff) / 1000).toInt();
    if (shengyu <= 0) {
      shengyu = 0;
    }
    return shengyu;
  }

  resetTimeBoxGift() {
    int mill = DateTime.now().millisecondsSinceEpoch;
    saveTimeBoxGift(mill);
    initTimerBoxGift(hasFirst: false);
    ssLogggg("====== cresetTime:$mill");
  }

  initTimerBoxGift({bool hasFirst = true}) {
    int shengyu = shengyuTime();
    if (hasFirst) {
      boxGiftTime = shengyu.obs;

      textBoxGiftTime = formatDuration(shengyu).obs;
    }
    // ssLogggg("====_initTimer=shengyu:$shengyu");
    _timerBoxGfit?.cancel();
    _timerBoxGfit = Timer.periodic(Duration(seconds: 1), (timer) {
      int tick = timer.tick;
      int shengyu = shengyuTime();
      int seconds = shengyu;
      if (shengyu <= 0) {
        textBoxGiftTime.value = formatDuration(seconds);
        boxGiftTime.value = shengyu;
        // MainController.to.showBoxTime.value = false;
        _timerBoxGfit?.cancel();
        // ssLogggg("=====_initTimer=shengyu:$shengyu ${textBoxGiftTime.value}");
        return;
      }
      // ssLogggg("=====_initTimer=shengyu:$shengyu ${textBoxGiftTime.value}");
      textBoxGiftTime.value = formatDuration(seconds);
      boxGiftTime.value = shengyu;
    });
  }

  saveTimeBoxGift(int time) {
    box.put(hkTimeBoxGift, {"time": time});
  }

  String formatDuration(int seconds) {
    if (seconds <= 0) {
      return "";
    }

    Duration duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String secs = twoDigits(duration.inSeconds.remainder(60));

    return '$hours:$minutes:$secs';
  }
}

enum EnumLottieType {
  wheelmoney("wheelmoney"),
  jackpotGrand("jackpotGrand"),
  jackpotMajor("jackpotMajor"),
  jackpotMini("jackpotMini"),
  bian3("bian3"),
  bian2("bian2"),
  bian("bian"),
  bigwin("bigwin"),
  wow("wow"),
  superwin("superwin"),
  megawin("megawin"),
  money("money");

  final String name;

  const EnumLottieType(this.name);
}

enum EnumJackpot {
  unknow("unknow"),
  grand("grand"),
  major("major"),
  mini("mini");

  final String name;

  const EnumJackpot(this.name);
}
