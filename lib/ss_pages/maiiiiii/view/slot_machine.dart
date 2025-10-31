import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/glow_border/glow_border.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/roller_list/roller_list.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer.dart';

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
  final double slotsItemW = ScreenUtil().screenWidth / 6;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  update(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    ssLogggg("==slot machine build==");
    return LayoutBuilder(

      builder: (context, c) {
        slotsH = c.maxHeight;
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
                    rollerWidget(key: firstRoller, index: 0),
                    rollerWidget(key: secondRoller, index: 1),
                    rollerWidget(key: thirdRoller, index: 2),
                    rollerWidget(key: fourthRoller, index: 3),
                    rollerWidget(key: fiveRoller, index: 4),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  rollerWidget({required Key key, required int index}) {
    return RollerList(
      items: getSlots(index),
      visibilityRadius: 1,
      scrollType: ScrollType.goesOnlyBottom,
      width: slotsItemW,
      // height: 150.h,
      initialIndex: 1,
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

  List<Widget> getSlots(int index) {
    double width = slotsH / 3.5;
    List<Widget> result = [];
    double dd = 8.w;
    double dd2 = 4.w;
    List<String> imgs = MainController.to.rollerImgs[index];
    int length = imgs.length;
    for (int i = 0; i < length; i++) {
      Widget tmpC = Container(
        // color: Colors.green,
        // child: Image.asset(MainController.kName_vImgName[imgs[i]]!, width: width - dd, height: width - dd),
        child: Text("${imgs[i]}",style: TextStyle(color: Colors.yellow),),
      );
      Widget child = Container(
        width: width - dd2,
        height: width - dd2,
        padding: EdgeInsets.all(4.0),
        color: Colors.transparent,
        child: Center(child: tmpC),
      );
      result.add(
        Container(
          width: width,
          height: width,
          // color: Colors.green,
          child: i % 2 == 0 && false
              ? Center(
                  child: ZoMonoCromeBorder(
                    trackBorderColor: Colors.yellow,
                    cornerRadius: dd2,
                    animationDuration: Duration(milliseconds: 800),
                    borderStyle: ZoMonoCromeBorderStyle.stroke,
                    borderWidth: dd2,
                    child: child,
                  ),
                )
              : child,
        ),
      );
    }
    return result;
  }

  List<String> slotsI = [
    Assets.img.slots.slotsBouns.path,
    Assets.img.slots.slotsJ.path,
    Assets.img.slots.slotsK.path,
    Assets.img.slots.slotsXuehua.path,
    Assets.img.slots.slotsLingdang.path,
    Assets.img.slots.slotsShengdanshu.path,
    Assets.img.slots.slotsWild.path,
  ];
}
