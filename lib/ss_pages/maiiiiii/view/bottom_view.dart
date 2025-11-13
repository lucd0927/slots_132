import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/ss_common/routes.dart';
import 'package:slots_132/ss_pages/maiiiiii/controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/slot_machine.dart';

class BottomView extends StatelessWidget {
  const BottomView({super.key});

  @override
  Widget build(BuildContext context) {
    return contentWidget();
    return Obx(() {
      return contentWidget();
    });
  }

  contentWidget() {
    return Container(
      width: double.infinity,
      height: 405.h,
      // color: Colors.teal,
      child: Stack(
        children: [
          Image.asset(
            Assets.img.mainSlotsDetail.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0.h,
            bottom: 0.h,
            child: Column(
              children: [topProgressWidget(), slotsMachine(), bottomView()],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomView() {
    return Container(
      width: double.infinity,
      height: 84.h,
      color: Colors.teal.withValues(alpha: 0.0),
      child: Stack(
        children: [
          Center(child: spinWidget()),
          Positioned(
            top: 0,
            left: 20.w,
            bottom: 0,
            child: Center(child: wheelWidget()),
          ),
          Positioned(
            top: 0,
            right: 20.w,
            bottom: 0,
            child: Center(child: addMoneyWidget()),
          ),
        ],
      ),
    );
  }

  addMoneyWidget() {
    return Container(
      width: 100.w,
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 65.w,
            height: 40.h,
            // color: Colors.white.withValues(alpha: 0.2),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 25.h,
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      color: Color(0xff090909).withValues(alpha: 0.8),
                    ),
                    child: Center(
                      child: SSAniiiiCount(
                        value: 10,
                        textStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    Assets.img.mainMaxSub.path,
                    width: 18.w,
                    height: 31.w,
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    Assets.img.mainMaxAdd.path,
                    width: 18.w,
                    height: 31.w,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 2.w),
          Container(
            width: 30.w,
            height: 30.h,
            child: Stack(
              children: [
                Image.asset(
                  Assets.img.mainBottomMax.path,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                Positioned.fill(
                  child: Center(
                    child: SSTxtBorder(
                      text: "MAX\nBET",
                      fontSize: 10.w,
                      fontWeight: FontWeight.w700,
                      fontColor: Colors.white,
                      foreground: Color(0xffFF6200),
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget spinWidget() {
    return GestureDetector(
      onTap: () {
        MainController.to.onStartRoller();
      },
      child: Container(
        width: 125.h,
        height: 60.h,
        color: Colors.red.withValues(alpha: 0),
        child: Stack(
          children: [
            Image.asset(
              Assets.img.btnSpin.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned.fill(
              bottom: 5.h,
              child: Container(
                color: Colors.white.withValues(alpha: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 2.h),
                    SSTxtGraBorder(
                      text: "SPIN",
                      fontSize: 28.sp,
                      fontFamily: FontFamily.rubik,
                      fontWeight: FontWeight.w700,
                      strokeColor: Color(0xff174726),
                    ),

                    AutoSizeText(
                      "HOLD FOR AUTO",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: FontFamily.rubik,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff2B4735),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget wheelWidget() {
    return GestureDetector(
      onTap: onWheel,
      child: Container(
        width: 65.h,
        height: 72.h,
        color: Colors.red.withValues(alpha: 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Hero(
              tag: "Wheellll",
              child: Image.asset(
                Assets.img.mainWheel.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              left: -10.w,
              right: -10.w,
              child: Center(
                child: SSTxtGraBorder(
                  text: "Wheel",
                  strokeColor: Color(0xff30120A),
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onWheel(){
    Get.toNamed(SSRouttttt.wheeee);
  }

  Container slotsMachine() {
    return Container(
      width: double.infinity,
      color: Colors.green.withValues(alpha: 0.0),
      height: 250.h,
      child: SSSlotMachine(key: MainController.to.slotMachineKey),
    );
  }

  Container topProgressWidget() {
    return Container(
      width: double.infinity,
      color: Colors.yellow.withValues(alpha: 0.0),
      height: 70.h,
      child: Center(
        child: Container(
          width: 243.w,
          height: 54.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                Assets.img.mainBonusBg.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SSProjjjj(
                      height: 16.h,
                      innerHeight: 12.h,
                      width: 180.w,
                      progress: 0.5,
                      gradientColors: [Color(0xff59FF69), Color(0xff118C25)],
                      bgColor: Color(0xff0D0D0D).withValues(alpha: 0.6),
                      text: "",
                    ),
                  ],
                ),
              ),

              Positioned(
                top: -10.h,
                left: -40.w,
                child: Image.asset(
                  Assets.img.mainLingdang.path,
                  width: 82.w,
                  height: 71.w,
                  fit: BoxFit.fill,
                ),
              ),

              Positioned(
                top: -10.h,
                right: -30.w,
                child: Image.asset(
                  Assets.img.mainBounsGame.path,
                  width: 89.w,
                  height: 83.w,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
