import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:slots_132/jc_kuangggg/base_dialog.dart';




showTongzhiDialog(
    BuildContext context, {
      required VoidCallback onBtn,
      required VoidCallback onClose,
    }) {
  // PBMaiDian.inform_back_pop();
  return showBaseDialog(
    context: context,
    child: TongzhiWidget(
      onClose: () {
        onClose();
      },
      onBtn: () {
        onBtn();
        openAppSettings();
      },
    ),
  );
}

class TongzhiWidget extends StatefulWidget {
  const TongzhiWidget({super.key, required this.onClose, required this.onBtn});

  final VoidCallback onClose;
  final VoidCallback onBtn;

  @override
  State<TongzhiWidget> createState() => _TongzhiWidgetState();
}

class _TongzhiWidgetState extends State<TongzhiWidget> {
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
      width: 678.w,
      height: 771.h,
      decoration: BoxDecoration(
        color: Color(0xff992D2E),
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
                      "Permission error".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xffffffff),
                        fontSize: 42.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 40.w,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    widget.onClose();
                  },
                  child:    Container(
                    width: 40.h,
                    height: 40.h,
                    color: Colors.green,
                  ),
                  // child: Image.asset(
                  //   Assets.tupian.guide12Close.path,
                  //   width: 40.h,
                  //   height: 40.h,
                  //   color: Color(0xffffffff),
                  // ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 640.w,
                height: 660.h,
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFF),
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80.h),
                    Stack(
                      children: [
                        // Image.asset(
                        //   Assets.tupian.notification.path,
                        //   width: 319.h,
                        //   height: 242.h,
                        //   fit: BoxFit.contain,
                        // ),
                        Container(
                          width: 319.h,
                          height: 242.h,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Center(
                      child: Text(
                        "notifications_des".tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 42.sp,
                          color: Color(0xff992D2D),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Center(
                      child: Text(
                        "notifications_des2".tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30.sp,
                          color: Color(0xff992D2D),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            widget.onBtn();
                          },
                          child: Container(
                            width: 353.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              color: Color(0xffF85823),
                              borderRadius: BorderRadius.circular(16.w),
                              border: Border.all(
                                color: Color(0xffD04A1E),
                                width: 2.w,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    "notifications_open".tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 42.sp,
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
