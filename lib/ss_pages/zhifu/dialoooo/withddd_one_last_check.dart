import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_jindu2.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class OverlayOneLastCheck {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    SSEventReporttttt.verfication_pop();
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return OneLastCheckWidget(
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

class OneLastCheckWidget extends StatefulWidget {
  const OneLastCheckWidget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<OneLastCheckWidget> createState() => _OneLastCheckWidgetState();
}

class _OneLastCheckWidgetState extends State<OneLastCheckWidget> {
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
                  height: 486.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 1.0),
                    borderRadius: BorderRadius.circular(24.h),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 0.h),
                      Image.asset(
                        Assets.img.oneLastCheck.path,
                        width: 174.w,
                        height: 174.h,
                      ),
                      Text(
                        "one_last_1".tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: Color(0xff000000),
                        ),
                      ),

                      SizedBox(height: 4.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text.rich(
                          TextSpan(
                            text:
                                "one_last_2".tr,
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: Color(0xff2E313A),
                            fontFamily: FontFamily.interBold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text.rich(
                          TextSpan(
                            text:
                                "one_last_3".tr,
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: Color(0xff2E313A),
                            fontFamily: FontFamily.interBold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(height: 10.h),

                      Container(
                        width: 290.w,
                        height: 86.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFAF8FF),
                          borderRadius: BorderRadius.circular(16.w),
                          border: Border.all(
                            color: Color(0xffEFEAFD),
                            width: 1.w,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 8.h,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 34.w,
                              height: 34.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(34.w),
                                color: Color(0xffE1E8FD),
                              ),
                              child: Center(
                                child: Image.asset(
                                  Assets.img.onelastrefresh.path,
                                  width: 18.w,
                                  height: 18.w,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "one_last_4".tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                      color: Color(0xff7F99EF),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text.rich(
                                    TextSpan(
                                      text: "one_last_5".tr,
                                      children: [
                                        TextSpan(
                                          text:
                                              " ${WithdddController.to.spinWithLiuceng3()} ",
                                          style: TextStyle(
                                            color: Color(0xff164CFF),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "one_last_6".tr,
                                          style: TextStyle(
                                            color: Color(0xff242731),
                                          ),
                                        ),
                                      ],
                                    ),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: Color(0xff242731),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      GestureDetector(
                        onTap: () {
                          SSEventReporttttt.verfication_start();
                          onClose();
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
                              "one_last_7".tr,
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "one_last_8".tr,
                        style: TextStyle(
                          color: Color(0xff7E8E9B),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                GestureDetector(
                  onTap: () {
                    SSEventReporttttt.verfication_close();
                    onClose();
                  },
                  child: Image.asset(
                    Assets.img.closePopup.path,
                    width: 30.h,
                    height: 30.h,
                  ),
                ),
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
