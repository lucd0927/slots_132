import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/denglugengzhong.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/check_image_reveal.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_tushi.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_common/model/gift_reward_model.dart';
import 'package:slots_132/ss_common/routes.dart';
import 'package:slots_132/ss_common/sssssp/spine_hand.dart';
import 'package:slots_132/ss_pages/daily_bonus/daily_bonus_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer.dart';

class OverlayDailyBonus {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show({required bool showAddMoney}) {
    Get.toNamed(SSRouttttt.dailyBonus);
    return;

    // if (_isShowing) return;
    _overlay = null;
    SSEventReporttttt.sign_page();
    _overlay = OverlayEntry(
      builder: (context) {
        return DailyBonus(
          onClose: () {
            close();
            return;
            if (!showAddMoney) {
              return;
            }

            int continueDays = DailyBonusController.to.continueLoginDays.value;
            GiftRewardModel? giftRewardModel =
                DailyBonusController.kDay_vGiftModel[continueDays];
            EnumGiftRewardModel? rewardModelType =
                giftRewardModel?.rewardModelType;

            double money = 0;

            if (rewardModelType == EnumGiftRewardModel.cash) {
              money = (giftRewardModel?.num ?? 0) * 1.0;
            }

            MainController.to.onAddMoney(money, showMoneyAnimated: true);
          },
        );
      },
    );
    Overlay.of(Get.context!).insert(_overlay!);
    _isShowing = true;
  }

  void close() {
    _isShowing = false;
    _overlay?.remove();
    _overlay = null;
  }
}

