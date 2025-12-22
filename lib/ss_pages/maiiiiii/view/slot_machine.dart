import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_scale.dart';
import 'package:slots_132/jc_gj/jc_widget/roller_list/roller_list.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_common/sssssp/spine_border.dart';
import 'package:slots_132/ss_common/sssssp/spine_border2.dart';
import 'package:slots_132/ss_common/sssssp/spine_border3.dart';
import 'package:slots_132/ss_common/sssssp/spine_sdlr_slots.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/glow_border/glow_border.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer_effect.dart';

class SSSlotMachine extends StatefulWidget {
  const SSSlotMachine({super.key});

  @override
  State<SSSlotMachine> createState() => SSSlotMachineState();
}

class SSSlotMachineState extends State<SSSlotMachine> {
  final firstRoller = MainController.to.firstRoller;
  final secondRoller = MainController.to.secondRoller;
  final thirdRoller = MainController.to.thirdRoller;
  final fourthRoller = MainController.to.fourthRoller;
  final fiveRoller = MainController.to.fiveRoller;
  int? first;
  int? second;
  int? third;
  int? fourth;
  int? five;

  double slotsH = 200.h;
  double slotsW = 330.w;
  final double slotsItemW = 65.w;

  double get slotsItemH => 63.h;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ssLogggg("==slot machine build==");
    return LayoutBuilder(
      builder: (context, c) {
        slotsH = c.maxHeight;
        slotsW = c.maxWidth;
        return Obx(() {
          bool show = MainController.to.curShowFreeSpin.value;

          return Container(
            width: double.infinity,
            height: slotsH,
            // color: Colors.green,
            child: Stack(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      rollerWidget(key: firstRoller, column: 0),
                      rollerWidget(key: secondRoller, column: 1),
                      rollerWidget(key: thirdRoller, column: 2),
                      rollerWidget(key: fourthRoller, column: 3),
                      rollerWidget(key: fiveRoller, column: 4),
                    ],
                  ),
                ),
                columnW(),
                _rollerEndWidget(),
              ],
            ),
          );
        });
      },
    );
  }

  Widget columnW() {
    double itemW = slotsItemW-1.w;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 1.w,
          height: double.infinity,
          color: Color(0xffA43334).withValues(alpha: 0),
        ),
        SizedBox(width: itemW),
        Container(
          width: 1.w,
          height: double.infinity,
          color: Color(0xffA43334),
        ),
        SizedBox(width: itemW),
        Container(
          width: 1.w,
          height: double.infinity,
          color: Color(0xffA43334),
        ),
        SizedBox(width: itemW),
        Container(
          width: 1.w,
          height: double.infinity,
          color: Color(0xffA43334),
        ),
        SizedBox(width: itemW),
        Container(
          width: 1.w,
          height: double.infinity,
          color: Color(0xffA43334),
        ),
      ],
    );
  }

  _rollerEndWidget() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getCenterWidget(0),
          getCenterWidget(1),
          getCenterWidget(2),
          getCenterWidget(3),
          getCenterWidget(4),
        ],
      ),
    );
  }

  Widget getCenterWidget(int column) {
    double width = slotsItemW - 1.w;
    // width = 100;

    double height = slotsItemH;
    // height = 100;
    List<Widget> result = [];

    int length = 3;
    var data = MainController.to.winCurZuobiao;
    var kZuobiao_vCategory_cur = MainController.to.kZuobiao_vCategory_cur;
    bool showWinLins = MainController.to.showWinLines.value;
    for (int i = 0; i < length; i++) {
      int iiii = column + 1 + i * 5;

      bool showWin = data.contains(iiii) && showWinLins;
      String category = kZuobiao_vCategory_cur[iiii] ?? "";
      // ssLogggg("====result category:${category} iiii:$iiii");
      bool hasSlotWild = category.contains(MainController.slotNumWild);

      Widget child = Container(
        width: slotsItemW,
        height: slotsItemH,
        color: Colors.blueAccent.withValues(alpha: 0.0),
      );

      result.add(
        Builder(
          builder: (context) {
            MainController.to.setContext(context, iiii);
            return Container(
              width: width,
              height: height,
              color: Colors.yellow.withValues(alpha: 0.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  showWin && !hasSlotWild
                      ? Positioned(
                          left: -30.w,
                          right: -30.w,
                          top: -30.h,
                          bottom: -30.h,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.blueAccent.withValues(alpha: 0.0),
                            child: Stack(
                              children: [
                                Center(child: SSSpineBorder()),
                                // Center(
                                //   child: Lottie.asset(
                                //     Assets.lottt.sg1.data,
                                //     animate: true,
                                //     repeat: true,
                                //     width: double.infinity,
                                //     height: double.infinity,
                                //     fit: BoxFit.fill,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        )
                      : Center(child: child),
                ],
              ),
            );
          },
        ),
      );
    }
    List<Widget> result2 = _sdlrWinWidget(column);

    // ssLogggg("====kZuobiao_vWidgetContex: reset:${result.length}");
    return Stack(
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: result),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: result2),
      ],
    );
  }

  List<Widget> _sdlrWinWidget(int column) {
    double width = slotsItemW - 1.w;
    // width = 100;

    double height = slotsItemH;
    var data = MainController.to.winCurZuobiao;
    var kZuobiao_vCategory_cur = MainController.to.kZuobiao_vCategory_cur;
    bool showWinLins = MainController.to.showWinLines.value;
    int i0 = 0;
    int i1 = 1;
    int i2 = 2;
    int iiii0 = column + 1 + i0 * 5;
    int iiii1 = column + 1 + i1 * 5;
    int iiii2 = column + 1 + i2 * 5;

    bool showWin = data.contains(iiii0) && showWinLins;
    bool showWin1 = data.contains(iiii1) && showWinLins;
    bool showWin2 = data.contains(iiii2) && showWinLins;
    String category = kZuobiao_vCategory_cur[iiii0] ?? "";
    String category1 = kZuobiao_vCategory_cur[iiii1] ?? "";
    String category2 = kZuobiao_vCategory_cur[iiii2] ?? "";
    // ssLogggg("====result category:${category} iiii:$iiii");
    bool hasSlotWild = category.contains(MainController.slotNumWild);
    bool hasSlotWild1 = category1.contains(MainController.slotNumWild);
    bool hasSlotWild2 = category2.contains(MainController.slotNumWild);

    Widget child = Container(
      width: slotsItemW,
      height: slotsItemH,
      color: Colors.blueAccent.withValues(alpha: 0.0),
    );
    // ssLogggg(
    //   "======data:$data showWin:${MainController.to.winCurCategoryLines}",
    // );
    // ssLogggg("======hasSlotWild:$hasSlotWild showWin:$showWin");
    // ssLogggg("======hasSlotWild1:$hasSlotWild1 showWin:$showWin1");
    // ssLogggg("======hasSlotWild2:$hasSlotWild2 showWin:$showWin2");
    List<Widget> result2 = [];
    // 第1个圣诞老人
    if (hasSlotWild && showWin) {
      // 第2个圣诞老人
      if (hasSlotWild1 && showWin1) {
        // 第3个圣诞老人
        if (hasSlotWild2 && showWin2) {
          result2.add(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width,
                  height: height * 3,
                  color: Colors.green.withValues(alpha: 0.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [

                      Positioned(
                        left: -2.2.w,
                        right: -2.2.w,
                        top: -0.h,
                        bottom: -0.h,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.blueAccent.withValues(alpha: 0.0),
                          child: const SpineShengdaolaorenSlots(),
                        ),
                      ),

                      Positioned(
                        left: -30.w,
                        right: -30.w,
                        top: -30.h,
                        bottom: -30.h,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.blueAccent.withValues(alpha: 0.0),
                          child: Center(child: SSSpineBorder3()),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          result2.add(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width,
                  height: height * 2,
                  color: Colors.green.withValues(alpha: 0.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: -30.w,
                        right: -30.w,
                        top: -30.h,
                        bottom: -30.h,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.blueAccent.withValues(alpha: 0.0),
                          child: Center(child: SSSpineBorder2()),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
          result2.add(child);
        }
      } else {
        result2.add(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height,
                color: Colors.green.withValues(alpha: 0.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -30.w,
                      right: -30.w,
                      top: -30.h,
                      bottom: -30.h,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.blueAccent.withValues(alpha: 0.0),
                        child: Center(child: SSSpineBorder()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
        result2.add(child);
        result2.add(child);
      }
    }
    // 第2个圣诞老人
    else if (hasSlotWild1 && showWin1) {
      if (hasSlotWild2 && showWin2) {
        result2.add(child);

        result2.add(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height * 2,
                color: Colors.green.withValues(alpha: 0.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -30.w,
                      right: -30.w,
                      top: -30.h,
                      bottom: -30.h,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.blueAccent.withValues(alpha: 0.0),
                        child: Center(child: SSSpineBorder2()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      } else {
        result2.add(child);
        result2.add(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height,
                color: Colors.green.withValues(alpha: 0.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -30.w,
                      right: -30.w,
                      top: -30.h,
                      bottom: -30.h,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.blueAccent.withValues(alpha: 0.0),
                        child: Center(child: SSSpineBorder()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
        result2.add(child);
      }
    } else if (hasSlotWild2 && showWin2) {
      result2.add(child);

      result2.add(child);
      result2.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: height,
              color: Colors.green.withValues(alpha: 0.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: -30.w,
                    right: -30.w,
                    top: -30.h,
                    bottom: -30.h,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.blueAccent.withValues(alpha: 0.0),
                      child: Center(child: SSSpineBorder()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return result2;
  }

  rollerWidget({required Key key, required int column}) {
    return RollerList(
      items: getSlots(column),
      visibilityRadius: 1,
      scrollType: ScrollType.goesOnlyTop,
      width: slotsItemW,
      height: slotsItemH,
      initialIndex: MainController.to.initRollerIndex(column),
      enabled: false,
      // dividerThickness: 8,
      key: key,
      onSelectedIndexChanged: (value) {
        ssLogggg("=onSelectedIndexChanged===value:$value");
        // setState(() {
        //   first = value;
        // });
      },
    );
  }

  List<Widget> getSlots(int column, {bool showScatterAnimated = false}) {
    double width = slotsItemW;
    double height = slotsItemH;
    List<Widget> result = [];

    List<String> imgs = MainController.to.rollerImgs[column];
    int length = imgs.length;
    var data = MainController.to.winCurZuobiao;
    for (int i = 0; i < length; i++) {
      int iiii = column + 1 + i * 5;
      double imgSubD = 0.w;
      double dd2 = 0.w;

      bool showWin =
          data.contains(iiii) && MainController.to.showWinLines.value;
      String category = imgs[i];
      bool hasSlotWild = category.contains(MainController.slotNumWild);
      bool hasSlotScatter = category.contains(MainController.slotNumSCATTER);
      if (!hasSlotWild) {
        imgSubD = 8.w;
        dd2 = 4.w;
      }
      Widget tmpC = Container(
        color: Colors.green.withValues(alpha: 0.0),
        child: Image.asset(
          MainController.kCategoryName_vImgName[category]!,
          width: width - imgSubD,
          height: height - imgSubD,
          gaplessPlayback: true,
          fit: hasSlotWild ? BoxFit.fill : BoxFit.contain,
        ),
        // child: Text("${imgs[i]}",style: TextStyle(color: Colors.yellow),),
      );

      Widget child = Container(
        width: width - dd2,
        height: height - dd2,
        padding: EdgeInsets.all(0.w),
        color: Colors.cyan.withValues(alpha: 0.0),
        child: Center(child: tmpC),
      );
      result.add(
        Container(
          width: width,
          height: height,
          color: Colors.yellow.withValues(alpha: 0.0),
          child: Stack(
            children: [
              Center(
                child: (showWin && !hasSlotWild) || (showScatterAnimated && hasSlotScatter)
                    ? SSAScale(
                        child: ShiningEffect(
                          shineColor: Colors.yellow,
                          opacity: 1,
                          angle: 1.8,
                          child: child,
                        ),
                      )
                    : child,
              ),
            ],
          ),
        ),
      );
    }
    return result;
  }
}
