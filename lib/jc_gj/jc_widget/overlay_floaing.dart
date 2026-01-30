import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/country.dart';

import '../../gen/assets.gen.dart';

enum EnumLocation { top, center, center2, bottom }

class SlideAcrossOverlay {
  OverlayEntry? _entry;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  void show(BuildContext context) {
    final overlay = Overlay.of(context);
    final ticker = Navigator.of(context);

    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000), // 总时长：进入+停留+退出
      vsync: ticker,
    );

    // 动画轨迹：
    // 0% → 30%：右 → 中间（1s）
    // 30% → 70%：保持中间（3s）
    // 70% → 100%：中间 → 左（1s）
    _animation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(1.0, 0.0), // 屏幕右外
          end: Offset.zero, // 中间
        ).chain(CurveTween(curve: Curves.linear)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: ConstantTween<Offset>(Offset.zero), // 停留不动
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(-1.0, 0.0), // 屏幕左外
        ).chain(CurveTween(curve: Curves.linear)),
        weight: 20,
      ),
    ]).animate(_controller);

    EnumLocation location = EnumLocation.top;
    int random = Random().nextInt(4);
    if (random == 0) {
      location = EnumLocation.top;
    } else if (random == 1) {
      location = EnumLocation.center;
    } else if (random == 2) {
      location = EnumLocation.center2;
    } else if (random == 3) {
      location = EnumLocation.bottom;
    }
    location = EnumLocation.top;
    double top = 30;
    if (location == EnumLocation.top) {
      top = 88.h;
    } else if (location == EnumLocation.center) {
      top = 150.h;
    } else if (location == EnumLocation.center2) {
      top = 200.h;
    } else if (location == EnumLocation.bottom) {
      top = 250.h;
    }
    String icon = Random().nextInt(10) > 5
        ? Assets.img.popupPaypal.path
        : Assets.img.popupCashapp.path;

    String id = "ID${Random().nextInt(10)}***${Random().nextInt(10)} ${"Transfer Received".tr} ";
    _entry = OverlayEntry(
      builder: (context) => IgnorePointer(
        child: Stack(
          children: [
            Positioned(
              top: top,
              left: 0,
              right: 0,
              child: Center(
                child: SlideTransition(
                  position: _animation,
                  child: Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Container(
                        width: 345.h,
                        height: 70.h,

                        child: Stack(
                          children: [
                            Image.asset(
                              icon,
                              width: 345.h,
                              height: 70.h,
                              fit: BoxFit.fill,
                            ),

                            Positioned(
                              left: 74.w,
                              top: 28.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Payment Received".tr,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontFamily: FontFamily.fraunces,
                                      height: 1,
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  Text.rich(
                                    TextSpan(
                                      text: id,
                                      children: [
                                        TextSpan(
                                          text: " ${"rank_3".tr} ",
                                          style: TextStyle(
                                            color: Color(0xff48CE44),
                                            // height: 1
                                          ),
                                        ),
                                      ],
                                    ),
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff8F8F8F),
                                      // height: 1,
                                      fontFamily: FontFamily.fraunces,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    overlay.insert(_entry!);
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _remove();
      }
    });
  }

  void _remove() {
    _controller.dispose();
    _entry?.remove();
    _entry = null;
  }
}
