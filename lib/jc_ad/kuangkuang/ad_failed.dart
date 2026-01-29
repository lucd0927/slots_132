import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/jc_kuangggg/base_dialog.dart';

showAdFailedDialog(
  BuildContext context, {
  required VoidCallback onBtn,
  required VoidCallback onClose,
}) {
  // PBMaiDian.ad_fail_pop();

  OverlayAdFailed().show(money: 0, onBtn: onBtn, onBtn2: onClose);
  return;
  return jcShowBKuang(
    context: context,
    child: AdFailedWidget(
      onBtn2: () {
        onClose();
      },
      onBtn: () {
        onBtn();
      },
    ),
  );
}

class OverlayAdFailed {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show({
    required double money,
    required VoidCallback onBtn,
    required VoidCallback onBtn2,
  }) {
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return AdFailedWidget(
          onBtn2: () {
            close();
            onBtn2();
          },
          onBtn: () {
            close();
            onBtn();
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

class AdFailedWidget extends StatefulWidget {
  const AdFailedWidget({super.key, required this.onBtn2, required this.onBtn});

  final VoidCallback onBtn2;
  final VoidCallback onBtn;

  @override
  State<AdFailedWidget> createState() => _AdFailedWidgetState();
}

class _AdFailedWidgetState extends State<AdFailedWidget> {
  int index = 0;
  bool showStep2 = false;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

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
    Widget child = Container(
      // color: Colors.amber,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 200.h),
          content(),
          SizedBox(height: 40.h),
          GestureDetector(
            onTap: () {
              // Navigator.pop(context);
              widget.onBtn2();
            },
            child: Image.asset(
              Assets.img.closePopup.path,
              width: 30.h,
              height: 30.h,
            ),
          ),
        ],
      ),
    );
    return Material(
      color: Colors.transparent,
      child: AnimatedContainer(
        duration: animD,
        color: Colors.black.withValues(alpha: showAnimated ? 0.7 : 0),
        child: AnimatedScale(
          duration: animD,
          scale: showAnimated ? 1.0 : startScale,
          child: child,
        ),
      ),
    );
  }

  content() {
    return Container(
      width: 324.w,
      height: 320.h,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Stack(
            children: [
              Container(
                width: double.infinity,
                // color: Colors.amber,
                height: 60.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ad loading failed".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xff272A2F),
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),
              // Positioned(
              //   top: 0,
              //   right: 20.w,
              //   bottom: 0,
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.pop(context);
              //       widget.onClose();
              //     },
              //     // child: Container(
              //     //   width: 20.h,
              //     //   height: 20.h,
              //     //   color: Colors.cyan,
              //     // ),
              //     // child: Image.asset(
              //     //   Assets.tupian.guide12Close.path,
              //     //   width: 40.h,
              //     //   height: 40.h,
              //     //   color: Color(0xffffffff),
              //     // ),
              //   ),
              // ),
            ],
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 320.w,
                height: 330.h,
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFF),
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: 75.h),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          Assets.img.adImg.path,
                          width: 188.h,
                          height: 188.h,
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          top: -20.h,
                          right: -20.w,
                          child: Image.asset(
                            Assets.img.adNo.path,
                            width: 84.h,
                            height: 84.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),

                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                            widget.onBtn();
                          },
                          child: Container(
                            width: 230.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Color(0xff00D54B),
                              borderRadius: BorderRadius.circular(40.w),
                              // border: Border.all(
                              //   color: Color(0xffD04A1E),
                              //   width: 2.w,
                              // ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    "Try Again".tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp,
                                      // foreground: Color(0xffD0871E),
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
}
