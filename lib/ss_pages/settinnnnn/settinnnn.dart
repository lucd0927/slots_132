import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/audio.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/toggle_switch.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_common/routes.dart';
import 'package:slots_132/ss_common/webviewchangeios.dart';
import 'package:slots_132/ss_pages/settinnnnn/dialoggg/paytable.dart';
import 'package:url_launcher/url_launcher.dart';

class OverlaySettinnn {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return SettingWidget(
          onClose: () {
            close();
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

class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  bool positive = bgMusic.hasOn;
  bool positive2 = btnJackpot.hasOn;
  var green = Color(0xFF45CC0D);

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);

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
            // offset: showAnimated ? Offset.zero : Offset(0, 1),
            scale: showAnimated ? 1.0 : 0.8,
            child: Container(
              width: 323.w,
              height: 370.h,
              color: Colors.blueAccent.withValues(alpha: 0.0),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      Assets.img.settiBg.path,
                      width: 303.w,
                      height: 346.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned.fill(
                    child: Column(
                      children: [
                        SizedBox(height: 40.h),
                        SSTxtGraBorder(
                          text: "Settings",
                          fontSize: 32.sp,
                          strokeColor: Color(0xffF83A00),
                        ),
                        SizedBox(height: 20.h),
                        _audddWidget(),
                        SizedBox(height: 20.h),
                        _btnWidgetItem(
                          txt: "PAYTABLE",
                          onTap: () {
                            onClose();
                            SSEventReporttttt.setting_page_paytable();
                            OverlayPaytable().show(money: 1);
                          },
                        ),
                        SizedBox(height: 10.h),
                        _btnWidgetItem(
                          txt: "Privacy Policy",
                          onTap: () {
                            Uri uri = Uri.parse(
                              "https://clausslotswealth.com/privacy.html",
                            );
                            SSEventReporttttt.setting_page_privacy();
                            _laUuuu(uri);
                          },
                        ),
                        SizedBox(height: 10.h),
                        if (SSABChange.isPackageB())
                          GestureDetector(
                            onTap: () {
                              // _launEeeee();
                              onClose();
                              SSEventReporttttt.setting_page_contact_us();
                              Get.toNamed(SSRouttttt.aichat);
                            },
                            child: Text(
                              "contact us",
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: onClose,
                      child: Image.asset(
                        Assets.img.closePopup2.path,
                        width: 40.h,
                        height: 40.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  if (SSABChange.isPackageB())
                    Positioned(
                      bottom: 40.h,
                      left: 70.w,
                      child: GestureDetector(
                        onTap: () {
                          onClose();

                          if (Platform.isIOS) {
                            WebviewChannelIos().alsdjklsfShowWvvvv();
                            return;
                          }

                          Get.toNamed(SSRouttttt.wayeeee);
                        },
                        child: Image.asset(
                          Assets.img.h5.path,
                          width: 36.h,
                          height: 43.h,
                          fit: BoxFit.fill,
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

  _btnWidgetItem({required String txt, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 184.w,
        height: 45.h,
        color: Colors.transparent,
        child: Stack(
          children: [
            Image.asset(
              Assets.img.btnSetting.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned.fill(
              bottom: 4.h,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.blueAccent.withValues(alpha: 0.0),
                child: Center(
                  child: SSTxtBorder(
                    text: txt,
                    fontSize: 16.sp,
                    fontColor: Color(0xffffffff),
                    foreground: Color(0xff0A6004),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _audddWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _audioWidgetItem(
          img: Assets.img.settiAudio.path,
          txt: "Sound",
          onChange: _onBgMusic,
          positive: positive2,
        ),
        SizedBox(width: 20.w),
        _audioWidgetItem(
          img: Assets.img.settiMusic.path,
          txt: "Music",
          onChange: _onBtnMusic,
          positive: positive,
        ),
      ],
    );
  }

  _onBtnMusic(bool toggle) {
    setState(() {
      positive = toggle;
      ssLogggg("== sound=toggle:$toggle==");
      bgMusic.setSWHasOn(positive, showAudioPlayOrPause: true);
    });
  }

  _onBgMusic(bool toggle) {
    setState(() {
      positive2 = toggle;
      ssLogggg("== music=toggle:$toggle==");
      btnJackpot.setSWHasOn(positive2, showAudioPlayOrPause: false);
    });
  }

  _audioWidgetItem({
    required String img,
    required String txt,
    required ValueChanged<bool> onChange,
    required bool positive,
  }) {
    return Container(
      width: 117.w,
      height: 79.h,
      decoration: BoxDecoration(
        color: Color(0xff4C0600),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(img, width: 30.w, height: 35.h, fit: BoxFit.fill),
          SizedBox(width: 8.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                txt,
                style: TextStyle(
                  color: Color(0xffFFD940),
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 4.h),
              switchWidget(onChange, positive),
            ],
          ),
        ],
      ),
    );
  }

  onClose() async {
    ssLogggg("======Setting close");
    // setState(() {
    //   showAnimated = false;
    // });
    // await Future.delayed(animD);
    widget.onClose();
  }

  Widget switchWidget(ValueChanged<bool> onChange, bool positive) {
    return GGToggleSwitch(
      width: 40.w,
      height: 20.w,
      valueFontSize: 2.w,
      toggleSize: 20.w,
      value: positive,
      borderRadius: 20.w,
      // switchBorder: Border.all(color: Color(0xff2ABEFF), width: 0.w),
      activeSwitchBorder: Border.all(color: Color(0xff4C4C4C), width: 0.w),
      inactiveSwitchBorder: Border.all(color: Color(0xff4C4C4C), width: 0.w),
      activeText: "",
      inactiveText: "",
      activeColor: Color(0xff51AE00),
      activeTextColor: Color(0xff0D172B),
      inactiveColor: Color(0xff4C4C4C),
      inactiveTextColor: Colors.white,
      activeIcon: Container(
        width: 20.w,
        height: 20.w,
        decoration: BoxDecoration(
          color: Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(10.w),
        ),
      ),
      inactiveIcon: Container(
        width: 20.w,
        height: 20.w,
        decoration: BoxDecoration(
          color: Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(10.w),
        ),
      ),
      padding: 0.w,
      showOnOff: true,
      onToggle: onChange,
    );
  }
}

Future<void> _laUuuu(
  Uri uri, {
  LaunchMode mode = LaunchMode.platformDefault,
}) async {
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}

Future<void> _launEeeee() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'luckySlots@gmail.com',
    queryParameters: {'subject': '', 'body': ''},
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    throw 'Could not launch email app';
  }
}