class DailyBonus extends StatefulWidget {
  const DailyBonus({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<DailyBonus> createState() => _DailyBonusState();
}

class _DailyBonusState extends State<DailyBonus> {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);

  // bool showCheckOk = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
        });
        // Future.delayed(Duration(milliseconds: 300), () {
        //   if (mounted) {
        //     setState(() {
        //       showCheckOk = true;
        //     });
        //   }
        // });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        return Material(
          color: Colors.transparent,
          child: AnimatedContainer(
            duration: animD,
            color: Colors.black.withValues(alpha: showAnimated ? 0.7 : 0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blueAccent.withValues(alpha: 0.0),
              child: Stack(
                children: [
                  Image.asset(
                    Assets.img.dailyBonusBg.path,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                    gaplessPlayback: true,
                  ),
                  AnimatedScale(
                    duration: animD,
                    // offset: showAnimated ? Offset.zero : Offset(0, 1),
                    scale: showAnimated ? 1.0 : 0.8,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.blueAccent.withValues(alpha: 0.0),
                      child: Column(
                        children: [
                          SizedBox(height: 50.h),
                          topWidget(),
                          SizedBox(height: 24.h),
                          buildCenterWidget(),
                          SizedBox(height: SSABChange.isPackageB()?24.h:12.h),
                          bottomWidget(),
                          SizedBox(height: 4.h),
                          Container(height: 40.h, child: DailyBonusBottomTime()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildCenterWidget() {
    return Wrap(
      spacing: 10.w,
      runSpacing: 12.h,
      children: [
        centerItemDayView(
          day: 1,
          gift: DailyBonusController.kDay_vGiftModel[1]!,
        ),
        centerItemDayView(
          day: 2,
          gift: DailyBonusController.kDay_vGiftModel[2]!,
        ),
        centerItemDayView(
          day: 3,
          gift: DailyBonusController.kDay_vGiftModel[3]!,
        ),
        centerItemDayView(
          day: 4,
          gift: DailyBonusController.kDay_vGiftModel[4]!,
        ),
        centerItemDayView(
          day: 5,
          gift: DailyBonusController.kDay_vGiftModel[5]!,
        ),
        centerItemDayView(
          day: 6,
          gift: DailyBonusController.kDay_vGiftModel[6]!,
        ),
      ],
    );
  }

  centerItemDayView({required int day, required GiftRewardModel gift}) {
    String centerImg = gift.img;
    String money = "+${gift.num.toStringAsFixed(0)}";
    if (gift.rewardModelType == EnumGiftRewardModel.cash) {
      money = "+${SSCountry.curGuojiaFuhao()}${gift.num.toStringAsFixed(0)}";
    } else if (gift.rewardModelType == EnumGiftRewardModel.xp) {
      money = "x${gift.num.toStringAsFixed(0)}";
    }

    int continueDays = DailyBonusController.to.continueLoginDays.value;
    bool hasGet = false;
    if (continueDays > day) {
      hasGet = true;
    } else if (continueDays == day) {
      hasGet = true;
    }
    double imgW = 60.w;
    double imgH = 40.h;

    if (day == 3) {
      imgW = 100.w;
      imgH = 50.h;
    }
    bool showCheckOk = DailyBonusController.to.todayClickBonus.value;
    bool shouwHand = continueDays == day && !showCheckOk;
    bool showShimmer = hasGet;

    Widget child = Container(
      width: 159.w,
      height: 91.h,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            Assets.img.dailyBonusDayBg.path,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 12.h,
            left: 12.w,
            child: Transform.rotate(
              angle: -30 * pi / 180,
              child: SSTxtBorder(
                text: "Day $day",
                fontSize: 10.sp,
                fontColor: Color(0xffFFDC16),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              Image.asset(centerImg, width: imgW, height: imgH),
              SSTxtGraBorder(
                text: money,
                fontFamily: FontFamily.ghostKidAOEPro,
                gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: [
                    Color(0xff0FFF63),
                    Color(0xffA4F00D),
                    Color(0xffD0FF00),
                    Color(0xff00FF1E),
                  ],
                ),
                fontSize: 18.sp,
                strokeColor: Color(0xff0C402B),
              ),
            ],
          ),

          showShimmer
              ? shouwHand
                    ? Positioned(
                        right: -20.w,
                        top: 40.h,

                        child: Center(
                          child: SizedBox(
                            width: 65.h,
                            height: 72.h,
                            child: const SpineHand(),
                          ),
                        ),
                      )
                    : Container(
                        width: 159.w,
                        height: 91.h,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.2),
                        ),
                        child: Center(
                          child: CheckImageReveal(
                            child: Shimmer(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.white.withValues(alpha: 0.1),
                                  Colors.white.withValues(alpha: 1),
                                  Colors.white.withValues(alpha: 0.1),
                                  Colors.transparent,
                                ],
                                stops: [0, 0.44, 0.5, 0.54, 1],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              child: Image.asset(
                                Assets.img.dailyBonusOk.path,
                                width: 54.h,
                                height: 54.h,
                              ),
                            ),
                            // child: Assets.img.dailyBonusOk.path,
                          ),
                        ),
                      )
              : const SizedBox(),
        ],
      ),
    );

    return GestureDetector(
      onTap: () {
        if (shouwHand) {
          DailyBonusController.to.onClick(gift, () {
            onClose();
          });
        } else {
          String txt = "daily_bouns_1".tr;
          if (showShimmer) {
            txt = "daily_bouns_2".tr;
          }
          ssTushi(text: txt);
        }
      },
      child: child,
    );
  }

  bottomWidget() {
    int continueDays = DailyBonusController.to.continueLoginDays.value;
    bool showCheckOk = DailyBonusController.to.todayClickBonus.value;
    bool shouwHand = continueDays == 7 && !showCheckOk;
    // shouwHand = true;
    return GestureDetector(
      onTap: () {
        if (shouwHand) {
          GiftRewardModel gift = DailyBonusController.kDay_vGiftModel[7]!;
          DailyBonusController.to.onClick(gift, () {
            onClose();
          });
        } else {
          String txt = "daily_bouns_1".tr;
          if ((continueDays == 7 && showCheckOk)) {
            txt = "daily_bouns_2".tr;
          }
          ssTushi(text: txt);
        }
      },
      child:SSABChange.isPackageB()? Container(
        width: 332.w,
        height: 100.h,
        color: Colors.transparent,
        child: Stack(
          children: [
            Image.asset(
              Assets.img.dailyBonusBottomDayBg.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 12.h,
              left: 12.w,
              child: Transform.rotate(
                angle: -30 * pi / 180,
                child: SSTxtBorder(
                  text: "Day 7",
                  fontSize: 10.sp,
                  fontColor: Color(0xffFFDC16),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              left: 20.w,
              // right: 0,
              bottom: 10.h,
              top: 24.h,
              child: Container(
                width: 188.w,
                height: double.infinity,
                color: Colors.teal.withValues(alpha: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          SSABChange.isPackageB()
                              ? Assets.img.moneyGift.path
                              : Assets.imga.coinFreespin.path,
                          width: 60.w,
                          height: 40.h,
                        ),
                        SSTxtGraBorder(
                          text: "+${SSCountry.curGuojiaFuhao()}${(150*MainController.countryBeisu).toStringAsFixed(0)}",
                          fontFamily: FontFamily.ghostKidAOEPro,
                          gradient: LinearGradient(
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                            colors: [
                              Color(0xff0FFF63),
                              Color(0xffA4F00D),
                              Color(0xffD0FF00),
                              Color(0xff00FF1E),
                            ],
                          ),
                          fontSize: 18.sp,
                          strokeColor: Color(0xff0C402B),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          Assets.img.popupGetPhoneSpice.path,
                          width: 60.w,
                          height: 40.h,
                        ),
                        SSTxtGraBorder(
                          text: "x1",
                          fontFamily: FontFamily.ghostKidAOEPro,
                          gradient: LinearGradient(
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                            colors: [
                              Color(0xff0FFF63),
                              Color(0xffA4F00D),
                              Color(0xffD0FF00),
                              Color(0xff00FF1E),
                            ],
                          ),
                          fontSize: 18.sp,
                          strokeColor: Color(0xff0C402B),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            if (shouwHand)
              Positioned(
                left: 80.w,
                top: 40.h,

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
      ): Row(children: [
        SizedBox(width: 24.w,),
        centerItemDayView(
          day: 7,
          gift: DailyBonusController.kDay_vGiftModel[7]!,
        )
      ],),
    );
  }

  closeWidget() {
    return Positioned(
      top: 0.h,
      right: 0.w,
      child: GestureDetector(
        onTap: onClose,
        child: Image.asset(
          Assets.img.closePopup2.path,
          width: 40.h,
          height: 40.h,
          // fit: BoxFit.fill,
        ),
      ),
    );
  }

  onClose() async {
    ssLogggg("====== close");
    SSEventReporttttt.sign_page_close();
    Navigator.maybePop(context);
    widget.onClose();
  }


  topWidget() {
    int curLianxuDay = DailyBonusController.to.continueLoginDays.value;
    // curLianxuDay =8;
    int curweek = DailyBonusController.to.continueLoginWeeks.value;
    int allDay = 30;
    double progress = (curLianxuDay+7*curweek) / allDay;
    return Container(
      width: 345.h,
      height: 210.h,
      child: Stack(
        children: [
          Image.asset(
            Assets.img.dailyBonusTopbg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 8.h,
            child: Container(
              width: double.infinity,
              height: 84.h,
              color: Colors.brown.withValues(alpha: 0.0),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 4.h,
                    left: 0,
                    child: SSProjjjj(
                      height: 13.h,
                      innerHeight: 10.h,
                      width: 294.h,
                      progress: 0,
                      gradientColors: [
                        Color(0xffFFD70F),
                        Color(0xffF0A00D),
                        Color(0xffEAFF00),
                        Color(0xffFFD500),
                      ],
                      bgColor: Color(0xff0F0F0F),
                      border: Border.all(color: Color(0xffFF5555), width: 1.w),
                    ),
                  ),
                  Positioned(
                    bottom: 0.h,
                    child: Container(
                      width: 64.h,
                      height: 49.h,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset(
                            Assets.img.dailyBonusTopReward.path,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SSTxtBorder(
                                text: "daily_bouns_3".tr,
                                foreground: Color(0xff380F0F),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                height: 1,
                                fontColor: Color(0xffFFFF00),
                              ),
                              SizedBox(height: 2.h),
                              Container(
                                width: 52.h,
                                height: 13.h,
                                decoration: BoxDecoration(
                                  color: Color(0xff561F1F),
                                  borderRadius: BorderRadius.circular(13.h),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "$curLianxuDay",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Color(0xffFFFF00),
                                          fontWeight: FontWeight.w500,
                                          height: 1,
                                        ),
                                      ),
                                      Text(
                                        "/$allDay",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Color(0xffFFFFff),
                                          fontWeight: FontWeight.w500,
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 80.h,
                    right: 0,
                    bottom: 0.h,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        topGiftDay(
                          icon: Assets.img.dailyBonusGift7.path,
                          day: 7,
                        ),
                        topGiftDay(
                          icon: Assets.img.dailyBonusGift17.path,
                          day: 15,
                        ),
                        topGiftDay(
                          icon: Assets.img.dailyBonusGift22.path,
                          day: 22,
                        ),
                        topGiftDay(
                          icon: Assets.img.dailyBonusGift30.path,
                          day: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          closeWidget(),
        ],
      ),
    );
  }

  topGiftDay({required String icon, required int day}) {
    int tmpWeeks = DailyBonusController.to.continueLoginWeeks.value;
    int tmpDays = DailyBonusController.to.continueLoginDays.value;

    int tmpCurDay = tmpDays + tmpWeeks * 7;

    bool hasGet = tmpCurDay >= day;

    // hasGet = true;
    return Container(
      width: 50.h,
      height: 70.h,
      color: Colors.teal.withValues(alpha: 0.0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(icon, width: 44.h, height: 44.h, fit: BoxFit.contain),
              // SizedBox(height: 4.h),
              Container(
                width: 22.h,
                height: 22.h,
                child: Stack(
                  children: [
                    Image.asset(
                      Assets.img.dailyBonusGiftday.path,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Center(
                      child: SSTxtBorder(
                        text: "$day",
                        fontSize: 9.sp,
                        strokeWidth: 0.5.w,
                        foreground: Color(0xff8A2F2F),
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (hasGet)
            Positioned(
              right: 8.w,
              top: 4.h,
              child: Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.0),
                ),
                child: Center(
                  child: Image.asset(
                    Assets.img.dailyBonusOk.path,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}

class DailyBonusBottomTime extends StatefulWidget {
  const DailyBonusBottomTime({super.key});

  @override
  State<DailyBonusBottomTime> createState() => _DailyBonusBottomTimeState();
}

class _DailyBonusBottomTimeState extends State<DailyBonusBottomTime> {
  Timer? _timer;

  int maxSeconds = 60 * 60;
  String text = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final now = DateTime.now();
    final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);
    final remaining = endOfDay.difference(now);

    text = formatDuration(remaining);
    _initTimer();
  }

  _initTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);
      final remaining = endOfDay.difference(now);

      if (remaining.isNegative) {
        ssLogggg("🛑 倒计时结束！");
        timer.cancel();
      } else {
        setState(() {
          text = formatDuration(remaining);
        });
        // ggPrint("⏳ 剩余时间：${text}");
      }
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "${"daily_des".tr} ",
        children: [
          TextSpan(
            text: text,
            style: TextStyle(color: Color(0xff5CEDB1)),
          ),
        ],
      ),
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }
}
