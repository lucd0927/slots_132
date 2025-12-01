import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_ad/common_ads.dart';
import 'package:slots_132/jc_ad/gg_common_config.dart';
import 'package:slots_132/jc_gj/audio.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_scale.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/ss_rotate.dart';
import 'package:slots_132/jc_gj/jc_widget/toggle_switch.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_common/animated_win/animated_jackpot_mini.dart';
import 'package:slots_132/ss_common/diallll/btn_beisu.dart';
import 'package:slots_132/ss_common/sssssp/spine_jackpotGrand.dart';
import 'package:slots_132/ss_common/sssssp/spine_jackpotMini.dart';
import 'package:slots_132/ss_common/sssssp/spine_money.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class OverlayJackpotMini {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show({
    required EnumGetScene scene,
    required double money,
    required ValueChanged onBtn,
    required ValueChanged onBtn2,
  }) {
    // if (_isShowing) return;
    SSEventReporttttt.jackpot_pop(pop_type: "mini", pop_from: scene.name);
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return _JackpotWidgetMini(
          onBtn: (double money) {
            close();
            SSEventReporttttt.jackpot_pop_claim_all(pop_type: "mini", pop_from: scene.name);
            onBtn(money);
          },
          onBtn2: (double money) {
            close();
            SSEventReporttttt.jackpot_pop_claim_10(pop_type: "mini", pop_from: scene.name);
            onBtn2(money);
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

class _JackpotWidgetMini extends StatefulWidget {
  const _JackpotWidgetMini({
    super.key,
    required this.onBtn,
    required this.money,
    required this.onBtn2,
  });

  final double money;
  final ValueChanged<double> onBtn;
  final ValueChanged<double> onBtn2;

  @override
  State<_JackpotWidgetMini> createState() => _JackpotWidgetMiniState();
}

class _JackpotWidgetMiniState extends State<_JackpotWidgetMini> {
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

              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    top: -200.h,
                    left: 0.w,

                    child:Container(
                        width: ScreenUtil().screenWidth,
                        height: ScreenUtil().screenHeight,
                        child: SSSpineMoney()),
                  ),

                  Positioned(
                    left: 0,
                    right: 0,
                    top: -80.h,
                    child: Container(
                      width: ScreenUtil().screenWidth,
                      height: ScreenUtil().screenHeight,

                      child: Center(child: SSAnimatedJackpotMini()),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.h),
                      Container(
                        width: 350.h,
                        height: 240.h,
                        // // child: Stack(
                        // //   alignment: Alignment.topCenter,
                        // //   children: [
                        // //     Image.asset(
                        // //       Assets.img.popupJackpotBg.path,
                        // //       width: double.infinity,
                        // //       height: double.infinity,
                        // //       fit: BoxFit.fill,
                        // //     ),
                        // //     Column(
                        // //       mainAxisAlignment: MainAxisAlignment.center,
                        // //       children: [
                        // //         SSAScale(
                        // //           child: Image.asset(
                        // //             Assets.img.popupJackpotGrand.path,
                        // //             width: 267.h,
                        // //             height: 91.h,
                        // //           ),
                        // //         ),
                        // //         // SSAScale(
                        // //         //   child: Image.asset(
                        // //         //     Assets.img.popupJackpotGrand.path,
                        // //         //     width: 267.h,
                        // //         //     height: 91.h,
                        // //         //   ),
                        // //         // ),
                        // //         // SSAScale(
                        // //         //   child: Image.asset(
                        // //         //     Assets.img.popupJackpot1.path,
                        // //         //     width: 334.h,
                        // //         //     height: 174.h,
                        // //         //   ),
                        // //         // ),
                        // //       ],
                        // //     ),
                        // //   ],
                        // // ),
                        // child: SSSpineJackpotGrand(),
                      ),
                      Container(
                        width: double.infinity,
                        height: 60.h,
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                Assets.img.popupMoneybgSuper.path,
                                width: 350.w,
                                height: double.infinity,
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 4.h,
                              bottom: 0,
                              child: Center(
                                child: SSTxtGraBorder(
                                  text:
                                  "${SSCountry.curGuojiaFuhao()}${widget.money.toStringAsFixed(2)}",
                                  fontSize: 42.sp,
                                  fontFamily: FontFamily.ghostKidAOEPro,
                                  height: 1,
                                  fontWeight: FontWeight.w700,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff0FFF63),
                                      Color(0xffA4F00D),
                                      Color(0xffD0FF00),
                                      Color(0xff00FF1E),
                                      // Color(0xff0FFF63),
                                    ],
                                    end: Alignment.bottomCenter,
                                    begin: Alignment.topCenter,
                                  ),
                                  strokeColor: Color(0xff0C402B),
                                  strokeWidth: 3.w,
                                  // fontColor: Color(0xff6AFF00),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),
                      btn(),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onClose(double money) async {
    ssLogggg("====== close money:$money");
    setState(() {
      showAnimated = false;
      startScale = 1.0;
    });
    // await Future.delayed(animD);
  }

  btn() {
    return Column(
      children: [
        GestureDetector(
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
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: obBtn2,
          child: SSTxtBorder(
            text: "Claim 10%",
            fontSize: 16.sp,
            fontFamily: FontFamily.alkatra,
            fontWeight: FontWeight.w700,
            foreground: Color(0xff1C5700),
          ),
        ),
      ],
    );
  }

  void onBtn() {
    double money = widget.money * 1;
    onClose(money);
    widget.onBtn(money);
  }

  void obBtn2() {
    double money = widget.money * 0.1;
    onClose(money);
    widget.onBtn2(money);
  }
}
