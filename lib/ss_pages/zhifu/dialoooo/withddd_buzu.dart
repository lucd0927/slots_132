import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/controller.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class OverlayWithddBuzu {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return WithdddBuzu(
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
          child: AnimatedSlide(
            duration: animD,
            offset: showAnimated ? Offset.zero : Offset(0, 1),
            // curve: Curves.linearToEaseOut,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 324.w,
                  height: 388.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 1.0),
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 12.h),
                            Text(
                              "YOU'RE SO CLOSE!",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              "The next cash out is at ${MainController.to.minWithdddMoneyWithCountry}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: Color(0xff2E313A),
                              ),
                            ),
                            Text(
                              "You're just \$1.50 away!",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: Color(0xff2E313A),
                              ),
                            ),
                            SizedBox(height: 30.h),
                            Image.asset(
                              Assets.img.txBuzuBg.path,
                              width: 145.h,
                              height: 87.h,
                            ),
                
                            SizedBox(height: 20.h),
                            jinduWidget(),
                
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
                                    "Spin for Your \$1,000",
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
                                Image.asset(
                                  Assets.img.txBuzuTips.path,
                                  width: 29.h,
                                  height: 29.h,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "Guaranteed within 20 spins",
                                  style: TextStyle(
                                    color: Color(0xff657094),
                                    fontSize: 14.sp,
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

  jinduWidget() {
    double scale = 1.3;
    Widget bgItem = Image.asset(
      Assets.img.txBuzuJindu2.path,
      width: 30.w * scale,
      height: 14.w * scale,
    );
    Widget bgItemS = Image.asset(
      Assets.img.txBuzuJindu.path,
      width: 30.w * scale,
      height: 14.w * scale,
    );

    return Container(
      width: 250.w,
      height: 40.h,
      decoration: BoxDecoration(color: Colors.teal.withValues(alpha: 0.0)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Row(children: [bgItem, bgItem, bgItem, bgItem, bgItem]),
          ),
          Center(child: Row(children: [bgItemS, bgItemS, bgItemS])),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: Container(
                width: 63.w,
                height: 28.w,
                color: Colors.teal.withValues(alpha: 0),
                child: Stack(
                  children: [
                    Image.asset(
                      Assets.img.txBuzuPay.path,
                      width: 63.w,
                      height: 28.w,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                              WithdddController.to.currentPaymentIconSelected(),
                              width: 46.w,
                              height: 18.w,
                            ),
                            Text(
                              MainController.to.minWithdddMoneyWithCountry,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 8.sp,
                                color: Color(0xff000000),
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
