import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_scale.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/glow_border/glow_border.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/roller_list/roller_list.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer_effect.dart';

import 'glow_border/border2.dart';

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

  double slotsH = 250.h;
  final double slotsItemW = 64.h;

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
        return Obx(() {
          bool show = MainController.to.showFreeSpin.value;
          return Container(
            width: double.infinity,
            height: slotsH,
            color: Colors.blueAccent.withValues(alpha: 0.0),
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

  _rollerForground(int index) {
    int iiii = index + 1 + 0 * 5;
    int iiii2 = index + 1 + (1) * 5;
    int iiii3 = index + 1 + (2) * 5;

    var data = MainController.to.winCurZuobiao;
    return Container(
      width: slotsItemW,
      height: slotsItemW * 3,
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.blueAccent.withValues(alpha: 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text("$iiii"), Text("$iiii2"), Text("$iiii3")],
        ),
      ),
    );
  }

  rollerWidget({required Key key, required int column}) {
    return RollerList(
      items: getSlots(column),
      visibilityRadius: 1,
      scrollType: ScrollType.goesOnlyTop,
      width: slotsItemW,
      height: slotsItemH,
      initialIndex:MainController.to.initRollerIndex(column),
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
      if (!category.contains(MainController.slotNumWild)) {
        imgSubD = 8.w;
        dd2 = 4.w;
      }
      Widget tmpC = Container(
        color: Colors.blueAccent.withValues(alpha: 0.0),
        // child: Image.asset(
        //   MainController.kName_vImgName[category]!,
        //   width: width - imgSubD,
        //   height: height - imgSubD,
        // ),
        child: Text("${imgs[i]}",style: TextStyle(color: Colors.yellow),

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
          child: Stack(
            children: [
              Center(child:showWin?SSAScale(child: child): child),
              if (showWin)
                Center(
                  child: ZoMonoCromeBorder(
                    trackBorderColor: Colors.yellow,
                    cornerRadius: 4.w,
                    animationDuration: Duration(milliseconds: 800),
                    borderStyle: ZoMonoCromeBorderStyle.stroke,
                    borderWidth: 4.w,
                    child: Container(
                      width: width-4.w,
                      height: height-4.w,
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.black, width: 3.w),
                      // ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }
    return result;
  }
}
