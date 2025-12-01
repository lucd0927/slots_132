import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
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
import 'package:slots_132/ss_common/diallll/btn_beisu.dart';
import 'package:slots_132/ss_common/diallll/overlay_common_get.dart';
import 'package:slots_132/ss_common/sssssp/spine_boxgift.dart';
import 'package:slots_132/ss_common/sssssp/spine_sdlr_slots.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/center_view.dart';
import 'package:url_launcher/url_launcher.dart';

class OverlayBoxgift {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return BoxgiftWidget(
          onBtn: (double money) async {
            close();
            int time = HomeBoxTimeState().shengyuTime();
            bool showTime = MainController.to.showBoxTime.value;
            ssLogggg("=_onBoxGift==time:$time showTime:$showTime");
            if(time >0 ){
              return;
            }
            double tmpMmm = Random().nextDouble() * 50 + 25;
            List<String> types = [
              "10spin",
              "15spin",
              "20spin",
              "100xp",
              "150xp",
              "200xp",
              "1phoneSpice",
            ];

            int a = Random().nextInt(types.length);
            // a = 5;
            String tmpType = types[a];
            int exp = 0;
            int phoneSpice = 0;
            if (tmpType.contains("spin")) {
              List data = [10, 15, 20];
              int free = data[Random().nextInt(data.length)];
              OverlayCommonGet().show(
                money: tmpMmm,
                freespins: free,
                onClose: () async {
                  await Future.delayed(Duration(milliseconds: 300));
                  MainController.to.curShowFreeSpin.value = true;
                  MainController.to.curFreeSpinCount.value = free;
                  SSEventReporttttt.free_spin_add_chance();
                  MainController.to.onFreeSpin();
                },
              );

              return;
            } else if (tmpType.contains("xp")) {
              List data = [100, 150, 200];
              exp = data[Random().nextInt(data.length)];
            } else if (tmpType.contains("phoneSpice")) {
              phoneSpice = 1;
            }

            OverlayCommonGet().show(
              money: tmpMmm,
              exp: exp,
              phoneSpice: phoneSpice,
              onClose: () {},
            );
          },
          money: 1,
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

class BoxgiftWidget extends StatefulWidget {
  const BoxgiftWidget({super.key, required this.onBtn, required this.money});

  final double money;
  final ValueChanged<double> onBtn;

  @override
  State<BoxgiftWidget> createState() => _BoxgiftWidgetState();
}

class _BoxgiftWidgetState extends State<BoxgiftWidget> {
  bool positive = bgMusic.hasOn;
  bool positive2 = btnAudio.hasOn;
  var green = Color(0xFF45CC0D);

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  bool showSecondPage = false;
  bool showSecondPageOpenGift = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SSEventReporttttt.elve_page();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });
      int time = HomeBoxTimeState().shengyuTime();
      bool showTime = MainController.to.showBoxTime.value;
      ssLogggg("=_onBoxGift==time:$time showTime:$showTime");
      if(time >0 ){
        return;
      }
      Future.delayed(Duration(milliseconds: 5000), () {
        if (mounted) {
          setState(() {
            showSecondPage = true;
          });
          Future.delayed(Duration(milliseconds: 2500), () {
            if (mounted) {
              SSEventReporttttt.elve_page_open();
              setState(() {
                showSecondPageOpenGift = true;
              });

              Future.delayed(Duration(milliseconds: 500), () {
                onClose(20);
              });
            }
          });
        }
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
                children: [
                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Expanded(child: centerWidget())],
                    ),
                  ),

