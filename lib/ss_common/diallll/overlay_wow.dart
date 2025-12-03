import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_ad/adsid.dart';
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
import 'package:slots_132/ss_common/animated_win/animated_win_wow.dart';
import 'package:slots_132/ss_common/diallll/btn_beisu.dart';
import 'package:slots_132/ss_common/sssssp/spine_money.dart';
import 'package:slots_132/ss_common/sssssp/spine_tanc_xuanguang.dart';
import 'package:slots_132/ss_common/sssssp/spine_wow.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class OverlayWow {
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
    btnMoney.play();
    SSEventReporttttt.cash_pop(pop_type: "wow", pop_from: scene.name);
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return WowWidget(
          onBtn: (double money)async {
            close();
            SSEventReporttttt.cash_pop_collect(
              pop_type: "wow",
              pop_from: scene.name,
            );

            bool result = await SSCommonAds().showRewardAd(
              adPosId: SSAdsPosId.eyomt_wow_rv,
              ignored_hasDisplayAd: true,
            );
            if(!result){
              money = 0;
            }

            onBtn(money);
          },
          money: money,
          onBtn2: (double money)async {
            close();
            SSEventReporttttt.cash_pop_close(
              pop_type: "wow",
              pop_from: scene.name,
            );
            bool result = await SSCommonAds().showInterstitialAd(
              adPosId: SSAdsPosId.eyomt_wow_int,
              ignored_hasDisplayAd: true,
            );
            if(!result){
              money = 0;
            }
            onBtn2(money);
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

class WowWidget extends StatefulWidget {
  const WowWidget({
    super.key,
    required this.onBtn,
    required this.money,
    required this.onBtn2,
  });

  final double money;
  final ValueChanged<double> onBtn;
  final ValueChanged<double> onBtn2;

  @override
  State<WowWidget> createState() => _WowWidgetState();
}

class _WowWidgetState extends State<WowWidget> {
  bool positive = bgMusic.hasOn;
  bool positive2 = btnJackpot.hasOn;
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
                children: [

                  Positioned(
                    left: -0.w,
                    right: -0.w,
                    top: -60.h,

                    child: IgnorePointer(
                      child: Center(
                        child: Container(
                          width: ScreenUtil().screenWidth,
                          height: ScreenUtil().screenHeight,
                          // width: 375.w,
                          // height: 812.h,
                          color: Colors.yellow.withValues(alpha: 0.0),
                          child: SSSpineMoney(),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: -90.h,
                    child: Container(
                      width: 375.w,
                      height: 812.h,
                      child: SpineTancXuanguang(),
                    ),
                  ),

                  Positioned.fill(top: 255.h, child: SSAnimatedWinWow()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 410.h),

                      Container(
                        width: double.infinity,
                        height: 60.h,
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                Assets.img.popupMoneybgBig.path,
                                width: 350.w,
                                height: double.infinity,
                              ),
                            ),
                            Center(
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
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      BtnBeisuWidget(
                        onBtn: (v) {
                          ssLogggg("=====beisu:$v");
                          double money = widget.money * v;
                          widget.onBtn(money);
                        },
                        onBtn2: (double value) {
                          double money = widget.money * value;
                          widget.onBtn2(money);
                        },
                      ),
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

}
