import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:shiny_striped_progress_bar/shiny_striped_progress_bar.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_notification/android_notification.dart';
import 'package:slots_132/ss_common/routes.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer_effect.dart';

double scale = 2;

class SSSplassss extends StatefulWidget {
  const SSSplassss({super.key});

  @override
  State<SSSplassss> createState() => _SSSplassssState();
}

class _SSSplassssState extends State<SSSplassss> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SSEventReporttttt.session();
    SSEventReporttttt.install();
    SSEventReporttttt.launch_page();
    SSTzNotificattttt.initForegroundService();
    precashImage();
  }

  precashImage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //

      AssetImage assetImage1 = AssetImage(Assets.img.mainBg.path);
      precacheImage(assetImage1, context);
      AssetImage assetImage2 = AssetImage(Assets.img.wheelZp.path);
      precacheImage(assetImage2, context);

      AssetImage assetImage3 = AssetImage(Assets.img.wheelBg.path);
      precacheImage(assetImage3, context);
      //
      AssetImage assetImage4 = AssetImage(Assets.img.wheelZpF.path);
      precacheImage(assetImage4, context);
      AssetImage assetImage5 = AssetImage(Assets.img.wheelZpF2.path);
      precacheImage(assetImage5, context);
      AssetImage assetImage6 = AssetImage(Assets.img.wheelTitle.path);
      precacheImage(assetImage6, context);
      //
      AssetImage assetImage7 = AssetImage(Assets.img.settiBg.path);
      precacheImage(assetImage7, context);

      AssetImage assetImage8 = AssetImage(Assets.img.giftBg.path);
      precacheImage(assetImage8, context);
      AssetImage assetImage9 = AssetImage(Assets.img.phoneCardBg.path);
      precacheImage(assetImage9, context);

      AssetImage assetImage10 = AssetImage(Assets.img.phonePopupJindu1.path);
      precacheImage(assetImage10, context);

      AssetImage assetImage11 = AssetImage(Assets.img.phonePopupJindu2.path);
      precacheImage(assetImage11, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    // Locale yuyan = ui.window.locale;
    //
    // ssLogggg("======国家：$yuyan。${"update_language".tr}");
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        // systemStatusBarContrastEnforced:true,
        // systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.white,
        child: Stack(
          children: [
            Image.asset(
              Assets.img.splashBg.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            // Container(
            //   width: double.infinity,
            //   height: double.infinity,
            //   color: Colors.green,
            // ),
            Positioned(
              left: 0,
              right: 0,
              top: 30.h,
              child: Column(
                children: [
                  SizedBox(
                    width: 254.h,
                    height: 165.h,
                    child: ShiningEffect(
                      duration: Duration(milliseconds: 5000),
                      shineColor: Color(0xffffffff),
                      opacity: 1,
                      angle: -0.9,
                      topLeft: false,
                      child: Image.asset(
                        Assets.img.splashTitle.path,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                    // child: Container(
                    //   width: double.infinity,
                    //   height: double.infinity,
                    //   color: Colors.green,
                    // ),
                  ),
                  SizedBox(height: 230.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            Assets.img.splashWild.path,
                            width: 151.h,
                            height: 151.h,
                          ),
                          Image.asset(
                            Assets.img.splashTxtExcept.path,
                            width: 158.h,
                            height: 58.h,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            Assets.img.splashScatter.path,
                            width: 151.h,
                            height: 151.h,
                          ),
                          Image.asset(
                            Assets.img.splashTxt345.path,
                            width: 158.h,
                            height: 58.h,
                          ),
                        ],
                      ),
                    ],
                  ),

                  // SizedBox(height: 30.h),
                ],
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 680.h,
              child: Center(
                child: Column(
                  children: [
                    SplashProgress(),
                    // SizedBox(height: 30.h),
                    // SizedBox(
                    //   width: 462.w,
                    //   height: 36.h,
                    //   // child: Image.asset(
                    //   //   Assets.imgB.splashDes.path,
                    //   //   width: double.infinity,
                    //   //   height: double.infinity,
                    //   //   fit: BoxFit.contain,
                    //   // ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SplashProgress extends StatefulWidget {
  const SplashProgress({super.key});

  @override
  State<SplashProgress> createState() => _SplashProgressState();
}

class _SplashProgressState extends State<SplashProgress> {
  double startTime = 0.0;
  late Timer _timer;
  final Duration _delayTime = Duration(milliseconds: _oneTime);
  double _allTime = 10000;
  static const int _oneTime = 100;
  bool canGoToMain = true;
  Timer? _delayTimer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ssLogggg("======= _allTime: $_allTime");
      double count = _allTime / _oneTime;
      _timer = Timer.periodic(_delayTime, (time) {
        // ggPrint("time:${time.tick} =========count:$count");
        int tick = time.tick;

        if (tick > count + 1) {
          _timer.cancel();

          ssLogggg("======= _allTime:$_allTime 计时器: to home");
          canGoToMain = false;
          xiayigeyemina();
        } else {
          setState(() {
            startTime = tick * _oneTime / _allTime;
            if (startTime >= 1) {
              startTime = 1.0;
            }
          });
        }
      });
      aaabbbbChushi();
    });
  }

  aaabbbbChushi() async {
    int time = DateTime.now().millisecondsSinceEpoch;
    ssLogggg("==SSABChange().init start====");
    // // // 5 ab包逻辑
    bool result = await SSABChange().init();
    // int time2 = DateTime.now().millisecondsSinceEpoch;
    // ssLogggg(
    //   "==SSABChange().init end==canGoToMain:$canGoToMain=result:$result=耗时:${time2 - time}",
    // );
    await Future.delayed(Duration(milliseconds:SSABChange.isPackageB()? 3000:0));
    _timer.cancel();
    if (canGoToMain) {
      ssLogggg("==SSABChange().init 等待进入main page====");
      setState(() {
        startTime = 1.0;
      });
      await Future.delayed(Duration(milliseconds: _oneTime * 2));

      xiayigeyemina();
    }
  }

  xiayigeyemina() {
    // JCShijianBaogao.session();
    // JCShijianBaogao.install();
    // JCShijianBaogao.launch_page(kv: JCTzIossssss.clickTz ? "push" : "icon");

    Get.offNamed(SSRouttttt.main);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SSTxtBorder(
          text: "${(startTime * 100.toInt()).toStringAsFixed(0)}%",
          foreground: Color(0xff3D100E),
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          fontColor: Color(0xffF9F7ED),
        ),
        // SizedBox(height: 15.h),
        Container(
          width: 325.w,
          height: 48.h,
          // decoration: BoxDecoration(
          //   color: Color(0xff1B1652),
          //   border: Border.all(color: Color(0xff5CD3F4), width: 1.w),
          //   borderRadius: BorderRadius.circular(50),
          // ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerLeft,
            children: [
              SizedBox(
                width: 325.w,
                height: 15.w,
                child: AnimatedGradientProgressBar2(
                  value: startTime, // 表示 60%
                  gradientColors: [
                    Color(0xffEFFF04),
                    Color(0xffF9B821),
                    Color(0xffF7AA0C),
                    Color(0xffFBD107),
                  ],
                  height: 15.w,
                  borderRadius: BorderRadius.circular(30.w),
                ),
              ),

              AnimatedPositioned(
                duration: Duration(milliseconds: 100),
                top: -20.h,
                bottom: -20.h,
                left: 325.w * startTime - 32.w * (1 - 0),
                child: Image.asset(
                  Assets.img.splashJindu.path,
                  width: 72.w * 1,
                  height: 48.h * 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
    _delayTimer?.cancel();
  }
}

class AnimatedGradientProgressBar extends StatelessWidget {
  final BorderRadius borderRadius;
  final double value; // 当前进度 0.0 ~ 1.0
  final double height;
  final Duration duration;
  final List<Color> gradientColors;

  const AnimatedGradientProgressBar({
    super.key,
    required this.value,
    this.height = 8.0,
    this.duration = const Duration(milliseconds: 100),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.gradientColors = const [Colors.blue, Colors.purple],
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: value.clamp(0.0, 1.0)),
      duration: duration,
      curve: Curves.linear,
      builder: (context, animatedValue, child) {
        return ClipRRect(
          borderRadius: borderRadius,
          child: Container(
            height: height,
            decoration: BoxDecoration(color: Color(0xff633836)),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: animatedValue,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradientColors,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      border: Border.all(color: Color(0xff421614), width: 2.w),
                      borderRadius: BorderRadius.circular(height),
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
}

class AnimatedGradientProgressBar2 extends StatelessWidget {
  final BorderRadius borderRadius;
  final double value; // 当前进度 0.0 ~ 1.0
  final double height;
  final Duration duration;
  final List<Color> gradientColors;

  const AnimatedGradientProgressBar2({
    super.key,
    required this.value,
    this.height = 8.0,
    this.duration = const Duration(milliseconds: 100),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.gradientColors = const [Colors.blue, Colors.purple],
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: value.clamp(0.0, 1.0)),
      duration: duration,
      curve: Curves.linear,
      builder: (context, animatedValue, child) {
        return ClipRRect(
          borderRadius: borderRadius,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: Color(0xff1B1652),
              border: Border.all(color: Color(0xff5CD3F4), width: 1.w),
              borderRadius: BorderRadius.circular(height),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: animatedValue,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    // decoration: BoxDecoration(
                    //   gradient: LinearGradient(
                    //     colors: gradientColors,
                    //     begin: Alignment.topCenter,
                    //     end: Alignment.bottomCenter,
                    //   ),
                    //   border: Border.all(color: Color(0xff5CD3F4), width: 0.w),
                    //   borderRadius: BorderRadius.circular(height),
                    // ),
                    child: ShinyStripedProgressBar(
                      targetProgress: 1,
                      // height: 15.w,
                      duration: Duration(microseconds: 100),
                      progressColor: Color(0xff29BE00),
                      borderRadius: BorderRadius.all(Radius.circular(15.w)),
                      stripeAngle: StripeAngle.angle45,
                      stripeColor: Color(0xff79DD35),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          // Color(0xffffffff).withValues(alpha: 0.3),
                          Color(0xffffffff).withValues(alpha: 0.4),
                          Color(0xffffffff).withValues(alpha: 0.5),
                          Color(0xffffffff).withValues(alpha: 0.4),
                          Color(0xffffffff).withValues(alpha: 0.2),
                          Color(0xffffffff).withValues(alpha: 0.1),
                          Color(0xffffffff).withValues(alpha: 0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      border: Border.all(color: Color(0xff5CD3F4), width: 0.w),
                      borderRadius: BorderRadius.circular(height),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.white.withValues(alpha: 0.4),
                      //     blurRadius: 2,
                      //     spreadRadius: 20,
                      //   ),
                      // ],
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
}

