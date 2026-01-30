import 'dart:math' as math;

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
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

class OverlayTzNotify {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show({required ValueChanged onClose}) {
    // if (_isShowing) return;
    _overlay = null;
    SSEventReporttttt.push_reopen_pop();
    _overlay = OverlayEntry(
      builder: (context) {
        return TzNotifyWidget(
          onBtn: (double money) {
            close();
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

class TzNotifyWidget extends StatefulWidget {
  const TzNotifyWidget({super.key, required this.onBtn});

  final ValueChanged<double> onBtn;

  @override
  State<TzNotifyWidget> createState() => _TzNotifyWidgetState();
}

class _TzNotifyWidgetState extends State<TzNotifyWidget> {
  bool positive = bgMusic.hasOn;
  bool positive2 = btnJackpot.hasOn;
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
                    width: 366.w,
                    height: 459.w,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          SSABChange.isPackageB()
                              ? (SSCountry.hasUSA()
                                    ? Assets.img.tongzBg.path
                                    : SSCountry.hasBr()
                                    ? Assets.img.tongzBgBr.path
                                    : SSCountry.hasIn()
                                    ? Assets.img.tongzBgId.path
                                    : Assets.img.tongzBg.path)
                              : Assets.imga.tzBg.path,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 30.w,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                AppSettings.openAppSettings(
                                  type: AppSettingsType.notification,
                                );
                                SSEventReporttttt.push_repopen_pop_notify();
                                onClose(1);
                              },
                              child: Container(
                                width: 218.w,
                                height: 55.w,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      Assets.img.btnPopup2.path,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 10.h,
                                      top: 0,
                                      child: Center(
                                        child: SSTxtBorder(
                                          text: "YES,Notify Me!",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24.sp,
                                          fontFamily: FontFamily.interBold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        closeWidget(),
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

  closeWidget() {
    return Positioned(
      top: 58.h,
      right: 20.w,
      child: GestureDetector(
        onTap: () {
          SSEventReporttttt.push_reopen_pop_close();
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
    // await Future.delayed(animD);
    widget.onBtn(money);
  }
}
