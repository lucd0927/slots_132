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
import 'package:slots_132/jc_gj/jc_widget/pb_tushi.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_common/model/gift_reward_model.dart';
import 'package:slots_132/ss_common/routes.dart';
import 'package:slots_132/ss_common/sssssp/spine_sdlr.dart';
import 'package:slots_132/ss_pages/box_gift/overlay_boxgift.dart';
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
                            top: 60.h,
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
                            top: 4.h,
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
                        fontFamily: FontFamily.alkatra,
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
                      fontFamily: FontFamily.alkatra,
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
                      fontFamily: FontFamily.alkatra,
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
    int time = HomeBoxTimeState().shengyuTime();
    bool showTime = MainController.to.showBoxTime.value;
    ssLogggg("=_onBoxGift==time:$time showTime:$showTime");

    if (time > 0) {
      ssTushi(text: "Please wait!");
    }else{
      SSEventReporttttt.home_page_gift();
      OverlayBoxgift().show();
    }
  }

  Widget leftWidget() {
    return Obx((){
      bool showTime = MainController.to.showBoxTime.value;
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              _onBoxGift();
            },
            child: Container(
              width: 58.h,
              height: 64.h,
              // clipBehavior: Clip.none,
              color: Colors.red.withValues(alpha: 0),
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
                    right: -4.w,
                    bottom: 4.h,
                    child: Center(child:showTime? HomeBoxTime():const SizedBox()),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),

          GestureDetector(
            onTap: () {
              ssLogggg("=mainPhone==");
              onPhoneClick();
            },
            child: Obx(() {
              int card = PhoneCardController.to.collectCardNum.value;
              return Container(
                width: 58.h,
                height: 64.h,
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
                      right: -10.w,
                      bottom: 4.h,
                      child: Center(
                        child: SSTxtGraBorder(
                          text:
                          "$card/${PhoneCardController.to.durations.length}",
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          strokeColor: Color(0xff30120A),
                          fontFamily: FontFamily.alkatra,
                        ),
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

  onStar({required ValueChanged<EnumGiftRewardModel> onEnd}) {
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
            tmpEnumGiftRewardModel = EnumGiftRewardModel.spin;
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
            tmpEnumGiftRewardModel = EnumGiftRewardModel.spin;
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
            if (select < 0) {
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
                  Container(
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
                  ),
                  Container(
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
                  ),
                  Container(
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
                  ),
                  Container(
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
            spreadRadius: 5,
          ),
        ],
      ),
      child: Image.asset(
        icon,
        width: childIW,
        height: childIH,
        gaplessPlayback: true,
      ),
    );

    return child;
  }
}

class HomeBoxTime extends StatefulWidget {
  const HomeBoxTime({super.key});

  @override
  State<HomeBoxTime> createState() => HomeBoxTimeState();
}

class HomeBoxTimeState extends State<HomeBoxTime> {
  static const hkTime = "4aef6hfh2j69";
  Timer? _timer;
  var box = SSHive.box;
  // int maxSeconds = 60 * 60 * 8;
  int maxSeconds = 60*2 ;
  String text = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initTimer();
  }

  int shengyuTime() {
    int mill = DateTime.now().millisecondsSinceEpoch;
    var tmpData = box.get(hkTime) ?? {"count": 0, "time": mill};
    int time = tmpData['time'];
    saveTime(time);
    // 过了多少时间
    int diff = mill - time;
    // 剩下多少时间
    int shengyu = ((maxSeconds * 1000 - diff) / 1000).toInt();
    if(shengyu <=0 ){
      shengyu = 0;
    }
    return shengyu;
  }

  resetTime(){
    int mill = DateTime.now().millisecondsSinceEpoch;
    saveTime(mill);
    ssLogggg("====== cresetTime:$mill");
  }

  _initTimer() {
    int shengyu = shengyuTime();
    ssLogggg("====_initTimer=shengyu:$shengyu");
    text = formatDuration(shengyu);
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int tick = timer.tick;
      int  shengyu = shengyuTime();
      int seconds = shengyu;
      if (shengyu <= 0) {
        setState(() {
          text = formatDuration(seconds);
        });
        MainController.to.showBoxTime.value = false;
        _timer?.cancel();
      }
      if (mounted) {
        setState(() {
          text = formatDuration(seconds);
        });
      }
    });
  }

  saveTime(int time) {
    box.put(hkTime, {"time": time});
  }

  String formatDuration(int seconds) {
    if (seconds <= 0) {
      return "";
    }

    Duration duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String secs = twoDigits(duration.inSeconds.remainder(60));

    return '$hours:$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return SSTxtGraBorder(
      text: text,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      strokeColor: Color(0xff30120A),
      fontFamily: FontFamily.alkatra,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }
}
