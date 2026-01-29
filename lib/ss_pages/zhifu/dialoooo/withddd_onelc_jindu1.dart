import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_onelc_jindu2.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class OverlayWithddOnelastcheckJindu1 {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    _overlay = null;
    SSEventReporttttt.suc_pop();
    _overlay = OverlayEntry(
      builder: (context) {
        return WithddOnelastcheckJindu1Widget(
          onClose: () {
            close();
            OverlayOneLastCheckJindu2().show();
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

class WithddOnelastcheckJindu1Widget extends StatefulWidget {
  const WithddOnelastcheckJindu1Widget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<WithddOnelastcheckJindu1Widget> createState() =>
      _WithddOnelastcheckJindu1WidgetState();
}

class _WithddOnelastcheckJindu1WidgetState
    extends State<WithddOnelastcheckJindu1Widget> {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 250);
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });
      _timer = Timer(Duration(milliseconds: 5000), () {
        onClose();
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
            scale: showAnimated ? 1.0 : 0.8,
            // offset: showAnimated ? Offset.zero : Offset(0, 1),
            // curve: Curves.linearToEaseOut,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 324.w,
                  height: 480.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 1.0),
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 12.h),
                      Image.asset(
                        Assets.img.payoutS.path,
                        width: 83.h,
                        height: 83.h,
                      ),
                      Text(
                        "one_last_jindu_1".tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "one_last_jindu_2".tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                          color: Color(0xff888888),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        width: 288.w,
                        height: 116.h,
                        decoration: BoxDecoration(
                          color: Color(0xffF9FAFC),
                          borderRadius: BorderRadius.circular(8.w),
                          border: Border.all(
                            color: Color(0xffE6E7E9),
                            width: 1.w,
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            Text(
                              "${MainController.to.minWithdddMoneyWithCountry}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 36.sp,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    WithdddController.to
                                        .currentPaymentIconSelected(),
                                    width: 72.w,
                                    height: 28.w,
                                  ),

                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4.w,
                                      vertical: 4.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xffDCFCE7),
                                      border: Border.all(
                                        color: Color(0xff97F4B7),
                                        width: 1.w,
                                      ),
                                      borderRadius: BorderRadius.circular(2.w),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "one_last_jindu_3".tr,
                                          style: TextStyle(
                                            color: Color(0xff5FCE85),
                                            fontWeight: FontWeight.w900,
                                            fontSize: 8.sp,
                                          ),
                                        ),
                                        SizedBox(width: 2.w),
                                        Image.asset(
                                          Assets.img.payoutOk.path,
                                          width: 10.w,
                                          height: 7.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20.h),

                      Container(
                        width: 288.w,
                        height: 82.h,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: Color(0xff141A26),
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 30.w,
                                  height: 30.w,
                                  decoration: BoxDecoration(
                                    color: Color(0xff3A3B36),
                                    borderRadius: BorderRadius.circular(4.w),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      Assets.img.payoutStar.path,
                                      width: 22.w,
                                      height: 22.h,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "one_last_jindu_4".tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 8.sp,
                                        color: Color(0xffA7A7A7),
                                      ),
                                    ),
                                    Text(
                                      "one_last_jindu_5".tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 8.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xff3A3B36),
                                    borderRadius: BorderRadius.circular(4.w),
                                  ),
                                  child: Text(
                                    "one_last_jindu_6",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 10.sp,
                                      color: Color(0xffF0CA37),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h,),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "one_last_jindu_7".tr,
                                      style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffA7A7A7),
                                      ),
                                    ),

                                    Text(
                                      "100%",
                                      style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffA7A7A7),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.h,),
                                Image.asset(
                                  Assets.img.payoutJindu.path,
                                  width: 260.w,
                                  height: 8.h,
                                  fit: BoxFit.fitWidth,
                                ),
                              ],
                            ),
                          ],
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
                              "one_last_jindu_8".tr,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "one_last_jindu_9".tr,
                            style: TextStyle(
                              color: Color(0xff7E8E9B),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40.h),
                // GestureDetector(
                //   onTap: onClose,
                //   child: Image.asset(
                //     Assets.img.closePopup.path,
                //     width: 30.h,
                //     height: 30.h,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onClose() async {
    _timer?.cancel();
    ssLogggg("======Setting close");
    // setState(() {
    //   showAnimated = false;
    // });
    // await Future.delayed(animD);
    widget.onClose();
  }
}
