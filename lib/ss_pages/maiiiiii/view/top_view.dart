
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';

class TopView extends StatelessWidget {
  const TopView({super.key});

  @override
  Widget build(BuildContext context) {
    return  topWidget();
  }

  topWidget() {
    return Container(
      width: ScreenUtil().screenWidth,
      height: 90.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            Assets.img.mainTopBg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),

          Positioned(
            top: 48.h,
            left: 28.w,
            child: Container(
              width: 100.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: Colors.teal.withValues(alpha: 0.0),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 0.w,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Center(child: topMoney()),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: -8.w,
                    child: Center(
                      child: Image.asset(
                        Assets.img.money.path,
                        width: 30.h,
                        height: 28.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 44.h,
            left: 142.w,
            right: 142.w,
            child: Container(
              width: double.infinity,
              height: 34.h,
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.0),
              ),
              child: Center(
                child: Image.asset(
                  Assets.img.tCashapp.path,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),

          Positioned(
            top: 48.h,
            right: 50.w,
            child: Container(
              width: 80.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: Colors.teal.withValues(alpha: 0.0),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 0.w,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Center(child: topXp()),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: -0.w,
                    child: Center(
                      child: Image.asset(
                        Assets.img.mainTopXp.path,
                        width: 30.h,
                        height: 28.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  topMoney() {
    return Container(
      width: 100.w,
      height: 24.h,
      padding: EdgeInsets.only(left: 12.w),
      decoration: BoxDecoration(
        color: Colors.teal.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(30.h),
        gradient: LinearGradient(
          colors: [
            Color(0xff540406),
            Color(0xff3C0302),
            Color(0xff360100),
            Color(0xff560000),
          ],
        ),
        border: Border.all(color: Color(0xffAA3A3D), width: 1.w),
      ),
      child: Center(
        child: SSAniiiiCount(
          duration: Duration(milliseconds: 500),
          fractionDigits: 2,
          prefix: "\$",
          value: 1000,
          // pass in a value like 2014
          textStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xff6AFF00),
            fontSize: 16.sp,
            // height: 1.1,
          ),
        ),
      ),
    );
  }

  topXp() {
    return Container(
      width: 100.w,
      height: 26.h,
      padding: EdgeInsets.only(left: 12.w),
      decoration: BoxDecoration(
        color: Colors.teal.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(30.h),
        gradient: LinearGradient(
          colors: [
            Color(0xff540406),
            Color(0xff3C0302),
            Color(0xff360100),
            Color(0xff560000),
          ],
        ),
        border: Border.all(color: Color(0xffAA3A3D), width: 1.w),
      ),
      child: Center(
        child: SSAniiiiCount(
          duration: Duration(milliseconds: 500),
          fractionDigits: 0,
          prefix: "LV.",
          value: 1,
          // pass in a value like 2014
          textStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xffFFFFFF),
            fontSize: 16.sp,
            // height: 1.1,
          ),
        ),
      ),
    );
  }
}
