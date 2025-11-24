import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_source2target.dart';
import 'package:slots_132/jc_gj/jc_widget/hero_fly/hero_fly.dart';
import 'package:slots_132/jc_gj/jc_widget/roller_list/roller_list.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_common/firebase_json/pay_table.dart';
import 'package:slots_132/ss_common/firebase_json/paylines.dart';
import 'package:slots_132/ss_common/firebase_json/reel_strips.dart';
import 'package:slots_132/ss_pages/bonus_game/bonus_game.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/center_view.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/slot_machine.dart';

import '../../jc_gj/log.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    initRoller5(hasFirstInit: true);
    initOther();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    ssLogggg("=======kZuobiao_vWidgetContex onReady:$kZuobiao_vWidgetContext");
    recordZuobiaoPosition();
    ssLogggg(
      "=======kZuobiao_vWidgetContextOffset onReady:$kZuobiao_vWidgetContextOffset",
    );
  }

  recordZuobiaoPosition() {
    kZuobiao_vWidgetContext.forEach((int zuobiao, BuildContext context) {
      RenderBox targetBox = context.findRenderObject() as RenderBox;
      var targetLocation = targetBox.localToGlobal(Offset.zero);
      kZuobiao_vWidgetContextOffset[zuobiao] = targetLocation;
    });
  }

  // 显示free spins
  var showFreeSpin = false.obs;

  // 显示中奖路
  var showWinLines = false.obs;

  // 滚动是否结束
  var hasScrollerEnd = false.obs;

  final firstRoller = GlobalKey<RollerListState>();
  final secondRoller = GlobalKey<RollerListState>();
  final thirdRoller = GlobalKey<RollerListState>();
  final fourthRoller = GlobalKey<RollerListState>();
  final fiveRoller = GlobalKey<RollerListState>();
  final slotMachineKey = GlobalKey<SSSlotMachineState>();
  final keyCenterJinling = GlobalKey();
  final keyBonusGame = GlobalKey();

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
              ssLogggg("=====win lines last=zuobiao:$ddddaaa ");
              Set<int> tmpWinNextZuobiao = {};
              for (int i = 0; i < allLenght; i++) {
                var zuobiao = ddddaaa[i];
                bool result = kZuobiao_vCategory.containsKey(zuobiao);
                if (result) {
                  var value = kZuobiao_vCategory[zuobiao] ?? "";
                  ssLogggg("=====win lines last=zuobiao:$zuobiao key:$value");

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

  onStartRoller() async {
    if (hasScrollerEnd.value) {
      ssLogggg("==onStartRoller=正在滚动==");
      return;
    }

    ssLogggg("==onStartRoller==start=");
    kZuobiao_vWidgetContext = {};
    showFreeSpin.value = false;
    showWinLines.value = false;
    cunt = 0;
    hasScrollerEnd.value = true;
    result = Completer();

    double tpmBeisu = -curBeisu.value;
    curSpinMoney.value = tpmBeisu;
    onAddMoney(tpmBeisu, onEnd: () {}, showMoneyAnimated: false);

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

    initRoller5();

    _changeChild(firstRoller, 0);
    _changeChild(secondRoller, 1);
    _changeChild(thirdRoller, 2);
    _changeChild(fourthRoller, 3);
    _changeChild(fiveRoller, 4);

    _resetRoller(firstRoller, 0);
    _resetRoller(secondRoller, 1);
    _resetRoller(thirdRoller, 2);
    _resetRoller(fourthRoller, 3);
    _resetRoller(fiveRoller, 4);
    // 添加经验
    onAddExp(100);
    double tmpAddMoney = 0.0;
    List<double> payBeisu = [];
    int lines = SSPayTable.lines();
    double beisu = curBeisu.value;
    for (var data in winCurCategoryLines) {
      String category = data.keys.first;
      int count = data.values.first.length;
      double tmpPay = SSPayTable.payBeishu(category, count);

      double tmpPayyy = beisu / lines * tmpPay;
      ssLogggg("==onStartRoller==end=tmpPayyy:$tmpPayyy");
      tmpAddMoney = tmpAddMoney + tmpPayyy;
      payBeisu.add(tmpPay);
    }

    curSpinMoney.value = tmpAddMoney;

    ssLogggg("====winCurZuobiao:$winCurZuobiao");
    ssLogggg(
      "====kZuobiao_vWidgetContextOffset:$kZuobiao_vWidgetContextOffset",
    );
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
          OverlayFly2TargetKey().showWithSize(
            childSize: Size(64.w, 64.w),
            targetContext: keyCenterJinling.currentContext!,
            topLeftOffset: startPosition,
            heroChild: heroChild,
          );
        }
      }
    });
    if (containerslotNumH1) {
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
          img = Assets.img.mainBounsGame.path;
          // img = Assets.img.slots.slotsH1.path;
          Widget heroChild = Image.asset(img);
          containerslotNumKEY = true;
          bonusGameCount++;

          OverlayFly2TargetKey().showWithSize(
            childSize: Size(64.w, 64.w),
            targetContext: keyBonusGame.currentContext!,
            topLeftOffset: startPosition,
            heroChild: heroChild,
          );
        }
      }
    });

    if (containerslotNumKEY) {
      onAddBonusGameCount(bonusGameCount);
      await Future.delayed(Duration(milliseconds: 1200), () {});
    }
    DateTime curTime = DateTime.now();
    ssLogggg("==onStartRoller==end=curTime:${curTime.millisecondsSinceEpoch}");
    onAddMoney(
      tmpAddMoney,
      onEnd: () async{
        await Future.delayed(Duration(milliseconds: 500), () {});
        DateTime curTime2 = DateTime.now();
        ssLogggg("==onStartRoller==end=curTime2:${curTime2.millisecondsSinceEpoch-curTime.millisecondsSinceEpoch}");
        hasScrollerEnd.value = false;

        int tmpBonusGameCount = curBonusGameCount.value;
        if (tmpBonusGameCount >= maxBonusGameCount) {
          OverlayBonusGame().show();

          resetToZeroBonusGameCount();
        }
      },
      showMoneyAnimated: true,
    );
    //

    ssLogggg("==onStartRoller==end=winCurZuobiao:$winCurZuobiao");
    ssLogggg("==onStartRoller==end=winCurCategoryLines:$winCurCategoryLines");
    ssLogggg(
      "==onStartRoller==end=payBeisu:$payBeisu  tmpAddMoney:$tmpAddMoney",
    );
  }

  _changeChild(GlobalKey<RollerListState> key, int index) {
    List<Widget> slotsWidget1 =
        slotMachineKey.currentState?.getSlots(index) ?? [];
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
    if (index == 4) {
      time = 1100;
    }
    ssLogggg("=======time:$time");
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

  setContext(BuildContext context, int index) {
    kZuobiao_vWidgetContext[index] = context;
  }

  /// ****************************************************************************************************************
  /// 除去slot machine的逻辑

  var box = SSHive.box;
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
  static const double minBet = 8.0;
  static const double maxBet = 10.0;

  var curBonusGameCount = 0.obs;

  // 经验值
  var curLevelExp = 0.obs;

  // 当前倍数
  var curBeisu = 8.0.obs;

  // 转spin的时候消耗或者获取的money
  var curSpinMoney = 0.0.obs;

  var curCollectStar = 0.obs;

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

  onAddMoney(
    double money, {
    VoidCallback? onEnd,
    required bool showMoneyAnimated,
  }) {
    if (money == 0) {
      onEnd?.call();
      return;
    }

    double tmpCurMmmm = curMonnnn.value;
    tmpCurMmmm = tmpCurMmmm + money;
    box.put(hkMonnnn, tmpCurMmmm);
    curMonnnn.value = tmpCurMmmm;
    if (money > 0) {
      overlayMainTopMoney.showWithSize(
        childSize: Size(32.w, 32.w),
        onEnd: onEnd,
      );
    }else{
      onEnd?.call();
    }
  }

  onAddExp(int exp) {
    int tmpExp = curLevelExp.value;

    tmpExp = tmpExp + exp;

    box.put(hkLevelExp, tmpExp);

    curLevelExp.value = tmpExp;
    ssLogggg("======tmpExp:$tmpExp=");
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
  }
}
