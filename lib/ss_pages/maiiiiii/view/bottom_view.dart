import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/ss_pages/maiiiiii/controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/slot_machine.dart';

class BottomView extends StatelessWidget {
  const BottomView({super.key});

  @override
  Widget build(BuildContext context) {
    return bottomWidget();
    return Obx(() {
      return bottomWidget();
    });
  }

  bottomWidget() {
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
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.yellow.withValues(alpha: 0.0),
                  height: 80.h,
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
                                  gradientColors: [
                                    Color(0xff59FF69),
                                    Color(0xff118C25),
                                  ],
                                  bgColor: Color(
                                    0xff0D0D0D,
                                  ).withValues(alpha: 0.6),
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
                ),
                Container(
                  width: double.infinity,
                  color: Colors.green.withValues(alpha: 0.0),
                  height: 240.h,
                  child: SSSlotMachine(),
                ),
                Container(
                  width: double.infinity,
                  height: 84.h,
                  color: Colors.teal.withValues(alpha: 0.0),
                  child: Row(
                    children: [
                      Container(
                        width: 65.h,
                        height: 72.h,
                        // color: Colors.red,
                        child: Stack(
                          children: [
                            Image.asset(
                              Assets.img.mainWheel.path,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Positioned.fill(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      MainController.to.onStartRoller();
                                    },
                                    child: Image.asset(
                                      Assets.img.btnTxtSpin.path,
                                      width: 72.h,
                                      height: 35.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 125.h,
                        height: 50.h,
                        color: Colors.red,
                        child: Stack(
                          children: [
                            Image.asset(
                              Assets.img.btnSpin.path,
                              width: 125.h,
                              height: 50.h,
                              fit: BoxFit.fill,
                            ),
                            Positioned.fill(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      MainController.to.onStartRoller();
                                    },
                                    child: Image.asset(
                                      Assets.img.btnTxtSpin.path,
                                      width: 72.h,
                                      height: 35.h,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
