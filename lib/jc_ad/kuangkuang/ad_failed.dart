import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/jc_kuangggg/base_dialog.dart';

showAdFailedDialog(
  BuildContext context, {
  required VoidCallback onBtn,
  required VoidCallback onClose,
}) {
  // PBMaiDian.ad_fail_pop();
  return jcShowBKuang(
    context: context,
    child: AdFailedWidget(
      onClose: () {
        onClose();
      },
      onBtn: () {
        onBtn();
      },
    ),
  );
}

class AdFailedWidget extends StatefulWidget {
  const AdFailedWidget({super.key, required this.onClose, required this.onBtn});

  final VoidCallback onClose;
  final VoidCallback onBtn;

  @override
  State<AdFailedWidget> createState() => _AdFailedWidgetState();
}

class _AdFailedWidgetState extends State<AdFailedWidget> {
  int index = 0;
  bool showStep2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: IndexedStack(
        index: index,
        children: [
          GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Container(
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
                          Navigator.pop(context);
                          widget.onClose();
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
              ],
            ),
          ),
        ],
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
                      "Ad loading failed",
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
                            Navigator.pop(context);
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
                                    "Try Again",
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
