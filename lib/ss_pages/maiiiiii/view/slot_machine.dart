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
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/glow_border/glow_border.dart';

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
  final double slotsItemW = 64.w;

  double get slotsItemH => 64.h;

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
          bool show = MainController.to.showFreeSpin.value;

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
                _rollerEndWidget(),
                // if(MainController.to.showFreeSpin.value)   Center(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       _rollerForground(0),
                //       _rollerForground(1),
                //       _rollerForground(2),
                //       _rollerForground(3),
                //       _rollerForground(4),
                //     ],
                //   ),
                // ),
              ],
            ),
          );
        });
      },
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
    double width = slotsItemW;
    // width = 100;

    double height = slotsItemH;
    // height = 100;
    List<Widget> result = [];

    int length = 3;
    var data = MainController.to.winCurZuobiao;
    var kZuobiao_vCategory_cur = MainController.to.kZuobiao_vCategory_cur;
    for (int i = 0; i < length; i++) {
      int iiii = column + 1 + i * 5;

      bool showWin =
          data.contains(iiii) && MainController.to.showWinLines.value;
      String category = kZuobiao_vCategory_cur[iiii] ?? "";
      // ssLogggg("====result category:${category} iiii:$iiii");
      bool hasSlotWild = category.contains(MainController.slotNumWild);

      Widget child = Container(
        width: slotsItemW,
        height: slotsItemH,
        color: Colors.blueAccent.withValues(alpha: 0.0),
      );

      result.add(
        Center(
          child: Builder(
            builder: (context) {
              MainController.to.setContext(context, iiii);
              return Container(
                width: width,
                height: height,
                color: Colors.yellow.withValues(alpha: 0.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    showWin
                        ? Positioned(
                            left: -30.w,
                            right: -30.w,
                            top: -30.h,
                            bottom: -30.h,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.blueAccent.withValues(alpha: 0.0),
                              child: Center(
                                child: Lottie.asset(
                                  Assets.lottt.bian.data,
                                  animate: true,
                                  repeat: true,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          )
                        : Center(child: child),
                  ],
                ),
              );
            },
          ),
        ),
      );
    }
    ssLogggg("====kZuobiao_vWidgetContex: reset:${result.length}");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: result,
    );
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

  List<Widget> getSlots(int column) {
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
          fit: BoxFit.fill,
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
              Center(child: showWin ? SSAScale(child: child) : child),
              // if (showWin)
              //   Center(
              //     child: ZoMonoCromeBorder(
              //       trackBorderColor: Colors.yellow,
              //       cornerRadius: 4.w,
              //       animationDuration: Duration(milliseconds: 800),
              //       borderStyle: ZoMonoCromeBorderStyle.stroke,
              //       borderWidth: 4.w,
              //       child: Container(
              //         width: width - 4.w,
              //         height: height - 4.w,
              //         // decoration: BoxDecoration(
              //         //   border: Border.all(color: Colors.black, width: 3.w),
              //         // ),
              //       ),
              //     ),
              //   ),
            ],
          ),
        ),
      );
    }
    return result;
  }
}
