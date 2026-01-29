import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_common/sssssp/spine_hand.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class OverlayWithddBuzu {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show({required VoidCallback onClose}) {
    SSEventReporttttt.insufficient_pop();
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return WithdddBuzu(
          onClose: () {
            close();
            onClose();
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

class WithdddBuzu extends StatefulWidget {
  const WithdddBuzu({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<WithdddBuzu> createState() => _WithdddBuzuState();
}

class _WithdddBuzuState extends State<WithdddBuzu> {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 250);

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
            scale: showAnimated ? 1.0 : 0.8,
            // curve: Curves.linearToEaseOut,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24.h),
                  child: Container(
                    width: 324.w,
                    height: 470.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 1.0),
                      borderRadius: BorderRadius.circular(24.h),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 36.h,
                                decoration: BoxDecoration(
                                  color: Color(0xffFEF2F2),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 12.w,
                                      height: 12.w,
                                      decoration: BoxDecoration(
                                        color: Color(0xffB63637),
                                        borderRadius: BorderRadius.circular(
                                          24.w,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "buzu_1".tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.sp,
                                        color: Color(0xffB63637),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 8.h),
                              Text(
                                "buzu_2".tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                  color: Color(0xff000000),
                                ),
                              ),
                              SizedBox(height: 8.h),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text.rich(
                                  TextSpan(
                                    text: "buzu_3".tr,
                                    children: [
                                      TextSpan(
                                        text: "  ${"buzu_4".tr}  ",
                                        style: TextStyle(
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      TextSpan(text: "${"buzu_5".tr}."),
                                    ],
                                  ),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: Color(0xff7E8E9B),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              SizedBox(height: 16.h),
                              centerWwww(),
                              SizedBox(height: 16.h),
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
                                          Assets.img.gurad.path,
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
                                            "buzu_6".tr,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14.sp,
                                              color: Color(0xff183C98),
                                            ),
                                          ),
                                          SizedBox(height: 4.h),
                                          Text.rich(
                                            TextSpan(
                                              text: "${"buzu_7".tr} ",
                                              children: [
                                                TextSpan(
                                                  text:
                                                  " ${"buzu_8".tr}.",
                                                  style: TextStyle(
                                                    color: Color(0xff164CFF),
                                                  ),
                                                ),

                                              ],
                                            ),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              height: 1,
                                              color: Color(0xff242731),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              GestureDetector(
                                onTap: () {
                                  SSEventReporttttt.insufficient_pop_spin();
                                  onClose();
                                },
                                child: Container(
                                  width: 230.h,
                                  height: 42.h,
                                  decoration: BoxDecoration(
                                    color: Color(0xff31C520),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Center(
                                        child: Text(
                                          "${"buzu_9".tr} ${SSCountry.curGuojiaFuhao()}1,000",
                                          style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: -20.w,
                                        top: 10.h,

                                        child: Center(
                                          child: SizedBox(
                                            width: 65.h,
                                            height: 72.h,
                                            child: const SpineHand(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(
                                    "buzu_10".tr,
                                    style: TextStyle(
                                      color: Color(0xff7E8E9B),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 40.h),
                GestureDetector(
                  onTap: () {
                    SSEventReporttttt.insufficient_pop_close();
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

  centerWwww() {
    double minW = MainController.minWithdddMoney;
    double curMmmm = MainController.to.curMonnnn.value;
    double left = minW - curMmmm;
    if (left <= 0) {
      left = 0;
    }
    return Container(
      width: 290.w,
      height: 132.h,
      decoration: BoxDecoration(
        color: Color(0xffF7F9FF),
        borderRadius: BorderRadius.circular(12.w),
        border: Border.all(color: Color(0xffEFEAFD), width: 1.w),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "buzu_11".tr,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
              ),

              Text(
                "buzu_12".tr,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              Text(
                curMmmm.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
              ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    Assets.img.next.path,
                    width: 29.w,
                    height: 15.w,
                  ),
                ),
              ),
              Text(
                "${minW}",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff23A007),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h,),
          SSProjjjj(
            height: 18.h,
            innerHeight: 16.h,
            width: 260.w,
            progress: curMmmm / minW,
            gradientColors: [Color(0xff0077FF), Color(0xff0077FF)],
            bgColor: Color(0xffE3E4E8),
          ),
          SizedBox(height: 4.h,),
          Row(
            children: [
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Color(0xffFCDCDC),
                    border: Border.all(color: Color(0xffF49797), width: 1.w),
                    borderRadius: BorderRadius.circular(8.w)
                  ),
                  child: Center(
                    child: Text(
                      "${SSCountry.curGuojiaFuhao()}${left.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                        color: Color(0xffF52323)
                      ),
                    ),
                  ),
                ),
              ),
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
}
