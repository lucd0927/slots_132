import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_ad/adsid.dart';
import 'package:slots_132/jc_ad/common_ads.dart';
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
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class OverlayFreeSpins {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show({required double count, required ValueChanged onClose}) {
    // if (_isShowing) return;
    btnFreespinPre.play();
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return FreeSpinsWidget(
          onBtn: (double value) async{
            close();

            onClose(null);

          },
          money: count,
          onBtn2: (double value)async {
            close();
            // MainController.to.curFreeSpinCount.value = value.toInt();
            onClose(null);
          },
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

class FreeSpinsWidget extends StatefulWidget {
  const FreeSpinsWidget({
    super.key,
    required this.onBtn,
    required this.money,
    required this.onBtn2,
  });

  final double money;
  final ValueChanged<double> onBtn;
  final ValueChanged<double> onBtn2;

  @override
  State<FreeSpinsWidget> createState() => _FreeSpinsWidgetState();
}

class _FreeSpinsWidgetState extends State<FreeSpinsWidget> {
  bool positive = bgMusic.hasOn;
  bool positive2 = btnJackpot.hasOn;
  var green = Color(0xFF45CC0D);

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  int get baseCount => widget.money~/1;
  static int addSpinCount = 4;

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
                    width: 375.w,
                    height: 493.w + 14.w,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          Assets.img.freeSpins.path,
                          width: 375.w,
                          height: 493.w,
                          fit: BoxFit.fill,
                        ),

                        Column(
                          children: [
                            SizedBox(height: 250.w),
                            SSTxtGraBorder(
                              text: "YOU WON",
                              fontSize: 24.sp,
                              strokeColor: Color(0xffEE101E),
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(height: 4.w),
                            Container(
                              width: 120.w,
                              height: 120.w,
                              // color: Colors.teal,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    left: -80.w,
                                    right: -80.w,
                                    top: -50.w,

                                    child: Center(
                                      child: Container(
                                        width: 230.w,
                                        height: 230.w,
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
                                  Center(
                                    child: Container(
                                      width: 95.w,
                                      height: 95.w,
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            Assets.img.freeSpinesCount.path,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                          Center(
                                            child: SSTxtGraBorder(
                                              text: "$baseCount",
                                              fontSize: 48.sp,
                                              strokeColor: Color(0xffEE101E),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4.w),
                            SSTxtGraBorder(
                              text: "FREE SPINS!",
                              fontSize: 24.sp,
                              strokeColor: Color(0xffEE101E),
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),

                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0.h,
                          child: Center(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SSTxtBorder(
                                              text: "Free +$addSpinCount",
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: onBnt2,
                    child: SSTxtBorder(
                      text: "START",
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      fontFamily: FontFamily.alkatra,
                      fontColor: Color(0xffCCCCCC),
                    ),
                  ),
                  SizedBox(height: 150.h),
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
    // setState(() {
    //   showAnimated = false;
    //   startScale = 1.0;
    // });
    // await Future.delayed(animD);
  }
  bool canClick = true;
  void onBnt2() async{
    if(canClick){
      canClick = false;
      await SSCommonAds().showInterstitialAd(adPosId: SSAdsPosId.eyomt_freespin_int);
      MainController.to.curFreeSpinCount.value = baseCount;
      onClose(1);
      widget.onBtn2(baseCount * 1.0);
    }

  }

  void onclickClaim() async{
    if(canClick){
      canClick = false;
      int aC = baseCount + addSpinCount;
      bool resut = await SSCommonAds().showRewardAd(adPosId: SSAdsPosId.eyomt_freespin_rv);
      if(!resut){
        aC = baseCount;
      }
      MainController.to.curFreeSpinCount.value = aC;
      SSEventReporttttt.free_spin_add_chance();
      onClose(1);
      widget.onBtn(aC * 1.0);
    }

  }
}
