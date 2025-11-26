import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/ss_pages/wheeee/vieee/wheee_bottom.dart';
import 'package:slots_132/ss_pages/wheeee/vieee/wheel_detail.dart';
import 'package:slots_132/ss_pages/wheeee/whe_controller.dart';

class Wheeee extends StatefulWidget {
  const Wheeee({super.key});

  @override
  State<Wheeee> createState() => _WheeeeState();
}

class _WheeeeState extends State<Wheeee> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool hasOver = WheController.to.wheelEnd.value;
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Image.asset(
                Assets.img.wheelBg.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withValues(alpha: 0.0),
              ),

              Positioned.fill(
                child: Column(
                  children: [
                    SizedBox(height: 70.h),

                    Image.asset(
                      WheController.to.showOneMore.value
                          ? Assets.img.wheelTitleFreespin.path
                          : hasOver
                          ? Assets.img.wheelTitleCongrats.path
                          : Assets.img.wheelTitle.path,
                      width: 333.w,
                      height: 165.w,
                      fit: BoxFit.fill,
                      gaplessPlayback: true,
                    ),
                    SSWheelDetail(
                      onEnd: (value) {
                        WheController.to.onSpinSub(value);
                      },
                    ),
                    if (!WheController.to.showOneMore.value) WheeeBottom(),
                  ],
                ),
              ),
              if (WheController.to.showOneMore.value)
                Positioned.fill(
                  child: Column(children: [Spacer(), onMoreWidget()]),
                ),

              Positioned(
                top: 50.h,
                left: 20.w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    Assets.img.btnBack.path,
                    width: 42.w,
                    height: 27.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  onMoreWidget() {
    return Container(
      color: Colors.blueAccent.withValues(alpha: 0.0),
      child: Column(
        children: [
          SSTxtBorder(
            text: "Tap to Spin",
            fontColor: Color(0xffFFF700),
            fontSize: 40.sp,
            foreground: Color(0xffE63737),
            strokeWidth: 2.w,
          ),
          SizedBox(height: 50.h),
          Container(
            width: 365.w,
            height: 63.h,
            child: Stack(
              children: [
                Image.asset(
                  Assets.img.btnWheelOneMore.path,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                Center(
                  child: SSTxtBorder(
                    text: "ONE MORE FREE SPIN",
                    fontColor: Color(0xffFFF700),
                    fontSize: 28.sp,
                    foreground: Color(0xffE63737),
                    strokeWidth: 2.w,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 90.h),
        ],
      ),
    );
  }
}
