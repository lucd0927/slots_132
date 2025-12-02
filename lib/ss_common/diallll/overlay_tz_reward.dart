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

class OverlayTzReward {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show({required double money, required ValueChanged onClose}) {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return TzRewardWidget(
          onBtn: (double money) {
            close();
            onClose(null);
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

class TzRewardWidget extends StatefulWidget {
  const TzRewardWidget({super.key, required this.onBtn, required this.money});

  final double money;

  final ValueChanged<double> onBtn;

  @override
  State<TzRewardWidget> createState() => _TzRewardWidgetState();
}

class _TzRewardWidgetState extends State<TzRewardWidget> {
  bool positive = bgMusic.hasOn;
  bool positive2 = btnAudio.hasOn;
  var green = Color(0xFF45CC0D);

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  int baseCount = 5;
  int addSpinCount = 4;

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
                  Container(
                    width: 350.w,
                    height: 558.w,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          Assets.img.tongzRewardBg.path,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),

                        Column(
                          children: [
                            SizedBox(height: 160.w),
                            SSTxtBorder(
                              text: "Push reward Claimed",
                              fontSize: 24.sp,
                              fontColor: Color(0xffFFFF29),
                              fontFamily: FontFamily.sansitaOne,
                              foreground: Color(0xffDB1717),
                            ),
                            SizedBox(height: 4.w),
                            Container(
                              width: 254.w,
                              height: 160.w,
                              // color: Colors.teal,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    left: -80.w,
                                    right: -80.w,
                                    top: -80.h,
                                    bottom: -80.h,
                                    child: SSRotateWidget(
                                      child: Image.asset(
                                        Assets.img.phoneCardXuanguang.path,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left:0,
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Center(
                                      child: Image.asset(
                                        Assets.img.moneyGift.path,
                                        width: 95.w*1.5,
                                        height: 65.w*1.5,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 18.w,
                                    child: Center(
                                      child: SSTxtGraBorder(
                                        text:
                                            "${SSCountry.curGuojiaFuhao()}${widget.money.toStringAsFixed(2)}",
                                        fontSize: 24.sp,
                                        fontFamily: FontFamily.ghostKidAOEPro,
                                        strokeColor: Color(0xff0C402B),
                                        fontWeight: FontWeight.w700,
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xff0FFF63),
                                            Color(0xffA4F00D),
                                            Color(0xffD0FF00),
                                            Color(0xff00FF1E),
                                          ],
                                          end: Alignment.bottomCenter,
                                          begin: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],

                              ),
                            ),
                            txtDesWidget(),
                            SizedBox(height: 10.w),
                            btnWidget(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  txtDesWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        "✓   Trusted by 1M+ Users",
        style: TextStyle(
          fontSize: 14.sp,
          color: Color(0xffFFC8C8),
        ),
      ),
      Text(
        "✓   100% Secure Transfer",
        style: TextStyle(
          fontSize: 14.sp,
          color: Color(0xffFFC8C8),
        ),
      ),
      Text(
        "✓   Instant Payment",
        style: TextStyle(
          fontSize: 14.sp,
          color: Color(0xffFFC8C8),
        ),
      ),
      Text(
        "✓   Direct to Your Account",
        style: TextStyle(
          fontSize: 14.sp,
          color: Color(0xffFFC8C8),
        ),
      ),
    ],);
  }

  btnWidget() {
    return Column(
      children: [
        Center(
          child: GestureDetector(
            onTap: onclickClaim,
            child: Container(
              width: 175.h,
              height: 58.h,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    Assets.img.btnFreeSpins.path,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 14.h,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SSTxtBorder(
                            text: "Claim",
                            fontWeight: FontWeight.w700,
                            fontSize: 24.sp,
                            fontFamily: FontFamily.alkatra,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    right: 0,
                    top: -10.h,
                    child: Image.asset(
                      Assets.img.video.path,
                      width: 28.w,
                      height: 28.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 4.w),

        GestureDetector(
          onTap: () {
            MainController.to.curFreeSpinCount.value = baseCount;
            onClose(1);
          },
          child: SSTxtBorder(
            text: "Claim  10%",
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            fontFamily: FontFamily.alkatra,
            fontColor: Color(0xffCCCCCC),
          ),
        ),
      ],
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
    MainController.to.curFreeSpinCount.value = baseCount + addSpinCount;
    onClose(1);
  }
}
