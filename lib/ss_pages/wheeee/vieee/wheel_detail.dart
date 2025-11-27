import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_common/model/gift_reward_model.dart';
import 'package:slots_132/ss_pages/wheeee/whe_controller.dart';

class SSWheelDetail extends StatefulWidget {
  const SSWheelDetail({super.key, required this.onEnd});

  final ValueChanged onEnd;

  @override
  State<SSWheelDetail> createState() => _SSWheelDetailState();
}

class _SSWheelDetailState extends State<SSWheelDetail> {
  @override
  Widget build(BuildContext context) {
    Widget child = Hero(
      tag: "Wheellll",
      child: Container(
        width: 375.w,
        height: 375.w,
        color: Colors.yellow.withValues(alpha: 0.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: IgnorePointer(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: ZpBorder(),
                ),
              ),
            ),
            Positioned.fill(
              child: ControlledWheel(
                onEnd: (value) {
                  widget.onEnd(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
    return child;
  }
}

class ControlledWheel extends StatefulWidget {
  const ControlledWheel({super.key, required this.onEnd});

  final ValueChanged onEnd;

  @override
  State<ControlledWheel> createState() => _ControlledWheelState();
}

class _ControlledWheelState extends State<ControlledWheel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _startAngle = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animation = AlwaysStoppedAnimation(0);
  }

  spinTo(int fromIndex, int toIndex) async {
    // 分成多少份
    int segmentCount = 16;
    // 每份多少度
    double segmentAngle = 360 / segmentCount;

    final fromAngle = fromIndex * segmentAngle + segmentAngle / 2;
    final toAngle = toIndex * segmentAngle + segmentAngle / 2;
    // 旋转多少圈
    final double turns = 360 * 2; // 转2圈
    final double target = turns + (toAngle - fromAngle);

    _animation = Tween<double>(begin: _startAngle, end: _startAngle + target)
        .animate(
          CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut),
        );

    await _controller.forward(from: 0).whenComplete(() {
      _startAngle = 0; // 只保留余角
    });
    ssLogggg("_controller.forward end:");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _animation.value * pi / 180,
              child: child,
            );
          },
          child: Center(
            child: Image.asset(
              Assets.img.wheelZp.path,
              width: 362.w,
              height: 362.w,
              fit: BoxFit.fill,
              gaplessPlayback: true,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Obx(() {
            return Center(
              child: GestureDetector(
                onTap: _onSpin,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 70.w,
                      height: 90.w,
                      color: Colors.red.withValues(alpha: 0),
                      child: Stack(
                        children: [
                          Image.asset(
                            Assets.img.wheelZz.path,
                            width: double.infinity,
                            height: double.infinity,
                            gaplessPlayback: true,
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 20.h,
                            bottom: 0,
                            child: Center(
                              child: SSTxtGraBorder(
                                text: "SPIN",
                                strokeColor: Color(0xffCC1420),
                                strokeWidth: 1.w,
                                fontSize: 24.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 20.h,
                      child: Container(
                        width: 24.w,
                        height: 24.w,
                        decoration: BoxDecoration(
                          color: Color(0xffFF4949),
                          borderRadius: BorderRadius.circular(24.w),
                          border: Border.all(
                            color: Color(0xffffffff),
                            width: 2.w,
                          ),
                        ),
                        child: Center(
                          child: SSAniiiiCount(
                            value: WheController.to.curWheNum.value,
                            textStyle: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamily.rubik,
                              height: 1,
                            ),
                          ),
                          // child: AutoSizeText(
                          //   "${}",
                          //   style: TextStyle(
                          //     color: Color(0xffffffff),
                          //     fontSize: 20.sp,
                          //     fontWeight: FontWeight.w700,
                          //     fontFamily: FontFamily.rubik,
                          //   ),
                          //   minFontSize: 7.w,
                          //   stepGranularity: 7.w,
                          //   maxLines: 1,
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  _onSpin() async {
    int time = WheController.to.curWheNum.value;
    WheController.to.showOneMore.value = false;
    if (time <= 0) {
      widget.onEnd(null);
      return;
    }
    WheController.to.subWheNum();
    int current = Random().nextInt(8);
    int target = Random().nextInt(8);
    current = 0;
    ssLogggg("=_onSpin==current:$current=target:$target=");
    if(target == 4){
      target = 0;
    }
    target =1;
    ssLogggg("=_onSpin==current:$current=target2:$target=");
    await spinTo(current, target);
    GiftRewardModel tmpGiftRewardModel =
        vIndex_vReward[target] ?? vIndex_vReward[2]!;
    widget.onEnd(tmpGiftRewardModel);
    ssLogggg("=_onSpin==spinTo:end=");
  }

  Map<int, GiftRewardModel> vIndex_vReward = {
    0: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 50,
      img: Assets.img.phoneSuip.path,
    ),
    1: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.spin,
      num: 10,
      img: Assets.img.phoneSuip.path,
    ),
    2: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 150,
      img: Assets.img.phoneSuip.path,
    ),
    3: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.xp,
      num: 2,
      img: Assets.img.phoneSuip.path,
    ),
    4: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.iphoneCard,
      num: 1,
      img: Assets.img.phoneSuip.path,
    ),

    5: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 150,
      img: Assets.img.phoneSuip.path,
    ),
    6: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 50,
      img: Assets.img.phoneSuip.path,
    ),
    7: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 50,
      img: Assets.img.phoneSuip.path,
    ),
  };
}

class ZpBorder extends StatefulWidget {
  const ZpBorder({super.key});

  @override
  State<ZpBorder> createState() => _ZpBorderState();
}

class _ZpBorderState extends State<ZpBorder> {
  String icon = Assets.img.wheelZpF.path;
  bool showFirst = false;
  late Timer timer;
  int curIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 200), (t) {
      setState(() {
        showFirst = !showFirst;
        if (showFirst) {
          curIndex = 1;
        } else {
          curIndex = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: curIndex,
      children: [
        Image.asset(
          Assets.img.wheelZpF.path,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
          gaplessPlayback: true,
        ),
        Image.asset(
          Assets.img.wheelZpF2.path,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
          gaplessPlayback: true,
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }
}