                  Positioned(
                    top: 50.h,
                    left: 20.w,
                    child: GestureDetector(
                      onTap: () {
                        onClose(1);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.img.btnBack.path,
                            width: 42.w,
                            height: 27.w,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 8.w),
                          SSTxtGraBorder(
                            text: "The Elves Are at Work!",
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            strokeColor: Color(0xff30120A),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  centerWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,

      // color: Colors.white,

      // child: AnimatedBuilder(animation: animation, builder: builder),
      child: showSecondPage ? secondPage() : firstPage(),
      // child: AnimatedCrossFade(
      //   firstChild: firstPage(),
      //   secondChild: secondPage(),
      //   crossFadeState: showSecondPage
      //       ? CrossFadeState.showSecond
      //       : CrossFadeState.showFirst,
      //   secondCurve: Curves.linear,
      //   duration: Duration(milliseconds: 5000),
      // ),
    );
  }

  firstPage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SSTxtGraBorder(
              text: "Your next gift from the workshop is being prepared.",
              strokeWidth: 1.w,
              strokeColor: Color(0xff30120A),
              fontSize: 20.sp,
              height: 1.3,
              fontColor: Color(0xffEAFF00),
              fontFamily: FontFamily.fraunces,
            ),
          ),
          SizedBox(height: 30.h),
          Center(
            child: Container(
              width: ScreenUtil().screenWidth,
              height: 400.h,
              // color: Colors.teal,
              child: const SSSpineBoxgift(),
            ),
          ),
          SizedBox(height: 30.h),
          Container(
            width: 281.h,
            height: 30.h,
            child: Stack(
              children: [
                Image.asset(
                  Assets.img.phoneCardBottomBg.path,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SSTxtGraBorder(
                        text: "Ready in: ",
                        strokeWidth: 1.w,
                        strokeColor: Color(0xff30120A),
                        fontSize: 20.sp,
                        fontColor: Color(0xffEAFF00),
                        fontFamily: FontFamily.fraunces,
                      ),
                      HomeBoxTime(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  secondPage() {
    return Center(child: secondPage1());
  }

  secondPage1() {
    return Container(
      width: 324.w,
      height: 370.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            Assets.img.boxGiftBg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          if (showSecondPageOpenGift)
            Positioned(
              top: 20.h,

              child: SSRotateWidget(
                child: Image.asset(
                  Assets.img.phoneCardXuanguang.path,
                  width: 324.w,
                  height: 370.h,
                ),
              ),
            ),

          Column(
            children: [
              SizedBox(height: 100.h),
              SSTxtGraBorder(
                text: "Your Elf Gift Has Arrived!",
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                strokeColor: Color(0xff30120A),
              ),
              SizedBox(height: 20.h),
              Image.asset(
                showSecondPageOpenGift
                    ? Assets.img.boxGiftBox2.path
                    : Assets.img.boxGiftBox1.path,
                width: 164.w,
                height: 146.h,
              ),
              SizedBox(height: 20.h),
              SSTxtGraBorder(
                text: "Open Your Gift!",
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                strokeColor: Color(0xff30120A),
              ),
            ],
          ),

          if (showSecondPageOpenGift) closeWidget(),
        ],
      ),
    );
  }

  secondPage2() {
    return Container(
      width: 324.w,
      height: 370.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            Assets.img.boxGiftBg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              SizedBox(height: 100.h),
              SSTxtGraBorder(
                text: "Your Elf Gift Has Arrived!",
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                strokeColor: Color(0xff30120A),
              ),
              SizedBox(height: 20.h),
              Image.asset(
                Assets.img.boxGiftBox2.path,
                width: 164.w,
                height: 146.h,
              ),
              SizedBox(height: 20.h),
              SSTxtGraBorder(
                text: "Open Your Gift!",
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                strokeColor: Color(0xff30120A),
              ),
            ],
          ),

          closeWidget(),
        ],
      ),
    );
  }

  closeWidget() {
    return Positioned(
      top: 30.h,
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

  onClose(double money) async {
    ssLogggg("====== close money:$money");
    setState(() {
      showAnimated = false;
      startScale = 1.0;
    });
    HomeBoxTimeState().resetTime();
    // await Future.delayed(animD);
    widget.onBtn(money);
  }
}
