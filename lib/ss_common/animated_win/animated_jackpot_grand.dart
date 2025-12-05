import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer_effect.dart';

class SSAnimatedJackpotGrand extends StatefulWidget {
  const SSAnimatedJackpotGrand({
    super.key,
    this.duration = const Duration(milliseconds: 2000),
  });

  final Duration duration;

  @override
  State<SSAnimatedJackpotGrand> createState() => _SSAnimatedJackpotGrandState();
}

class _SSAnimatedJackpotGrandState extends State<SSAnimatedJackpotGrand>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  // 方便判断时间区间
  bool get isTogetherTime => controller.value >= 0.5 && controller.value <= 0.6;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
    // animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    // animation = Tween<double>(begin: 0, end: 1).animate(controller,);
  }

  double jieduan1 = 0.25;
  double jieduan2 = 0.5;
  double jieduan3 = 0.75;
  double jieduan4 = 1;

  /// t 范围 0.0 - 1.0
  double scaleTop(double t) {
    if (t < jieduan1) {
      /// 0.0 - 1.0s 上放大，下缩小
      double p = t / jieduan1; // 0~1
      return lerp(1, 1.2, p); // 可自定义放大幅度
    } else if (t < jieduan2) {
      /// 1.0 - 1.2s 上缩小，下放大
      double p = (t - jieduan1) / (jieduan2 - jieduan1); // 0~1
      return lerp(1.2, 1, p);
    } else if (t < jieduan3) {
      /// 1.2s - 1.5s 一起放大
      double p = (t - jieduan2) / (jieduan3 - jieduan2);
      return lerp(1.0, 1.2, p);
    } else if (t <= jieduan4) {
      /// 1.5s - 2.0s 一起缩小 回到 1
      double p = (t - jieduan3) / (jieduan4 - jieduan3);
      return lerp(1.2, 1.0, p);
    }
    return 1.0;
  }

  double scaleBottom(double t) {
    if (t < jieduan1) {
      /// 0.0 - 1.0s 上放大，下缩小
      double p = t / jieduan1; // 0~1
      return lerp(1, 0.8, p); // 可自定义放大幅度
    } else if (t < jieduan2) {
      /// 1.0 - 1.2s 上缩小，下放大
      double p = (t - jieduan1) / (jieduan2 - jieduan1); // 0~1
      return lerp(0.8, 1, p);
    } else if (t < jieduan3) {
      /// 1.2s - 1.5s 一起放大
      double p = (t - jieduan2) / (jieduan3 - jieduan2);
      return lerp(1.0, 1.2, p);
    } else if (t <= jieduan4) {
      /// 1.5s - 2.0s 一起缩小 回到 1
      double p = (t - jieduan3) / (jieduan4 - jieduan3);
      return lerp(1.2, 1.0, p);
    }
    return 1.0;
  }

  double lerp(double a, double b, double t) => a + (b - a) * t;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        double t = controller.value; // 0~1
        double topS = scaleTop(t);
        double botS = scaleBottom(t);
        // ssLogggg("======topS:$topS");
        // final t = animation.value;
        // final t1 = animation.value;
        var t1 = topS;
        var t2 = botS;
        // t1 = t2 =1;
        return Container(
          width: double.infinity,
          height: 300.h,
          // color: Colors.yellow,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 350.h *1,
                height: 250.h * 1,
                // child: JackpotBorder(),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0.h,
                child: Container(
                  width: 102.h * t1,
                  height: 64.h * t1,
                  child: Center(
                    child: FittedBox(
                      child: ShiningEffect(
                        shineColor: Color(0xfffff200),
                        opacity: 1,
                        angle: -0.9,
                        topLeft: false,
                        child: Image.asset(Assets.mya.jackpot.grandH.path),
                        // child: Image.asset(Assets.mya.superwin.supers.path),
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                top: 65.h,
                child: Container(
                  width: 320.h * t1,
                  height: 85.h * t1,
                  child: Center(
                    child: FittedBox(
                      child: ShiningEffect(
                        shineColor: Color(0xfffff200),
                        opacity: 1,
                        angle: -0.9,
                        topLeft: false,
                        child: Image.asset(Assets.mya.jackpot.grand.path),
                        // child: Image.asset(Assets.mya.superwin.supers.path),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 136.h + t1 * 10.h,
                child: Container(
                  width: 320.h * t2,
                  height: 70.h * t2,
                  child: Center(
                    child: FittedBox(
                      child: ShiningEffect(
                        shineColor: Color(0xfffff200),
                        opacity: 1,
                        duration: Duration(milliseconds: 2000),
                        angle: -0.7,
                        topLeft: false,
                        child: Image.asset(Assets.mya.jackpot.grandJ.path),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


}


