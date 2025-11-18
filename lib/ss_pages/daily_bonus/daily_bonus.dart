import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_common/model/gift_reward_model.dart';

class OverlayDailyBonus {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return SettingWidget(
          onClose: () {
            close();
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

class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      Wrap(
                        spacing: 10.w,
                        runSpacing: 12.h,
                        children: [
                          centerItemDayView(
                            day: 1,
                            gift: GiftRewardModel(
                              rewardModelType: EnumGiftRewardModel.cash,
                              num: 50,
                              img: Assets.img.moneyGift.path,
                            ),
                          ),
                          centerItemDayView(
                            day: 2,
                            gift: GiftRewardModel(
                              rewardModelType: EnumGiftRewardModel.cash,
                              num: 75,
                              img: Assets.img.moneyGift.path,
                            ),
                          ),
                          centerItemDayView(
                            day: 3,
                            gift: GiftRewardModel(
                              rewardModelType: EnumGiftRewardModel.spin,
                              num: 50,
                              img: Assets.img.btnTxtSpin.path,
                            ),
                          ),
                          centerItemDayView(
                            day: 4,
                            gift: GiftRewardModel(
                              rewardModelType: EnumGiftRewardModel.cash,
                              num: 100,
                              img: Assets.img.moneyGift.path,
                            ),
                          ),
                          centerItemDayView(
                            day: 5,
                            gift: GiftRewardModel(
                              rewardModelType: EnumGiftRewardModel.xp,
                              num: 2,
                              img: Assets.img.giftXpUnlock.path,
                            ),
                          ),
                          centerItemDayView(
                            day: 6,
                            gift: GiftRewardModel(
                              rewardModelType: EnumGiftRewardModel.iphoneCard,
                              num: 1,
                              img: Assets.img.phoneSuip.path,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      bottomWidget(),
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

  centerItemDayView({required int day, required GiftRewardModel gift}) {
    String centerImg = gift.img;
    String money = "+${gift.num.toStringAsFixed(0)}";
    if (gift.rewardModelType == EnumGiftRewardModel.cash) {
      money = "+${SSCountry.curGuojiaFuhao()}${gift.num.toStringAsFixed(0)}";
    }else if (gift.rewardModelType == EnumGiftRewardModel.xp) {
      money = "x${gift.num.toStringAsFixed(0)}";
    }
    return Container(
      width: 159.w,
      height: 91.h,
      child: Stack(
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
              Image.asset(centerImg, width: 60.w, height: 40.h),
              SSTxtGraBorder(
                text: money,
                // fontFamily: FontFamily.rubik,
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
    );
  }

  bottomWidget() {
    return Container(
      width: 332.w,
      height: 100.h,
      child: Stack(
        children: [
          Image.asset(
            Assets.img.dailyBonusBottomDayBg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned(
            left: 120.w,
            right: 0,
            bottom: 4.h,
            top: 10.h,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.teal.withValues(alpha: 0.0),
              child: Column(
                children: [
                  SizedBox(height: 4.h,),
                  SSTxtBorder(text: "Day 7",fontSize: 16.sp,fontWeight: FontWeight.w700,),
                  SizedBox(height: 26.h,),
                  SSTxtGraBorder(text: "REWARD x2",fontSize: 20.sp,fontWeight: FontWeight.w700,strokeColor: Color(0xff460000),),

                ],
              ),
            ),
          )
        ],
      ),
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

    widget.onClose();
  }

  topWidget() {
    int curLianxuDay = 4;
    int allDay = 30;
    double progress = curLianxuDay / allDay;
    progress = 0.5;
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
                      width: 296.h,
                      progress: progress,
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
                                text: "Reward\nDays",
                                foreground: Color(0xff380F0F),
                                fontSize: 12.sp,
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
    return Container(
      width: 50.h,
      height: 70.h,
      color: Colors.teal.withValues(alpha: 0.0),
      child: Column(
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
    );
  }
}
