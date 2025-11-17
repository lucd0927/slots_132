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
import 'package:slots_132/ss_common/diallll/btn_beisu.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class OverlayWow {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show({required double money}) {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return WowWidget(
          onBtn: (double money) {
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

class WowWidget extends StatefulWidget {
  const WowWidget({super.key, required this.onBtn, required this.money});

  final double money;
  final ValueChanged<double> onBtn;

  @override
  State<WowWidget> createState() => _WowWidgetState();
}

class _WowWidgetState extends State<WowWidget> {
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
                  Image.asset(
                    Assets.img.popupTxtWow.path,
                    width: 199.h,
                    height: 137.h,
                  ),
                  Container(
                    // width: 375.h,
                    // height: 375.h,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Image.asset(
                        //   Assets.img.xuanguang2.path,
                        //   width: double.infinity,
                        //   height: double.infinity,
                        // ),
                        Positioned(
                          left: -80.w,
                          right: -80.w,
                          top: -90.h,

                          child: Center(
                            child: Container(
                              width: 375.h,
                              height: 375.h,
                              child: SSRotateWidget(
                                child: Image.asset(
                                  Assets.img.xuanguang2.path,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: SSAScale(
                            child: Image.asset(
                              Assets.img.moneyPopup.path,
                              width: 199.h,
                              height: 137.h,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: -20.h,
                          child: Container(
                            width: double.infinity,
                            height: 60.h,
                            child: Stack(
                              children: [
                                // Center(
                                //   child: Image.asset(
                                //     Assets.img.popupMoneybgSuper.path,
                                //     width: 350.w,
                                //     height: double.infinity,
                                //   ),
                                // ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 4.h,
                                  bottom: 0,
                                  child: Center(
                                    child: SSTxtGraBorder(
                                      text:
                                      "${SSCountry.curGuojiaFuhao()}${widget.money}",
                                      fontSize: 42.sp,
                                      fontFamily: FontFamily.alkatra,
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
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.h),
                  BtnBeisuWidget(
                    onBtn: (v) {
                      ssLogggg("=====beisu:$v");
                      double money = widget.money * v;
                      onClose(money);
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

  onClose(double money) async {
    ssLogggg("====== close money:$money");
    setState(() {
      showAnimated = false;
      startScale = 1.0;
    });
    // await Future.delayed(animD);
    widget.onBtn(money);
  }
}
