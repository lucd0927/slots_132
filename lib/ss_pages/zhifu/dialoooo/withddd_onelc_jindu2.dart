import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_common/routes.dart';
import 'package:slots_132/ss_pages/maiiiiii/main.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_jindu2.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class OverlayOneLastCheckJindu2 {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    _overlay = null;
    SSEventReporttttt.partner_pop();
    _overlay = OverlayEntry(
      builder: (context) {
        return OneLastCheckJindu2Widget(
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

class OneLastCheckJindu2Widget extends StatefulWidget {
  const OneLastCheckJindu2Widget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<OneLastCheckJindu2Widget> createState() =>
      _OneLastCheckJindu2WidgetState();
}

class _OneLastCheckJindu2WidgetState extends State<OneLastCheckJindu2Widget> {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 250);
  Duration animD2 = Duration(milliseconds: 1500);
  bool showJindu2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
        });
      }
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
            scale: showAnimated ? 1.0 : 0.8,
            // offset: showAnimated ? Offset.zero : Offset(0, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 324.w,
                  height: !SSCountry.hasUSA()?520.h:470.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 1.0),
                    borderRadius: BorderRadius.circular(24.h),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 0.h),

                      Image.asset(
                        Assets.img.txOnelastJindubank.path,
                        width: 194.w,
                        height: 194.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.h,
                          horizontal: 12.w,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffE7E7E7),
                          borderRadius: BorderRadius.circular(50.w),
                          border: Border.all(
                            color: Color(0xffDCDCDC),
                            width: 1.w,
                          ),
                        ),
                        child: Text(
                          "one_last_jindu2_1".tr,
                          style: TextStyle(
                            color: Color(0xff818181),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text.rich(
                          TextSpan(
                            text: "${"one_last_jindu2_2".tr} ",
                            children: [
                              TextSpan(
                                text: " ${"one_last_jindu2_3".tr} ",
                                style: TextStyle(color: Color(0xffFF8C00)),
                              ),
                              TextSpan(
                                text: "one_last_jindu2_4".tr,
                                style: TextStyle(color: Color(0xff242731)),
                              ),
                            ],
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24.sp,
                            height: 1,
                            color: Color(0xff2E313A),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 8.h),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text.rich(
                          TextSpan(
                            text:
                                "one_last_jindu2_5".tr,
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: Color(0xff6D6D6D),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(height: 30.h),

                      GestureDetector(
                        onTap: () {
                          onClose();
                          SSEventReporttttt.partner_yes();
                          Get.toNamed(SSRouttttt.withdddCompletePaytaber);
                        },
                        child: Container(
                          width: 230.h,
                          height: 42.h,
                          decoration: BoxDecoration(
                            // color: Color(0xff164CFF),
                            color: Color(0xff31C520),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              "one_last_jindu2_6".tr,
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: GestureDetector(
                          onTap: onClose,
                          child: Column(
                            children: [
                              Text(
                                "one_last_jindu2_7".tr,
                                style: TextStyle(
                                  color: Color(0xff7A7A7A),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w800,
                                  decoration: TextDecoration.underline,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                GestureDetector(
                    onTap: onClose,
                    child: Image.asset(Assets.img.closePopup.path,width: 30.h,height: 30.h,))
              ],
            ),
          ),
        ),
      ),
    );
  }

  onClose() async {
    ssLogggg("======Setting close");
    widget.onClose();
  }
}
