import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/audio.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_scale.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/ss_rotate.dart';
import 'package:slots_132/jc_gj/jc_widget/toggle_switch.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class OverlaySuperwin {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show({required double money}) {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return SuperwinWidget(
          onClose: () {
            close();
          },
          money: money,
        );
      },
    );
    Overlay.of(Get.context!).insert(_overlay!);
    _isShowing = true;
  }

  void close() {
    _isShowing = false;
    _overlay?.remove();
    _overlay = null;
  }
}

class SuperwinWidget extends StatefulWidget {
  const SuperwinWidget({super.key, required this.onClose, required this.money});

  final double money;
  final VoidCallback onClose;

  @override
  State<SuperwinWidget> createState() => _SuperwinWidgetState();
}

class _SuperwinWidgetState extends State<SuperwinWidget> {
  bool positive = bgMusic.hasOn;
  bool positive2 = btnAudio.hasOn;
  var green = Color(0xFF45CC0D);

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AnimatedContainer(
        duration: animD,
        color: Colors.black.withValues(alpha: showAnimated ? 0.7 : 0),
        child: Center(
          child: AnimatedScale(
            duration: animD,
            scale: showAnimated ? 1.0 : startScale,
            child: Container(
              width: double.infinity,
              height: double.infinity,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: -80.w,
                        right: -80.w,
                        top: -90.h,

                        child: Center(
                          child: Container(
                            width: 380.h,
                            height: 380.h,
                            child: SSRotateWidget(
                              child: Image.asset(
                                Assets.img.phoneCardXuanguang.path,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SSAScale(
                        child: Image.asset(
                          Assets.img.popupTxtSuperwin.path,
                          width: 251.h,
                          height: 171.h,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.h,
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            Assets.img.popupMoneybg.path,
                            width: 350.w,
                            height: double.infinity,
                          ),
                        ),
                        Center(
                          child: SSAniiiiCount(
                            fractionDigits: 2,
                            duration: Duration(milliseconds: 600),
                            value: showAnimated ? widget.money : 0,
                            textStyle: TextStyle(
                              fontSize: 20.sp,
                              height: 1,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff6AFF00),
                            ),
                            prefix: SSCountry.curGuojiaFuhao(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  BtnBeisuWidget(
                    onBtn: (v) {
                      ssLogggg("=====beisu:$v");
                      onClose();
                    },
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onClose() async {
    ssLogggg("======Setting close");
    setState(() {
      showAnimated = false;
      startScale = 1.0;
    });
    // await Future.delayed(animD);
    widget.onClose();
  }
}

class BtnBeisuWidget extends StatefulWidget {
  const BtnBeisuWidget({super.key, required this.onBtn});

  final ValueChanged<double> onBtn;

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
    return Container(
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
                            text: "Collect",
                            fontSize: 24.sp,
                            fontFamily: FontFamily.alkatra,
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
