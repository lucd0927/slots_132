import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_scale.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/roller_list/roller_list.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/lucky_slots/lucky_slots_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/glow_border/glow_border.dart';

class SSSlotMachineLucky extends StatefulWidget {
  const SSSlotMachineLucky({super.key});

  @override
  State<SSSlotMachineLucky> createState() => SSSlotMachineLuckyState();
}

class SSSlotMachineLuckyState extends State<SSSlotMachineLucky> {
  final firstRoller = LuckySlotsController.to.firstRoller;
  final secondRoller = LuckySlotsController.to.secondRoller;
  final thirdRoller = LuckySlotsController.to.thirdRoller;
  final fourthRoller = LuckySlotsController.to.fourthRoller;

  int? first;
  int? second;
  int? third;
  int? fourth;
  int? five;

  double slotsH = 200.h;
  double slotsW = 330.w;
  double slotsItemW = 64.w;

  double slotsItemH = 64.h;

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
        // ssLogggg("==slot machine build=slotsH:$slotsH=slotsW:$slotsW");
        return Obx(() {
          bool show = MainController.to.showFreeSpin.value;
          slotsItemW = slotsW / 4;
          slotsItemH = slotsH / 3;
          return Container(
            width: double.infinity,
            height: slotsH,

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
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
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

    List<String> imgs = LuckySlotsController.to.rollerData[column];
    int length = imgs.length;
    var data = MainController.to.winCurZuobiao;
    for (int i = 0; i < length; i++) {
      int iiii = column + 1 + i * 5;
      double imgSubD = 0.w;
      double dd2 = 0.w;

      String category = imgs[i];
      if (!category.contains(MainController.slotNumWild)) {
        imgSubD = 8.w;
        dd2 = 4.w;
      }
      Widget tmpC = Container(
        color: Colors.blueAccent.withValues(alpha: 0.0),

        child: SSTxtGraBorder(
          text: category,
          fontSize: 40.sp,
          strokeColor: Color(0xffEE101E),
        ),
      );
      Widget child = Container(
        width: width - dd2,
        height: height - dd2,
        padding: EdgeInsets.all(0.w),
        color: Colors.cyan.withValues(alpha: 0),
        child: Center(child: tmpC),
      );
      result.add(
        Container(
          width: width,
          height: height,
          color: Colors.green.withValues(alpha: 0),
          child: Stack(children: [child]),
        ),
      );
    }
    return result;
  }
}
