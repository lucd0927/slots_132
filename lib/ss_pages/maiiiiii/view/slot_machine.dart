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
  State<SSSlotMachine> createState() => _SSSlotMachineState();
}

class _SSSlotMachineState extends State<SSSlotMachine> {
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

  onStartRoller() async {
    await _roller(firstRoller);
    await _roller(secondRoller);
    await _roller(thirdRoller);
    await _roller(fourthRoller);
    await _roller(fiveRoller);
  }

  _roller(GlobalKey<RollerListState> key) async {
    int random = Random().nextInt(100) + 30;
    key.currentState
        ?.smoothScrollToIndex(
          random,
          duration: Duration(milliseconds: 2000),
          curve: Curves.easeInCubic,
        )
        .then((v) {
          ssLogggg("==smoothScrollToIndex end====");
        });
    await Future.delayed(Duration(milliseconds: 200));
  }

  double slotsH = 250.h;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        slotsH = c.maxHeight;
        return Container(
          width: double.infinity,
          height: slotsH,
          color: Colors.red.withValues(alpha: 0.2),
          child: Stack(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    rollerWidget(key: firstRoller, index: 0),
                    rollerWidget(key: secondRoller, index: 3),
                    rollerWidget(key: thirdRoller, index: 2),
                    rollerWidget(key: fourthRoller, index: 1),
                    rollerWidget(key: fiveRoller, index: 5),
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
      items: _getSlots(),
      visibilityRadius: 1,
      scrollType: ScrollType.goesOnlyBottom,
      width: ScreenUtil().screenWidth / 6,
      // height: 150.h,
      initialIndex: index,
      enabled: false,
      // dividerThickness: 8,
      key: key,
      onSelectedIndexChanged: (value) {
        ssLogggg("=onSelectedIndexChanged===value:$value");
        setState(() {
          first = value;
        });
      },
    );
  }

  List<Widget> _getSlots() {
    double width = slotsH / 3.5;
    List<Widget> result = [];
    for (int i = 0; i <= 6; i++) {
      Widget child = Image.asset(
        slotsI[i],
        width: width - 10.w,
        height: width - 10.w,
      );

      result.add(
        Container(
          width: width,
          height: width,
          padding: EdgeInsets.all(4.0),
          // color: Colors.red,
          child: Center(
            child: i % 2 == 0
                ? child
                : ZoMonoCromeBorder(
                    trackBorderColor: Colors.yellow,
                    cornerRadius: 4.w,
                    animationDuration: Duration(milliseconds: 800),
                    borderStyle: ZoMonoCromeBorderStyle.stroke,
                    borderWidth: 4.w,
                    // color: Colors.green,
                    child: child,
                  ),
          ),
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
