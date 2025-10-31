import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
  final double slotsItemW = ScreenUtil().screenWidth / 5.8;
  double get slotsItemH => slotsH / 3;

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
        return Obx((){
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
                    rollerWidget(key: firstRoller, index: 0),
                    rollerWidget(key: secondRoller, index: 1),
                    rollerWidget(key: thirdRoller, index: 2),
                    rollerWidget(key: fourthRoller, index: 3),
                    rollerWidget(key: fiveRoller, index: 4),
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
        );});

      },
    );

  }

  _rollerForground(int index){
    int iiii = index+1+0*5;
    int iiii2 = index+1+(1)*5;
    int iiii3 = index+1+(2)*5;

    var data = MainController.to.winZuobiao;
    return Container(
      width: slotsItemW,
      height: slotsItemW*3,
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.blueAccent.withValues(alpha: 1)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Text("$iiii"),
          Text("$iiii2"),
          Text("$iiii3"),
        ],),
      ),
    );
  }


  rollerWidget({required Key key, required int index}) {
    return RollerList(
      items: getSlots(index),
      visibilityRadius: 1,
      scrollType: ScrollType.goesOnlyBottom,
      width: slotsItemW,
      height: slotsItemH,
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
    double width = slotsItemW;
    double height = slotsItemH;
    List<Widget> result = [];
    double dd = 4.w;
    double dd2 = 4.w;
    List<String> imgs = MainController.to.rollerImgs[index];
    int length = imgs.length;
    var data = MainController.to.winZuobiao;
    for (int i = 0; i < length; i++) {
      int iiii = index+1+i*5;
      bool showWin = data.contains(iiii) && MainController.to.showWinLines.value;
      Widget tmpC = Container(
        color: Colors.blueAccent.withValues(alpha: 0.0),
        child: Image.asset(MainController.kName_vImgName[imgs[i]]!, width: width - dd, height: height - dd),
        // child: Text("${imgs[i]}",style: TextStyle(color: Colors.yellow),),
      );
      Widget child = Container(
        width: width - dd2,
        height: height - dd2,
        padding: EdgeInsets.all(4.w),
        color: Colors.transparent,
        child: Center(child: tmpC),
      );
      result.add(
        Container(
          width: width,
          height: height,
          color: Colors.green.withValues(alpha: 0.0),
          child: showWin
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

}
