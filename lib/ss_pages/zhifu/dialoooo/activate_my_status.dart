import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/audio.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
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
    SSEventReporttttt.vip_partner_become_pop();
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
            scale: showAnimated?1:0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24.w),
                  child: Container(
                    width: 324.w,
                    height: 470.h,
                    color: Colors.blueAccent.withValues(alpha: 0.0),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 151.h,
                              width: double.infinity,
                              color: Color(0xff121A27),
                            ),
                            Expanded(
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),

                        Positioned.fill(
                          left: 16.w,
                          right: 16.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xff423B28),
                                      borderRadius: BorderRadius.circular(24.w),
                                      border: Border.all(
                                        color: Color(0xff827757),
                                        width: 1.w,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "STATUS INACTIVE",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xffFCDC48),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "Potential Monthly Income",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.sp,
                                  color: Color(0xffBFBFBF),
                                  // height: 1.4,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "${SSCountry.curGuojiaFuhao()}${MainController.to.curMonnnn.value.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 36.sp,
                                  color: Color(0xffffffff),
                                  height: 1,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "USD / DAILY PAYOUT",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.sp,
                                  color: Color(0xffD2B531),
                                  // height: 1.4,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              centerWwwww(),
                              SizedBox(height: 40.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        Assets.img.vip1.path,
                                        width: 30.h,
                                        height: 30.h,
                                      ),
                                      Text(
                                        "Instant",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10.sp,
                                          color: Color(0xff69708E),
                                          // height: 1.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        Assets.img.vip2.path,
                                        width: 30.h,
                                        height: 30.h,
                                      ),
                                      Text(
                                        "No Fees",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10.sp,
                                          color: Color(0xff69708E),
                                          // height: 1.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        Assets.img.vip3.path,
                                        width: 30.h,
                                        height: 30.h,
                                      ),
                                      Text(
                                        "Daily",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10.sp,
                                          color: Color(0xff69708E),
                                          // height: 1.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 40.h),
                              Center(
                                child: GestureDetector(
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
                                        "ACTIVATE DAILY \$1,000",
                                        style: TextStyle(
                                          color: Color(0xffffffff),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Center(
                                child: Text(
                                  "By activating, you agree to the VIP Terms & Conditions.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                    color: Color(0xff7E8E9B),
                                    // height: 1.4,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        Positioned(
                            right: 10.w,
                            top: 10.h,
                            child: Image.asset(Assets.img.vipV.path,width: 88.w,height: 88.w,)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                GestureDetector(
                  onTap: onClose,
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

  Container centerWwwww() {
    return Container(
      width: 286.w,
      height: 118.h,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(16.w),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withValues(alpha: 0.15),
            spreadRadius: 2.w,
            blurRadius: 5.w,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(width: 12.w),

              Text(
                "CURRENT LEVEL",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                  color: Color(0xff636473),
                  // height: 1.4,
                ),
              ),
            ],
          ),

          Row(
            children: [
              SizedBox(width: 12.w),
              Text(
                MainController.to.level().toStringAsFixed(0),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Color(0xffFEFDE8),
                  borderRadius: BorderRadius.circular(4.w),
                  border: Border.all(color: Color(0xffF3ECC2), width: 1.w),
                ),
                child: Text(
                  "MAX LEVEL ${MainController.maxLevel}",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w900,
                    color: Color(0xffBB8B29),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
            ],
          ),
          SizedBox(height: 4.h),
          Center(
            child: SSProjjjj(
              height: 18.h,
              innerHeight: 16.h,
              width: 260.w,
              progress: MainController.to.level() / MainController.maxLevel,
              gradientColors: [Color(0xffFF703D), Color(0xffFF703D)],
              bgColor: Color(0xffE3E4E8),
            ),
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text(
              "You are 9 levels away from Diamond Status",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 10.sp,
                color: Color(0xff7E8E9B),
                height: 1,
              ),
            ),
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
}
