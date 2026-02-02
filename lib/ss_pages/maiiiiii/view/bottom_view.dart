import 'package:animated_background/animated_background.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_particles/flutter_floating_particles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:particles_flutter/particles_engine.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/audio.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/grey_widget.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_common/routes.dart';
import 'package:slots_132/ss_common/sssssp/spine_hand.dart';
import 'package:slots_132/ss_common/sssssp/spine_tanc_xuanguang.dart';
import 'package:slots_132/ss_common/sssssp/spine_wheel_money.dart';
import 'package:slots_132/ss_common/sssssp/spine_xiaozhuanpan.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/slot_machine.dart';
import 'dart:math';

import 'package:slots_132/ss_pages/wheeee/whe_controller.dart';

class BottomView extends StatelessWidget {
  const BottomView({super.key});

  @override
  Widget build(BuildContext context) {
    // return contentWidget();
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
            gaplessPlayback: true,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0.h,
            bottom: 0.h,
            child: Column(
              children: [
                topProgressWidget(),
                SizedBox(height: 20.h),
                slotsMachine(),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 80.h,
            child: Center(child: jishuWidget()),
          ),

          Positioned(left: 0, right: 0, bottom: 0, child: bottomView()),
        ],
      ),
    );
  }

  Widget jishuWidget() {
    double money = MainController.to.curSpinMoney.value;
    var showWinLines = MainController.to.showWinLines.value;
    bool showNum = showWinLines && money >= 0;
    // showNum = false;
    ssLogggg(
      "====jishuWidget=money:$money showWinLines:$showWinLines showNum:$showNum",
    );
    String txt = "mian_1".tr;
    if (money <= 0) {
      money = 0;
    }

    if (showNum) {
      txt = "";
    }

    return Container(
      width: 170.h,
      height: 26.h,
      child: Stack(
        children: [
          Image.asset(
            Assets.img.mainMoneyChange.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            gaplessPlayback: true,
          ),

          // Positioned(
          //   left: 2.w,
          //   right: 2.w,
          //   top: 2.h,
          //   bottom: 2.h,
          //   child: ClipRRect(
          //     borderRadius: BorderRadiusGeometry.circular(26.h),
          //     child: StarFieldBackground(),
          //   ),
          // ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(26.h),
              child: ParticleEffects(
                config: ParticleConfig(
                  particleType: ParticleType.circle,
                  direction: ParticleDirection.bottomToTop,
                  particleCoverage: ParticleCoverage.semiFull,
                  particleCount: 20,
                  minSize: 5.w,
                  maxSize: 10.w,
                  particleColor: Colors.white,
                  enableGlow: true,
                  glowRadius: 1.5,
                  velocityMultiplier: 0.8,
                  animationDuration: Duration(seconds: 15),
                  minOpacity: 0.6,
                  maxOpacity: 1.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.yellow.withValues(alpha: 0.0),
                ),
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            top: 2.h,
            bottom: 0,
            child: Center(
              child: Container(
                color: Colors.teal.withValues(alpha: 0),
                child: Stack(
                  children: [
                    Center(
                      child: Opacity(
                        opacity: showNum ? 1 : 0,
                        child: SSAniiiiCount(
                          fractionDigits: 2,
                          // value: MainController.to.curSpinMoney.value,
                          value: MainController.to.curSpinMoney.value,
                          textStyle: TextStyle(
                            fontSize: SSCountry.hasUSA() ? 20.sp : 16.sp,
                            height: 1,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff6AFF00),
                            fontFamily: FontFamily.ghostKidAOEPro,
                          ),
                          prefix: SSCountry.curGuojiaFuhao(),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        txt,
                        style: TextStyle(
                          fontSize: SSCountry.hasUSA() ? 16.sp : 14.sp,
                          height: 1,
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamily.ghostKidAOEPro,
                          color: Color(0xff6AFF00),
                        ),
                        textAlign: TextAlign.center,
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

  Widget bottomView() {
    return Container(
      width: double.infinity,
      height: 84.h,
      color: Colors.teal.withValues(alpha: 0.0),
      child: Stack(
        children: [
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
          Center(child: spinWidget()),
        ],
      ),
    );
  }

  addMoneyWidget() {
    return Obx(() {
      double curBeisu = MainController.to.curBeisu.value;

      bool hasMin = curBeisu == MainController.minBet;
      bool hasMax = curBeisu == MainController.maxBet;
      if (curBeisu > 10000) {
        curBeisu = curBeisu / 1000;
      }
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
                          value: curBeisu,
                          textStyle: TextStyle(
                            fontSize: SSCountry.hasUSA() ? 12.sp : 8.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: FontFamily.ghostKidAOEPro,
                          ),
                          suffix: SSCountry.hasUSA()
                              ? ""
                              : SSCountry.hasBr()
                              ? ""
                              : "K",
                          prefix: "${SSCountry.curGuojiaFuhao()}",
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: hasMin
                        ? GreyWidget(
                            child: Image.asset(
                              Assets.img.mainMaxSub.path,
                              width: 18.w,
                              height: 31.w,
                              gaplessPlayback: true,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              MainController.to.onChangeBeisu(
                                -1.0 * MainController.countryBeisu,
                              );
                            },
                            child: Image.asset(
                              Assets.img.mainMaxSub.path,
                              width: 18.w,
                              height: 31.w,
                              gaplessPlayback: true,
                            ),
                          ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: hasMax
                        ? GreyWidget(
                            child: Image.asset(
                              Assets.img.mainMaxAdd.path,
                              width: 18.w,
                              height: 31.w,
                              gaplessPlayback: true,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              MainController.to.onChangeBeisu(
                                1.0 * MainController.countryBeisu,
                              );
                            },
                            child: Image.asset(
                              Assets.img.mainMaxAdd.path,
                              width: 18.w,
                              height: 31.w,
                              gaplessPlayback: true,
                            ),
                          ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 2.w),
            GestureDetector(
              onTap: () {
                MainController.to.onAddMaxBeisu();
              },
              child: Container(
                width: 30.w,
                height: 30.h,
                color: Colors.red.withValues(alpha: 0),
                child: hasMax
                    ? GreyWidget(
                        child: Stack(
                          children: [
                            Image.asset(
                              Assets.img.mainBottomMax.path,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                              gaplessPlayback: true,
                            ),
                            Positioned.fill(
                              child: Center(
                                child: SSTxtBorder(
                                  text: "mian_2".tr,
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
                      )
                    : Stack(
                        children: [
                          Image.asset(
                            Assets.img.mainBottomMax.path,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                            gaplessPlayback: true,
                          ),
                          Positioned.fill(
                            child: Center(
                              child: SSTxtBorder(
                                text: "mian_2".tr,
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
            ),
          ],
        ),
      );
    });
  }

  Widget spinWidget() {
    bool showFree = MainController.to.curShowFreeSpin.value;
    bool showGrey = MainController.to.hasScrollerStart.value && !showFree;
    Widget child = Container(
      width: 125.h,
      height: 60.h,
      color: Colors.red.withValues(alpha: 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            Assets.img.btnSpin.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            gaplessPlayback: true,
          ),
          Positioned.fill(
            bottom: 5.h,
            child: Container(
              color: Colors.white.withValues(alpha: 0.0),
              child: showFree
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(height: 2.h),

                        // SSTxtBorder(
                        //   text: "${MainController.to.curFreeSpinCount.value}",
                        //   fontSize: 24.sp,
                        //   fontFamily: FontFamily.fraunces,
                        //   fontWeight: FontWeight.w700,
                        //   height: 1,
                        //   // strokeColor: Color(0xff174726),
                        // ),
                        SSAniiiiCount(
                          value: MainController.to.curFreeSpinCount.value,
                          textStyle: TextStyle(
                            fontSize: 24.sp,
                            fontFamily: FontFamily.fraunces,
                            fontWeight: FontWeight.w700,
                            height: 1,
                            color: Colors.white,
                          ),
                        ),

                        Image.asset(
                          Assets.img.btnTxtFreeSpin.path,
                          width: 110.h,
                          height: 25.h,
                          fit: BoxFit.contain,
                          gaplessPlayback: true,
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 2.h),

                        // SSTxtGraBorder(
                        //   text: "SPIN",
                        //   fontSize: 28.sp,
                        //   fontFamily: FontFamily.rubik,
                        //   fontWeight: FontWeight.w700,
                        //   strokeColor: Color(0xff174726),
                        // ),
                        Image.asset(
                          Assets.img.btnTxtSpin.path,
                          width: 72.h,
                          height: 25.h,
                          fit: BoxFit.contain,
                          gaplessPlayback: true,
                        ),

                        AutoSizeText(
                          "mian_3".tr,
                          style: TextStyle(
                            fontSize: SSCountry.hasUSA() ? 10.sp : 8.sp,
                            fontFamily: FontFamily.ghostKidAOEPro,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff2B4735),
                            height: 1,
                          ),
                          textAlign: TextAlign.center,
                          minFontSize: 8.sp,
                          stepGranularity: 8.sp,
                        ),
                      ],
                    ),
            ),
          ),
          if (!showFree && !showGrey)
            Positioned(
              right: -20.w,
              top: 0.h,

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
    );
    // return SizedBox();
    return showGrey
        ? GreyWidget(child: child)
        : GestureDetector(
            onTap: () {
              ssLogggg("====showFree:$showFree");
              if (showFree) {
                // return;
              }

              MainController.to.onStartRoller();
            },
            child: child,
          );
  }

  Widget wheelWidget() {
    bool showHand = WheController.to.curWheNum.value > 0;
    showHand = showHand && !MainController.to.curGuideStepSpin1.value;
    return GestureDetector(
      key: ValueKey("ttttt"),
      onTap: onWheel,
      child: Container(
        width: 65.h,
        height: 72.h,
        color: Colors.red.withValues(alpha: 0.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: SSABChange.isPackageB()
              ? [
                  const SSSpineXiaozhuanpan(),
                  const SSSpineWheelMoney(),
                  if (showHand)
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
                ]
              : [
                  Positioned(
                    left: -10.w,
                    right: -10.w,
                    top: -10.h,
                    bottom: -10.h,

                    child: FittedBox(child: const SpineTancXuanguang()),
                  ),
                  Hero(
                    tag: "Wheellll",
                    child: Image.asset(
                      Assets.img.freespinSpin.path,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.contain,
                      gaplessPlayback: true,
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
                        fontFamily: FontFamily.alkatra,
                      ),
                    ),
                  ),
                  if (showHand)
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
    );
  }

  onWheel() {
    SSEventReporttttt.home_page_wheel();
    Get.toNamed(SSRouttttt.wheeee);
  }

  Container slotsMachine() {
    return Container(
      width: 334.w,
      height: 200.h,
      decoration: BoxDecoration(
        color: Color(0xff340606).withValues(alpha: 0.7),
        border: Border.all(color: Color(0xffA43334), width: 4.w),
        borderRadius: BorderRadius.circular(4.w),
      ),

      child: SSSlotMachine(key: MainController.to.slotMachineKey),
    );
  }

  Container topProgressWidget() {
    double progress = MainController.to.progressBonusGame();
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
                gaplessPlayback: true,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SSProjjjj(
                      height: 16.h,
                      innerHeight: 12.h,
                      width: 180.w,
                      progress: progress,
                      gradientColors: [Color(0xff59FF69), Color(0xff118C25)],
                      bgColor: Color(0xff0D0D0D).withValues(alpha: 0.6),
                      text: "",
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 0.h,
                left: -14.w,
                child: Container(
                  width: 47.w,
                  height: 50.w,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          Assets.img.mainBottomBonus.path,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                          gaplessPlayback: true,
                        ),
                      ),
                      Center(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          key: MainController.to.keyBonusGame,
                          color: Colors.blueAccent.withValues(alpha: 0.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: -20.h,
                right: -30.w,
                child: Container(
                  width: 89.w,
                  height: 83.w,

                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          // key: MainController.to.keyBonusGame,
                          Assets.img.mainBounsGame.path,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                          gaplessPlayback: true,
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
    );
  }
}

class StarFieldBackground extends StatefulWidget {
  const StarFieldBackground({super.key});

  @override
  _StarFieldBackgroundState createState() => _StarFieldBackgroundState();
}

class _StarFieldBackgroundState extends State<StarFieldBackground>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // return AnimatedBackground(
    //   behaviour: RandomParticleBehaviour(
    //     options: ParticleOptions(
    //       baseColor: Colors.white,
    //       spawnOpacity: 0.0,
    //       opacityChangeRate: 0.25,
    //       minOpacity: 0.1,
    //       maxOpacity: 0.4,
    //       particleCount: 200,
    //       spawnMinSpeed: 10.0,
    //       spawnMaxSpeed: 50.0,
    //     ),
    //   ),
    //   vsync: this,
    //   child: Container(),
    // );

    return AnimatedBackground(
      behaviour: SpaceBehaviour(backgroundColor: Colors.transparent),
      vsync: this,
      child: Container(), // 你的内容放这里
    );
  }
}
