import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_jindu2.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class OverlayRank {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return RankWidget(
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

class RankWidget extends StatefulWidget {
  const RankWidget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<RankWidget> createState() => _RankWidgetState();
}

class _RankWidgetState extends State<RankWidget> {
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
                  height: 443.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 1.0),
                    borderRadius: BorderRadius.circular(24.h),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 4.h),
                      RankTopWidget(),
                      SizedBox(height: 20.h),
                      Text(
                        "Payout Sent!",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: Color(0xff000000),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Text.rich(
                          TextSpan(
                            text: "We've successfully sent your",
                            children: [
                              TextSpan(
                                text: "\$50.00",
                                style: TextStyle(color: Color(0xff20B029)),
                              ),
                              TextSpan(text: "to your bank."),
                            ],
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: Color(0xff242731),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Text.rich(
                          TextSpan(
                            text:
                                "However, the network is currently experiencing high traffic.",
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: Color(0xff242731),
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      Container(
                        width: 290.w,
                        height: 114.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFAF8FF),
                          borderRadius: BorderRadius.circular(16.w),
                          border: Border.all(
                            color: Color(0xffEFEAFD),
                            width: 1.w,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "YOUR POSITION IN QUEUE",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text.rich(
                              TextSpan(
                                text: "99",
                                children: [
                                  TextSpan(
                                    text: "/199",
                                    style: TextStyle(color: Color(0xff242731)),
                                  ),
                                ],
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24.sp,
                                color: Color(0xff164CFF),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text.rich(
                              TextSpan(text: "Estimated Wait: ~2-3 Hours"),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                color: Color(0xff242731),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),
                      GestureDetector(
                        onTap: () {
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
                              "Boost to #1 Instantly!",
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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

  onClose() async {
    ssLogggg("======Setting close");
    widget.onClose();
  }
}

class RankTopWidget extends StatefulWidget {
  const RankTopWidget({super.key});

  @override
  State<RankTopWidget> createState() => _RankTopWidgetState();
}

class _RankTopWidgetState extends State<RankTopWidget> {
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: 250), (tim) {
      if (mounted) {
        setState(() {
          curIndex = curIndex + 1;
          if (curIndex >= 4) {
            curIndex = 0;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return topBankWidget();
  }

  int curIndex = 0;

  jinduWidget(int index) {
    bool hasOk = curIndex == index;

    return Image.asset(
      hasOk
          ? Assets.img.withdrawRankJindu2.path
          : Assets.img.withdrawRankJindu1.path,
      width: 30.w,
      height: 21.h,
    );
  }

  topBankWidget() {
    return Container(
      width: 318.w,
      height: 81.h,
      child: Stack(
        children: [
          Image.asset(
            Assets.img.withdrawRankBg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Center(
                        child: Image.asset(
                          Assets.img.withdrawRankBank.path,
                          width: 46.h,
                          height: 48.h,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Center(
                          child: Image.asset(
                            Assets.img.withdrawRankSelect.path,
                            width: 21.h,
                            height: 21.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                jinduWidget(0),
                jinduWidget(1),
                Image.asset(
                  Assets.img.withdrawRankCard.path,
                  width: 52.h,
                  height: 36.h,
                ),
                jinduWidget(2),
                jinduWidget(3),
                Image.asset(
                  Assets.img.withdrawRankMoney.path,
                  width: 58.h,
                  height: 51.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
