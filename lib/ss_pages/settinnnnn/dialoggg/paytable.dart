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

class OverlayPaytable {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show({required double money}) {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return PaytableWidget(
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

class PaytableWidget extends StatefulWidget {
  const PaytableWidget({super.key, required this.onBtn, required this.money});

  final double money;
  final ValueChanged<double> onBtn;

  @override
  State<PaytableWidget> createState() => _PaytableWidgetState();
}

class _PaytableWidgetState extends State<PaytableWidget> {
  bool positive = bgMusic.hasOn;
  bool positive2 = btnJackpot.hasOn;
  var green = Color(0xFF45CC0D);

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;
  late PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: curIndex);
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
                  Container(
                    width: 367.w,
                    height: 445.w,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          Assets.img.highlights.path,
                          width: 367.w,
                          height: 445.w,
                          fit: BoxFit.fill,
                        ),

                        Positioned(
                          left: 0,
                          right: 0,
                          top: 80.w,
                          bottom: 0,
                          child: Center(
                            child: Stack(
                              children: [
                                PageView(
                                  controller: controller,
                                  physics: NeverScrollableScrollPhysics(),
                                  onPageChanged: (index) {
                                    print("当前是第 $index 页");
                                  },
                                  children: [page1(), page2(), page3()],
                                ),

                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 40.h,
                                  child: Center(
                                    child: Container(
                                      width: 100.w,
                                      height: 20.h,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          indicate(0),
                                          indicate(1),
                                          indicate(2),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          left: 0.w,
                          top: 60.w,
                          bottom: 0,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  curIndex = curIndex - 1;
                                  if (curIndex <= 0) {
                                    curIndex = 0;
                                  }
                                  onNext();
                                });
                              },
                              child: Image.asset(
                                Assets.img.highlightsLeft.path,
                                width: 40.w,
                                height: 40.w,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          right: 0,
                          top: 60.w,
                          bottom: 0,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  curIndex = curIndex + 1;
                                  if (curIndex >= 2) {
                                    curIndex = 2;
                                  }
                                  onNext();
                                });
                              },
                              child: Image.asset(
                                Assets.img.highlightsRight.path,
                                width: 40.w,
                                height: 40.w,
                              ),
                            ),
                          ),
                        ),

                        closeWidget(),
                      ],
                    ),
                  ),

                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  indicate(int index) {
    bool hasSelect = index == curIndex;
    return Container(
      width: 14.h,
      height: 14.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.h),
        border: Border.all(color: Color(0xffD93E3E), width: 1.w),
        color: hasSelect ? Color(0xffFFF93F) : Color(0xff3F1A1A),
      ),
    );
  }

  closeWidget() {
    return Positioned(
      top: 58.h,
      right: 0.w,
      child: GestureDetector(
        onTap: () {
          onClose(1);
        },
        child: Image.asset(
          Assets.img.closePopup2.path,
          width: 40.h,
          height: 40.h,
          // fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget page1() {
    return Center(
      child: Container(
        width: 282.w,
        height: 226.w,
        color: Colors.teal.withValues(alpha: 0.0),
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                Assets.img.highlightsCard1.path,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget page2() {
    return Center(
      child: Container(
        width: 282.w,
        height: 226.w,
        child: Row(
          children: [
            Image.asset(
              Assets.img.highlightsCard22.path,
              width: 92.w,
              height: 188.w,
            ),
            Image.asset(
              Assets.img.highlightsCard2.path,
              width: 190.w,
              height: 102.w,
            ),
          ],
        ),
      ),
    );
  }

  Widget page3() {
    return Center(
      child: Container(
        width: 282.w,
        height: 226.w,
        child: Stack(
          children: [
            Image.asset(
              Assets.img.highlightsCard3.path,
              width: double.infinity,
              height: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  int curIndex = 0;

  onNext() {
    controller.animateToPage(
      curIndex,
      duration: Duration(microseconds: 200),
      curve: Curves.linear,
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

  void onclickClaim() {
    onClose(1);
  }
}
