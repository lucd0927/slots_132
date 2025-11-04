import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_common/routes.dart';
import 'package:slots_132/ss_common/sssssp/spine_sdlr.dart';
import 'package:slots_132/ss_pages/maiiiiii/controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/cycle_roller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer_effect.dart';
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
                    width: 10.w,
                    height: 250.h,
                    child: const SpineShengdaolaoren(),
                  ),
                ),

                Positioned.fill(
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 300),
                    tween: Tween(
                      begin: 0.0,
                      end: MainController.to.showFreeSpin.value ? 0 : 1.0,
                    ),
                    curve: Curves.linear,
                    builder: (context, value, child) {
                      return Transform.translate(
                        // offset: Offset(maxW*(1-value), maxH*(1-value)),
                        offset: Offset(-maxW * (1 - value), 0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 16.w,
                              top: 30.h,
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
                              top: 10.h,
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
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Positioned.fill(
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 300),
                    tween: Tween(
                      begin: 0.0,
                      end: MainController.to.showFreeSpin.value ? 1.0 : 0,
                    ),
                    curve: Curves.linear,
                    builder: (context, value, child) {
                      return Transform.translate(
                        // offset: Offset(maxW*(1-value), maxH*(1-value)),
                        offset: Offset(maxW * (1 - value), 0),
                        child: FreeSpin(),
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

  Column rightWidget() {
    int grandN = 2000;
    int majorN = 1000;
    int miniN = 500;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 120.w,
          height: 62.w,
          child: Stack(
            children: [
              Image.asset(
                Assets.img.mainGrand.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
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
                      text: "${SSCountry.curGuojiaFuhao()}$grandN",
                      fontColor: Color(0xff6AFF00),
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 97.w,
          height: 62.w,
          child: Stack(
            children: [
              Image.asset(
                Assets.img.mainMajor.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
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
                      text: "${SSCountry.curGuojiaFuhao()}$majorN",
                      fontColor: Color(0xff6AFF00),
                      fontSize: 16.sp,
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
              Image.asset(
                Assets.img.mainMini.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
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
                      text: "${SSCountry.curGuojiaFuhao()}$miniN",
                      fontColor: Color(0xff6AFF00),
                      fontSize: 16.sp,
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

  _onBoxGift() {
    Get.toNamed(SSRouttttt.boxGift);
  }

  Column leftWidget() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            ssLogggg("=mainBox==");
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
                ShiningEffect(
                  shineColor: Colors.white,
                  opacity: 0.5,
                  duration: const Duration(seconds: 2),
                  child: Image.asset(
                    Assets.img.mainBox.path,
                    width: 58.h,
                    height: 58.h,
                  ),
                ),
                Positioned(
                  left: -4.w,
                  right: -4.w,
                  bottom: 0,
                  child: Center(child: SSTxtGraBorder(text: "10:10:00")),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),

        GestureDetector(
          onTap: () {
            ssLogggg("=mainPhone==");
          },
          child: Container(
            width: 58.h,
            height: 64.h,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ShiningEffect(
                  shineColor: Colors.white,
                  opacity: 0.5,
                  duration: const Duration(seconds: 2),
                  child: Image.asset(
                    Assets.img.mainPhone.path,
                    width: 58.h,
                    height: 58.h,
                  ),
                ),
                Positioned(
                  left: -10.w,
                  right: -10.w,
                  bottom: 0,
                  child: Center(child: SSTxtGraBorder(text: "10:10:00")),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FreeSpin extends StatefulWidget {
  const FreeSpin({super.key});

  @override
  State<FreeSpin> createState() => _FreeSpinState();
}

class _FreeSpinState extends State<FreeSpin> {
  int select = -1;
  double scale = 1.5;
  Timer? timer;
  double firstH = 40.h;
  double secondH = 90.h;
  double thirdH = 120.h;
  double fourthH = 90.h;
  double fiveH = 40.h;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
  }

  freeSpinWidget() {
    double leftW = 0.w;
    double itemW = (ScreenUtil().screenWidth - leftW * 2) / 5.2;
    double alpha = 0.0;

    return GestureDetector(
      onTap: () {
        ssLogggg("====fress spin=");
        timer?.cancel();
        timer = Timer.periodic(Duration(milliseconds: 70), (v) {
          int tmpT = v.tick;

          if (tmpT > 50) {
            v.cancel();
            setState(() {
              secondH = 70.h;
            });
            Future.delayed(Duration(milliseconds: 5000), () {
              setState(() {
                reset();
              });
            });
          } else {
            setState(() {
              if (select == -1) {
                select = 0;
              } else if (select == 0) {
                select = 1;
              } else if (select == 1) {
                select = 2;
              } else if (select == 2) {
                select = 3;
              } else if (select == 3) {
                select = 4;
              } else {
                select = -1;
              }
            });
          }
        });
      },
      child: Container(
        width: double.infinity,
        // height: double.infinity,
        margin: EdgeInsets.only(top: 20.h, left: leftW, right: leftW),
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
  }

  childI({required String icon, required int index}) {
    bool hasSelect = index == select;
    double tmpScale = hasSelect ? scale : 1;
    // tmpScale = 1;
    double childIW = 46.h * tmpScale;
    double childIH = 58.h * tmpScale;
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
