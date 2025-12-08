import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/log.dart';

class BtnBeisuWidget extends StatefulWidget {
  const BtnBeisuWidget({super.key, required this.onBtn, required this.onBtn2});

  final ValueChanged<double> onBtn;
  final ValueChanged<double> onBtn2;

  @override
  State<BtnBeisuWidget> createState() => _BtnBeisuWidgetState();
}

class _BtnBeisuWidgetState extends State<BtnBeisuWidget> {
  bool showGudingBeisu = false;
  double showGudingBeisuAngle = 0;

  @override
  Widget build(BuildContext context) {
    return bottomBeisuBtn();
  }

  bottomBeisuBtn() {
    return Column(
      children: [
        Container(
          width: 218.h,
          height: 108.h,
          color: Colors.teal.withValues(alpha: 0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  SizedBox(height: 10.h),
                  Image.asset(
                    Assets.img.popupBeisu.path,
                    width: 148.h,
                    height: 59.h,
                    fit: BoxFit.fill,
                  ),
                ],
              ),

              Positioned(
                left: 0,
                right: 0,
                top: 24.h,
                // bottom: 0.h,
                child: Center(
                  child: PendulumAnimation(
                    gudingBeisu: showGudingBeisu,
                    onAngle: (double value) {
                      showGudingBeisuAngle = value;

                      // ssLogggg("=====showGudingBeisuAngle:$showGudingBeisuAngle");
                    },
                    gudingBeisuAngle: showGudingBeisuAngle,
                    child: Image.asset(
                      Assets.img.popupZhiz.path,
                      width: 31.h,
                      height: 110.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 62.h,
                right: 0,
                left: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: onBtn,
                    child: Container(
                      width: 218.h,
                      height: 55.h,
                      color: Colors.brown.withValues(alpha: 0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(
                            Assets.img.btnWheel.path,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 4.h,
                            child: Center(
                              child: SSTxtBorder(
                                text: "Claim",
                                fontSize: 24.sp,
                                fontFamily: FontFamily.interBold,
                                fontWeight: FontWeight.w700,
                                foreground: Color(0xff1C5700),
                              ),
                            ),
                          ),

                          Positioned(
                            top: -10.h,
                            right: 0,
                            child: Image.asset(
                              Assets.img.video.path,
                              width: 28.h,
                              height: 28.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        GestureDetector(
          onTap: () {
            widget.onBtn2(0.1);
          },
          child: SSTxtBorder(
            text: "Claim 10%",
            fontSize: 16.sp,
            fontFamily: FontFamily.interBold,
            fontWeight: FontWeight.w700,
            foreground: Color(0xff1C5700),
          ),
        ),
      ],
    );
  }

  bool canClick = true;

  void onBtn() {
    setState(() {
      showGudingBeisu = !showGudingBeisu;
    });
    if (canClick) {
      canClick = false;
      double tmpAngle = showGudingBeisuAngle ?? 0;
      double beisu = 2.0;
      if (tmpAngle >= -1.0472 && tmpAngle <= -0.69) {
        beisu = 1.2;
      } else if (tmpAngle <= 1.0472 && tmpAngle >= 0.69) {
        beisu = 1.6;
      }
      ssLogggg("======beisu2222:$beisu");
      Future.delayed(Duration(milliseconds: 1000), () {
        widget.onBtn(beisu);
        canClick = true;
      });
    }
  }
}

class PendulumAnimation extends StatefulWidget {
  const PendulumAnimation({
    super.key,
    required this.child,
    required this.gudingBeisu,
    required this.onAngle,
    this.gudingBeisuAngle,
  });

  final Widget child;
  final bool gudingBeisu;
  final double? gudingBeisuAngle;
  final ValueChanged<double> onAngle;

  @override
  State<PendulumAnimation> createState() => _PendulumAnimationState();
}

class _PendulumAnimationState extends State<PendulumAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    double start = -60 * math.pi / 180;
    double end = 60 * math.pi / 180;
    ssLogggg("===start:$start= end:$end");
    if (widget.gudingBeisu) {
      start = end = widget.gudingBeisuAngle ?? 0;
    }

    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        // 角度范围：-60° ~ +60°
        final double angle = lerpDouble(
          start,
          end,
          Curves.easeInOut.transform(controller.value),
        )!;
        widget.onAngle(angle);
        return Transform.rotate(angle: angle, child: child);
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double? lerpDouble(num a, num b, double t) {
    return a + (b - a) * t;
  }
}
