import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/hero_fly/hero_fly.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_tushi.dart';
import 'package:slots_132/jc_gj/jc_widget/shake.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_common/model/gift_reward_model.dart';
import 'package:slots_132/ss_common/routes.dart';
import 'package:slots_132/ss_common/sssssp/spine_freespin_xuanggg.dart';
import 'package:slots_132/ss_common/sssssp/spine_hand.dart';
import 'package:slots_132/ss_common/sssssp/spine_sdlr.dart';
import 'package:slots_132/ss_pages/box_gift/overlay_boxgift.dart';
import 'package:slots_132/ss_pages/daily_bonus/daily_bonus.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/cycle_roller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer_effect.dart';
import 'package:slots_132/ss_pages/phone_card/phone_card_controller.dart';
import 'glow_border/glow_border.dart';

class CenterView extends StatelessWidget {
  const CenterView({super.key});

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    //   return centerWidget();
    // });
    return centerWidget();
  }

  centerWidget() {
    return LayoutBuilder(
      builder: (context, c) {
        double maxH = c.maxHeight;
        double maxW = c.maxWidth;
        ssLogggg("===maxH:${maxH / 1.h}=maxW:$maxW");
        return Obx(() {
          return Container(
            width: double.infinity,
            // height: 200.h,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 20.w,
                  top: 40.h,
                  right: 20.w,
                  child: Container(
                    key: ValueKey("SpineShengdaolaoren"),
                    // width: 10.w,
                    height: 250.h,
                    child: const SpineShengdaolaoren(
                      key: ValueKey("ooeirtjtjkl"),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 300),
                    tween: Tween(
                      begin: 0.0,
                      end: MainController.to.curShowFreeSpin.value ? 0 : 1.0,
                    ),
                    curve: Curves.linear,
                    builder: (context, value, child) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 16.w,
                            top: 40.h,
                            child: AnimatedCrossFade(
                              firstChild: leftWidget(),
                              secondChild: SizedBox(width: 58.h, height: 64.h),
                              crossFadeState:
                                  MainController.to.curShowFreeSpin.value
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              duration: Duration(milliseconds: 200),
                            ),
                            // child: leftWidget(),
                          ),
                          Positioned(
                            right: 0,
                            top: 40.h,
                            child: AnimatedCrossFade(
                              firstChild: rightWidget(),
                              secondChild: SizedBox(width: 58.h, height: 64.h),
                              crossFadeState:
                                  MainController.to.curShowFreeSpin.value
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              duration: Duration(milliseconds: 200),
                            ),
                            // child: rightWidget(),
                          ),

                          Positioned(
                            left: 0,
                            right: 0,
                            top: 8.h,
                            child: Center(
                              child: MainController.to.curShowFreeSpin.value
                                  ? const SizedBox()
                                  : centerCollectStarWidget(),
                            ),
                            // child: Center(
                            //   child: AnimatedCrossFade(
                            //     firstChild: Container(
                            //       width: 280.h,
                            //       height: 30.h,
                            //       child:centerCollectStarWidget(),
                            //     ),
                            //     secondChild: SizedBox(
                            //       width: 58.h,
                            //       height: 2.h,
                            //     ),
                            //     crossFadeState:
                            //         MainController.to.showFreeSpin.value
                            //         ? CrossFadeState.showSecond
                            //         : CrossFadeState.showFirst,
                            //     duration: Duration(milliseconds: 200),
                            //   ),
                            // ),
                          ),
                        ],
                      );

                      return Transform.translate(
                        // offset: Offset(maxW*(1-value), maxH*(1-value)),
                        offset: Offset(-maxW * (1 - value), 0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 16.w,
                              top: 60.h,
                              // child: AnimatedCrossFade(
                              //   firstChild: leftWidget(),
                              //   secondChild: SizedBox(
                              //     width: 58.h,
                              //     height: 64.h,
                              //   ),
                              //   crossFadeState:
                              //       MainController.to.showFreeSpin.value
                              //       ? CrossFadeState.showSecond
                              //       : CrossFadeState.showFirst,
                              //   duration: Duration(milliseconds: 200),
                              // ),
                              child: leftWidget(),
                            ),
                            Positioned(
                              right: 0,
                              top: 40.h,
                              // child: AnimatedCrossFade(
                              //   firstChild: rightWidget(),
                              //   secondChild: SizedBox(
                              //     width: 58.h,
                              //     height: 64.h,
                              //   ),
                              //   crossFadeState:
                              //       MainController.to.showFreeSpin.value
                              //       ? CrossFadeState.showSecond
                              //       : CrossFadeState.showFirst,
                              //   duration: Duration(milliseconds: 200),
                              // ),
                              child: rightWidget(),
                            ),

                            Positioned(
                              left: 0,
                              right: 0,
                              top: 4.h,
                              child: Center(child: centerCollectStarWidget()),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Positioned.fill(
                  top: 30.h,
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 400),
                    tween: Tween(
                      begin: 0.0,
                      end: MainController.to.curShowFreeSpin.value ? 1.0 : 0,
                    ),
                    curve: Curves.linear,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, maxH * (1 - value)),
                        // offset: Offset(maxW * (1 - value), 0),
                        child: FreeSpin(key: MainController.to.keyFreeSpin),
                      );
                    },
                  ),
                ),

                // Positioned.fill(
                //   child: Container(
                //     width: double.infinity,
                //     height: double.infinity,
                //     // color: Colors.white,
                //
                //     child: AnimatedBuilder(animation: animation, builder: builder),
                //
                //     // child: AnimatedCrossFade(
                //     //   firstChild: SizedBox(width: 58.h, height: 64.h),
                //     //   secondChild: FreeSpin(),
                //     //   crossFadeState: MainController.to.showFreeSpin.value
                //     //       ? CrossFadeState.showSecond
                //     //       : CrossFadeState.showFirst,
                //     //   secondCurve: Curves.linear,
                //     //   duration: Duration(milliseconds: 200),
                //     // ),
                //   ),
                // ),
              ],
            ),
          );
        });
      },
    );
  }

  centerCollectStarWidget() {
    return GestureDetector(
      onTap: () {
        _onStarGift();
      },
      child: Container(
        width: 280.h,
        height: 32.h,
        color: Colors.black.withValues(alpha: 0),
        child: Stack(
          children: [
            Image.asset(
              Assets.img.mainCollect.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              gaplessPlayback: true,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 3.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SSTxtGraBorder(
                    text: "COLLECT 32",
                    fontSize: 20.sp,
                    strokeColor: Color(0xffD83507),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.sp),
                    child: Image.asset(
                      key: MainController.to.keyCenterJinling,
                      Assets.img.slots.slotsH1.path,
                      width: 22.h,
                      height: 22.h,
                      gaplessPlayback: true,
                    ),
                  ),
                  SSTxtGraBorder(
                    text: "TO",
                    fontSize: 20.sp,
                    strokeColor: Color(0xffD83507),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.sp),
                    child: Image.asset(
                      Assets.img.phonePopupJindu2Star.path,
                      width: 22.h,
                      height: 22.h,
                      gaplessPlayback: true,
                    ),
                  ),
                  SSTxtGraBorder(
                    text: "WIN",
                    fontSize: 20.sp,
                    strokeColor: Color(0xffD83507),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column rightWidget() {
    double grandN = MainController.jacktopGrand;
    double majorN = MainController.jacktopMajor;
    double miniN = MainController.jacktopMini;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          child: Container(
            width: 120.w,
            height: 62.w,
            child: Stack(
              children: [
                // Shimmer(
                //   gradient: LinearGradient(
                //     colors: [
                //       Colors.transparent,
                //       Colors.yellow.withValues(alpha: 0.1),
                //       Colors.yellow.withValues(alpha: 1),
                //       Colors.yellow.withValues(alpha: 0.1),
                //       Colors.transparent,
                //     ],
                //     stops: [0, 0.44, 0.5, 0.54, 1],
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomRight,
                //   ),
                ShiningEffect(
                  shineColor: Colors.yellow,
                  opacity: 1,
                  angle: 2.5,
                  // duration: Duration(seconds: 2),
                  child: Image.asset(
                    Assets.img.mainGrand.path,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                    gaplessPlayback: true,
                  ),
                ),
                Positioned(
                  top: 20.h,
                  bottom: 18.h,
                  left: 16.w,
                  right: 0,
                  child: Container(
                    color: Colors.blueAccent.withValues(alpha: 0.0),
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: SSTxtBorder(
                        text:
                            "${SSCountry.curGuojiaFuhao()}${grandN.toStringAsFixed(0)}",
                        fontColor: Color(0xff6AFF00),
                        fontSize: 16.sp,
                        fontFamily: FontFamily.ghostKidAOEPro,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 97.w,
          height: 62.w,
          child: Stack(
            children: [
              ShiningEffect(
                shineColor: Colors.yellow,
                opacity: 1,
                angle: 2.5,
                child: Image.asset(
                  Assets.img.mainMajor.path,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                  gaplessPlayback: true,
                ),
              ),
              Positioned(
                top: 20.h,
                bottom: 18.h,
                left: 16.w,
                right: 0,
                child: Container(
                  color: Colors.blueAccent.withValues(alpha: 0.0),
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: SSTxtBorder(
                      text:
                          "${SSCountry.curGuojiaFuhao()}${majorN.toStringAsFixed(0)}",
                      fontColor: Color(0xff6AFF00),
                      fontSize: 16.sp,
                      fontFamily: FontFamily.ghostKidAOEPro,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 94.w,
          height: 62.w,
          child: Stack(
            children: [
              ShiningEffect(
                shineColor: Colors.yellow,
                opacity: 1,
                angle: 2.5,
                child: Image.asset(
                  Assets.img.mainMini.path,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                  gaplessPlayback: true,
                ),
              ),
              Positioned(
                top: 20.h,
                bottom: 18.h,
                left: 30.w,
                right: 0,
                child: Container(
                  color: Colors.red.withValues(alpha: 0),
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: SSTxtBorder(
                      text:
                          "${SSCountry.curGuojiaFuhao()}${miniN.toStringAsFixed(0)}",
                      fontColor: Color(0xff6AFF00),
                      fontSize: 16.sp,
                      fontFamily: FontFamily.ghostKidAOEPro,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _onStarGift() {
    SSEventReporttttt.home_page_star();
    Get.toNamed(SSRouttttt.starGift);
  }

  _onBoxGift() {
    SSEventReporttttt.home_page_gift();
    OverlayBoxgift().show();
  }

  Widget leftWidget() {
    return Obx(() {
      bool showTime = MainController.to.showBoxTime.value;
      String text = MainController.to.textBoxGiftTime.value;
      // ssLogggg("======txt:$text");
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              OverlayDailyBonus().show(showAddMoney: false);
            },
            child: SSHuangdongWidget(
              mode: ShakeMode.rotate,
              offset: 8,
              child: Container(
                width: 58.h + 50.h,
                height: 64.h,
                // clipBehavior: Clip.none,
                color: Colors.red.withValues(alpha: 0.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(58.h),
                      child: ShiningEffect(
                        shineColor: Colors.yellow,
                        opacity: 1,
                        angle: 1.8,
                        // topLeft: false,
                        duration: const Duration(seconds: 2),
                        child: Image.asset(
                          Assets.img.mianDaily.path,
                          width: 58.h,
                          height: 58.h,
                          gaplessPlayback: true,
                        ),
                      ),
                    ),
                    Positioned(
                      left: -4.w,
                      right: 46.w,
                      bottom: 4.h,
                      child: Center(
                        child: SSTxtGraBorder(
                          text: "Daily\nRewards",
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          strokeColor: Color(0xff30120A),
                          // fontFamily: FontFamily.alkatra,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 0.h),

          GestureDetector(
            onTap: () {
              _onBoxGift();
            },
            child: Container(
              width: 58.h + 50.h,
              height: 64.h,
              // clipBehavior: Clip.none,
              color: Colors.red.withValues(alpha: 0.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(58.h),
                    child: ShiningEffect(
                      shineColor: Colors.yellow,
                      opacity: 1,
                      angle: 1.8,
                      // topLeft: false,
                      duration: const Duration(seconds: 2),
                      child: Image.asset(
                        Assets.img.mainBox.path,
                        width: 58.h,
                        height: 58.h,
                        gaplessPlayback: true,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -4.w,
                    right: 46.w,
                    bottom: 4.h,
                    child: Center(
                      child: showTime
                          ? SSTxtGraBorder(
                              text: text,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              strokeColor: Color(0xff30120A),
                              // fontFamily: FontFamily.alkatra,
                            )
                          : const SizedBox(),
                    ),
                  ),
                  if (MainController.to.textBoxGiftTime.value.isEmpty)
                    Positioned(
                      right: 10.w,
                      top: 10.h,
                      // left: -50.w,
                      child: Container(
                        width: 100.h,
                        height: 60.h,
                        // color: Colors.yellow,
                        child: const SpineHand(),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 0.h),

          GestureDetector(
            onTap: () {
              ssLogggg("=mainPhone==");
              onPhoneClick();
            },
            child: Obx(() {
              int card = PhoneCardController.to.collectCardNum.value;
              return Container(
                width: 58.h + 50.h,
                height: 64.h,
                // clipBehavior: Clip.none,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(58.h),
                      child: ShiningEffect(
                        shineColor: Colors.yellow,
                        opacity: 1,
                        angle: 1.8,
                        duration: const Duration(seconds: 2),
                        child: Hero(
                          tag: "Phoneeee",
                          child: Image.asset(
                            key: MainController.to.keyPhoneSpice,
                            Assets.img.mainPhone.path,
                            width: 58.h,
                            height: 58.h,
                            gaplessPlayback: true,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -10.w,
                      right: 40.w,
                      bottom: 4.h,
                      child: Center(
                        child: SSTxtGraBorder(
                          text:
                              "$card/${PhoneCardController.to.durations.length}",
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          strokeColor: Color(0xff30120A),
                          // fontFamily: FontFamily.alkatra,
                        ),
                      ),
                    ),
                    if (PhoneCardController.to.canClickClaim.value)
                      Positioned(
                        right: 10.w,
                        top: 10.h,
                        // left: -50.w,
                        child: Container(
                          width: 100.h,
                          height: 60.h,
                          // color: Colors.yellow,
                          child: const SpineHand(),
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),
        ],
      );
    });
  }

  onPhoneClick() {
    SSEventReporttttt.home_page_phone();
    Get.toNamed(SSRouttttt.phoneCardPage);
  }
}

class FreeSpin extends StatefulWidget {
  const FreeSpin({super.key});

  @override
  State<FreeSpin> createState() => FreeSpinState();
}

class FreeSpinState extends State<FreeSpin> {
  int select = -1;
  double scale = 1.5;
  Timer? timer;
  double firstH = 40.w;
  double secondH = 90.w;
  double thirdH = 110.w;
  double fourthH = 90.w;
  double fiveH = 40.w;

  bool hasQianjin = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ssLogggg("====free spin=initState");
  }

  @override
  Widget build(BuildContext context) {
    return freeSpinWidget();
  }

  reset() {
    select = -1;
    scale = 1.5;
    timer?.cancel();
    firstH = 40.h;
    secondH = 90.h;
    thirdH = 120.h;
    fourthH = 90.h;
    fiveH = 40.h;
    hasQianjin = true;
  }

  Map<int, Offset> _kFreespinIndex_vWidgetContextOffset = {};
  Map<int, BuildContext> _kFreespinIndex_vWidgetContext = {};

  onStar({required ValueChanged<EnumGiftRewardModel> onEnd}) {
    timer?.cancel();
    List<int> randoms = [10, 11, 12, 13, 14];
    int tickkk1 = randoms[Random().nextInt(randoms.length)];
    ssLogggg("====free spin=tickkk1:$tickkk1");
    int mills = 250;
    timer = Timer.periodic(Duration(milliseconds: mills), (v) {
      int tmpT = v.tick;

      if (tmpT == tickkk1) {
        // await Future.delayed(Duration(milliseconds: 1000));
        EnumGiftRewardModel tmpEnumGiftRewardModel = EnumGiftRewardModel.cash;
        setState(() {
          if (tmpT == 40) {
            select = 0;
            firstH = 30.h;
            tmpEnumGiftRewardModel = EnumGiftRewardModel.freespin;
          } else if (tmpT == 41) {
            select = 1;
            secondH = 70.h;
            tmpEnumGiftRewardModel = EnumGiftRewardModel.cash;
          } else if (tmpT == 42) {
            select = 2;
            thirdH = 110.h;
          } else if (tmpT == 43) {
            select = 3;
            fourthH = 70.h;
            tmpEnumGiftRewardModel = EnumGiftRewardModel.freespin;
          } else if (tmpT == 44) {
            select = 4;
            fiveH = 30.h;
            tmpEnumGiftRewardModel = EnumGiftRewardModel.cash;
          }
        });

        v.cancel();
        Future.delayed(Duration(milliseconds: 1200), () {
          setState(() {
            reset();
            onEnd(tmpEnumGiftRewardModel);
          });
        });
      } else {
        if (hasQianjin) {
          select++;
          if (select >= 4) {
            hasQianjin = false;
          }
        } else {
          select--;
          if (select <= 0) {
            hasQianjin = true;
          }
        }
        ssLogggg(
          "====free spin=tickkk1 tmpT:$tmpT select:$select tickkk1:$tickkk1",
        );
        // Widget heroChild = Image.asset(Assets.img.xuanguang2.path);
        Widget heroChild = Image.asset(Assets.img.huoqiu.path);
        // Widget heroChild = SpineFreespinXuanggg();
        OverlayFly2TargetKey().showWithSize(
          childSize: Size(20.w, 20.w),
          targetContext: _kFreespinIndex_vWidgetContext[select]!,
          topLeftOffset: Offset(100.w, 230.h),
          heroChild: heroChild,
          count: 8,
          animTime: Duration(milliseconds: mills),
        );
      }
    });
  }

  onStar2({required ValueChanged<EnumGiftRewardModel> onEnd}) {
    timer?.cancel();
    List<int> randoms = [40, 41, 43, 44];
    int tickkk1 = randoms[Random().nextInt(randoms.length)];
    ssLogggg("====free spin=tickkk1:$tickkk1");
    timer = Timer.periodic(Duration(milliseconds: 60), (v) {
      int tmpT = v.tick;

      if (tmpT == tickkk1) {
        EnumGiftRewardModel tmpEnumGiftRewardModel = EnumGiftRewardModel.cash;
        setState(() {
          if (tmpT == 40) {
            select = 0;
            firstH = 30.h;
            tmpEnumGiftRewardModel = EnumGiftRewardModel.freespin;
          } else if (tmpT == 41) {
            select = 1;
            secondH = 70.h;
            tmpEnumGiftRewardModel = EnumGiftRewardModel.cash;
          } else if (tmpT == 42) {
            select = 2;
            thirdH = 110.h;
          } else if (tmpT == 43) {
            select = 3;
            fourthH = 70.h;
            tmpEnumGiftRewardModel = EnumGiftRewardModel.freespin;
          } else if (tmpT == 44) {
            select = 4;
            fiveH = 30.h;
            tmpEnumGiftRewardModel = EnumGiftRewardModel.cash;
          }
        });

        v.cancel();
        Future.delayed(Duration(milliseconds: 1000), () {
          setState(() {
            reset();
            onEnd(tmpEnumGiftRewardModel);
          });
        });
      } else {
        setState(() {
          if (hasQianjin) {
            select++;
            if (select > 4) {
              hasQianjin = false;
            }
          } else {
            select--;
            if (select <= 0) {
              hasQianjin = true;
            }
          }

          //
          // if (select == -1) {
          //   select = 0;
          // } else if (select == 0) {
          //   select = 1;
          // } else if (select == 1) {
          //   select = 2;
          // } else if (select == 2) {
          //   select = 3;
          // } else if (select == 3) {
          //   select = 4;
          // } else {
          //   select = -1;
          // }
        });
      }
    });
  }

  setFreespinContext(BuildContext context, int index) {
    _kFreespinIndex_vWidgetContext[index] = context;
  }

  freeSpinWidget() {
    double leftW = 0.w;
    double itemW = (ScreenUtil().screenWidth - leftW * 2) / 5.2;
    double alpha = 0.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          // onTap: onStar,
          child: Container(
            width: double.infinity,
            // height: double.infinity,
            margin: EdgeInsets.only(top: 10.w, left: leftW, right: leftW),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) {
                      MainController.to.setFreespinContext(context, 0);
                      // setFreespinContext(context, 0);
                      return Container(
                        width: itemW,
                        color: Colors.yellow.withValues(alpha: alpha),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // SizedBox(height: firstH),
                            AnimatedContainer(
                              height: firstH,
                              duration: Duration(milliseconds: 100),
                            ),
                            childI(icon: Assets.img.mainCWheel.path, index: 0),
                          ],
                        ),
                      );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      MainController.to.setFreespinContext(context, 1);
                      // setFreespinContext(context, 1);
                      return Container(
                        width: itemW,
                        color: Colors.green.withValues(alpha: alpha),
                        child: Column(
                          children: [
                            // SizedBox(height: secondH),
                            AnimatedContainer(
                              height: secondH,
                              duration: Duration(milliseconds: 100),
                            ),
                            childI(icon: Assets.img.mainCMoney.path, index: 1),
                          ],
                        ),
                      );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      MainController.to.setFreespinContext(context, 2);
                      // setFreespinContext(context, 2);
                      return Container(
                        width: itemW,
                        color: Colors.red.withValues(alpha: alpha),
                        child: Column(
                          children: [
                            // SizedBox(height: thirdH),
                            AnimatedContainer(
                              height: thirdH,
                              duration: Duration(milliseconds: 100),
                            ),
                            childI(icon: Assets.img.mainCAvatar.path, index: 2),
                          ],
                        ),
                      );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      MainController.to.setFreespinContext(context, 3);
                      // setFreespinContext(context, 3);
                      return Container(
                        width: itemW,
                        color: Colors.green.withValues(alpha: alpha),
                        child: Column(
                          children: [
                            // SizedBox(height: fourthH),
                            AnimatedContainer(
                              height: fourthH,
                              duration: Duration(milliseconds: 100),
                            ),
                            childI(icon: Assets.img.mainCWheel.path, index: 3),
                          ],
                        ),
                      );
                    },
                  ),
                  Container(
                    width: itemW,
                    color: Colors.yellow.withValues(alpha: alpha),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: fiveH),
                        AnimatedContainer(
                          height: fiveH,
                          duration: Duration(milliseconds: 100),
                        ),
                        childI(icon: Assets.img.mainCMoney.path, index: 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  childI({required String icon, required int index}) {
    bool hasSelect = index == select;
    double tmpScale = hasSelect ? scale : 1;
    tmpScale = 1;
    double childIW = 46.w * tmpScale;
    double childIH = 58.w * tmpScale;
    double glowOpacity = hasSelect ? 1.0 : 0.0;
    // return  TweenAnimationBuilder<double>(
    //   duration: const Duration(milliseconds: 200),
    //   tween: Tween(begin: 1.0, end: scale),
    //   curve: Curves.easeOutBack,
    //   builder: (context, value, child) {
    //     return AnimatedContainer(
    //       duration: const Duration(milliseconds: 150),
    //       decoration: BoxDecoration(
    //         shape: BoxShape.circle,
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.white.withOpacity(glowOpacity * 0.8),
    //             blurRadius: 15,
    //             spreadRadius: 2,
    //           ),
    //         ],
    //       ),
    //       child: Center(
    //         child: Image.asset(
    //           icon,
    //           width: childIW,
    //           height: childIH,
    //           gaplessPlayback: true,
    //         ),
    //       ),
    //     );
    //   },
    // );

    Widget child = Container(
      // duration: Duration(milliseconds: 200),
      // width: childIW,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: glowOpacity * 1),
            blurRadius: 15,
            spreadRadius: 20,
          ),
        ],
      ),
      child: Builder(
        builder: (context) {
          setFreespinContext(context, index);
          return Image.asset(
            icon,
            width: childIW,
            height: childIH,
            gaplessPlayback: true,
          );
        },
      ),
    );

    return child;
  }
}
