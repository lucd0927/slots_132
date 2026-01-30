import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_scale.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class OverlayWithddJindu3 {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    SSEventReporttttt.cover_pop();
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return WithddJindu3(
          onClose: () {
            close();
            ssLogggg("====WithddJindu3=close");
            Navigator.maybePop(Get.context!);
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

class WithddJindu3 extends StatefulWidget {
  const WithddJindu3({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<WithddJindu3> createState() => _WithddJindu3State();
}

class _WithddJindu3State extends State<WithddJindu3> {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 250);
  Duration animD2 = Duration(milliseconds: 5000);

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
            // curve: Curves.linearToEaseOut,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 324.w,
                  height: !SSCountry.hasUSA()?440.h:388.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 1.0),
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 20.h),
                              Text(
                                "jindu3_1".tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                  color: Color(0xff000000),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20.h),

                              SSAScale(
                                child: Image.asset(
                                  Assets.img.txPopupJindu3.path,
                                  width: 168.h,
                                  height: 115.h,
                                ),
                              ),

                              SizedBox(height: 10.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Text.rich(
                                  TextSpan(
                                    text:
                                        "jindu3_2".tr,
                                    children: [
                                      TextSpan(
                                        text: "",
                                        style: TextStyle(
                                          color: Color(0xffFE0707),
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: Color(0xff2E313A),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              SizedBox(height: 10.h),
                              Container(
                                width: 290.w,
                                height: !SSCountry.hasUSA()?100.h:86.h,
                                decoration: BoxDecoration(
                                  color: Color(0xffFAF8FF),
                                  borderRadius: BorderRadius.circular(12.w),
                                  border: Border.all(
                                    color: Color(0xffEFEAFD),
                                    width: 1.w,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                      ),
                                      child: Text.rich(
                                        TextSpan(
                                          text: "${"jindu3_3".tr} ",
                                          children: [
                                            TextSpan(
                                              text: "${"jindu3_4".tr} ",
                                              style: TextStyle(
                                                color: Color(0xffFE0707),
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  "jindu3_5".tr,
                                            ),
                                          ],
                                        ),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                          color: Color(0xff2E313A),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                      ),
                                      child: Text.rich(
                                        TextSpan(
                                          text:
                                              "${WithdddController.to.curSpinLiuceng1.value}",
                                          children: [
                                            TextSpan(
                                              text:
                                                  "/${WithdddController.to.maxSpinCountWithWithdraw()}",
                                              style: TextStyle(
                                                color: Color(0xff2E313A),
                                              ),
                                            ),
                                          ],
                                        ),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                          color: Color(0xff164CFF),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 10.h),

                              GestureDetector(
                                onTap: () {
                                  SSEventReporttttt.cover_pop_spin();
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
                                      "jindu3_6".tr,
                                      style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
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
    if (mounted) {
      // setState(() {
      //   showAnimated = false;
      // });
      // await Future.delayed(animD);
    }
    widget.onClose();
  }
}
