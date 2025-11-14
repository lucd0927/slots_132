import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/audio.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/toggle_switch.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class OverlayActivateMyStatus {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return ActivateMyStatusWidget(
          onClose: () {
            close();
            WithdddController.to.onClickVipGetChange();
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

class ActivateMyStatusWidget extends StatefulWidget {
  const ActivateMyStatusWidget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<ActivateMyStatusWidget> createState() => _ActivateMyStatusWidgetState();
}

class _ActivateMyStatusWidgetState extends State<ActivateMyStatusWidget> {
  bool positive = bgMusic.hasOn;
  bool positive2 = btnAudio.hasOn;
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
          child: AnimatedSlide(
            duration: animD,
            offset: showAnimated ? Offset.zero : Offset(0, 1),
            child: Container(
              width: double.infinity,
              height: 373.h,
              color: Colors.blueAccent.withValues(alpha: 0.0),
              child: Stack(
                children: [
                  Positioned(
                    left: 20.w,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: Center(
                      child: Container(
                        color: Colors.teal.withValues(alpha: 0.2),
                        child: Image.asset(
                          Assets.img.txActivateBg.path,
                          width: 310.h,
                          height: 373.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 60.h),
                        Row(
                          children: [
                            SizedBox(width: 60.w),
                            Text(
                              "Activate my status",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: Color(0xff222317),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(width: 60.w),
                            Text(
                              "${SSCountry.curGuojiaFuhao()}1000",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 32.sp,
                                color: Color(0xff222317),
                                height: 1,
                              ),
                            ),
                            Text(
                              "  USD",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: Color(0xff222317),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Image.asset(
                          Assets.img.txActivateMoney.path,
                          width: 162.h,
                          height: 94.h,
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "Level ${MainController.to.level()}/${MainController.maxLevel}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24.sp,
                            color: Color(0xff222317),
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Daily ${MainController.to.minWithdddMoneyWithCountry}  Payout",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: Color(0xff3AAD47),
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        GestureDetector(
                          onTap: () {
                            onClose();
                          },
                          child: Container(
                            width: 230.h,
                            height: 42.h,
                            decoration: BoxDecoration(
                              color: Color(0xff31C520),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                " YES, I WANT MY DAILY \$1,000!",
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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

  onClose() async {
    ssLogggg("======Setting close");
    setState(() {
      showAnimated = false;
    });
    await Future.delayed(animD);
    widget.onClose();
  }
}
