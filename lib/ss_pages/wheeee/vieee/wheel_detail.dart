import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/log.dart';

class SSWheelDetail extends StatefulWidget {
  const SSWheelDetail({super.key});

  @override
  State<SSWheelDetail> createState() => _SSWheelDetailState();
}

class _SSWheelDetailState extends State<SSWheelDetail> {
  @override
  Widget build(BuildContext context) {
    Widget child = Container(
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
          Positioned.fill(child: ControlledWheel()),
        ],
      ),
    );
    return child;
    return Obx(() {
      return child;
    });
  }
}

class ControlledWheel extends StatefulWidget {
  const ControlledWheel({super.key});

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

  void spinTo(int fromIndex, int toIndex) {
    const int segmentCount = 16;
    const double segmentAngle = 360 / segmentCount;

    final fromAngle = fromIndex * segmentAngle + segmentAngle / 2;
    final toAngle = toIndex * segmentAngle + segmentAngle / 2;

    final double turns = 360 * 2; // 转5圈
    final double target = turns + (toAngle - fromAngle);

    _animation = Tween<double>(begin: _startAngle, end: _startAngle + target)
        .animate(
          CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut),
        );

    _controller.forward(from: 0).whenComplete(() {
      _startAngle += target % 360; // 只保留余角
    });
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
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(
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
                        child: AutoSizeText(
                          "30",
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.rubik,
                          ),
                          minFontSize: 7.w,
                          stepGranularity: 7.w,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),

                  // if (canClick)
                  // Positioned(
                  //   top: 100.h,
                  //   // bottom: 0,
                  //   // right: 0.w,
                  //   left: 100.w,
                  //   child: Center(
                  //     child: IgnorePointer(
                  //       child: PBAnimatedScale(
                  //         child: Image.asset(
                  //           Assets.tupian.gesture.path,
                  //           width: 120.w,
                  //           height: 120.w,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _onSpin() {
    int current = Random().nextInt(16);
    int target = Random().nextInt(16);
    ssLogggg("=_onSpin==current:$current=target:$target=");
    spinTo(current, target);
  }
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 200), (t) {
      setState(() {
        showFirst = !showFirst;
        if (showFirst) {
          icon = Assets.img.wheelZpF.path;
        } else {
          icon = Assets.img.wheelZpF2.path;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }
}
