import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_source2target.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_common/diallll/overlay_bigwin.dart';
import 'package:slots_132/ss_common/diallll/overlay_common_get.dart';
import 'package:slots_132/ss_common/diallll/overlay_free_spins.dart';
import 'package:slots_132/ss_common/diallll/overlay_free_spins_over.dart';
import 'package:slots_132/ss_common/diallll/overlay_jackpot_grand.dart';
import 'package:slots_132/ss_common/diallll/overlay_jackpot_major.dart';
import 'package:slots_132/ss_common/diallll/overlay_jackpot_mini.dart';
import 'package:slots_132/ss_common/diallll/overlay_megawin.dart';
import 'package:slots_132/ss_common/diallll/overlay_superwin.dart';
import 'package:slots_132/ss_common/diallll/overlay_wow.dart';
import 'package:slots_132/ss_common/routes.dart';
import 'package:slots_132/ss_pages/bonus_game/bonus_game.dart';
import 'package:slots_132/ss_pages/box_gift/overlay_boxgift.dart';
import 'package:slots_132/ss_pages/daily_bonus/daily_bonus.dart';
import 'package:slots_132/ss_pages/lucky_slots/lucky_slots.dart';
import 'package:slots_132/ss_pages/maiiiiii/dialoggg/overlay_exp.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/settinnnnn/dialoggg/paytable.dart';
import 'package:slots_132/ss_pages/settinnnnn/settinnnn.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_one_last_check.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_onelc_jindu1.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_onelc_jindu2.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_rank.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class TopView extends StatelessWidget {
  const TopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return topWidget();
    });
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
            gaplessPlayback: true,
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
                      child: Builder(
                        builder: (context) {
                          Widget child = Image.asset(
                            Assets.img.money.path,
                            width: 30.h,
                            height: 28.h,
                            fit: BoxFit.fill,
                            gaplessPlayback: true,
                          );
                          overlayMainTopMoney.targetContext = context;
                          return child;
                        },
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
            child: GestureDetector(
              onTap: onWithddd,
              child: Container(
                width: double.infinity,
                height: 34.h,
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.0),
                ),
                child: Center(
                  child: Image.asset(
                    WithdddController.to.currentPaymentIconSelected(),
                    width: double.infinity,
                    height: double.infinity,
                    gaplessPlayback: true,
                  ),
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
                    top: 6.h,
                    bottom: 6.h,
                    child: expProgress(),
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
                        gaplessPlayback: true,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 0.w,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Center(child: topXp()),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 12.h,
            right: 4.w,
            child: GestureDetector(
              onTap: onMenu,
              child: Container(
                width: 32.h,
                height: 32.h,
                color: Colors.yellow.withValues(alpha: 0),
                child: Image.asset(
                  Assets.img.menu.path,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                  gaplessPlayback: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onMenu() async {
    ssLogggg("====onMenu");
    // OverlaySettinnn().show();


    // OverlayBoxgift().show();
    // OverlayLuckySlots().show(
    //   onClose: (v) {
    //     overlayMainTopMoney.showWithSize(
    //       childSize: Size(32.w, 32.w),
    //       onEnd: () {
    //
    //       },
    //     );
    //   },
    // );

    // OverlayFreeSpinsOver().show(money: 10, onClose: (v){},spinCount: 5);

    // OverlayCommonGet().show(money: 100,exp: 10,phoneSpice: 1);


    // OverlayDailyBonus().show();
    // OverlayRank().show();
    // OverlayOneLastCheck().show();
    // OverlayWithddOnelastcheckJindu1().show();
    // OverlayOneLastCheckJindu2().show();
    // OverlayBonusGame().show();
    // overlayLuckySlots.show();
    // OverlayFreeSpins().show(money: 10);



    // OverlaySuperwin().show(money: 100);
    // OverlayBigwin().show(money: 100);
    // OverlayWow().show(money: 100, onClose: (value) {  });
    // OverlayMegawin().show(money: 100);

    // OverlayJackpotGrand().show(money: 200, onBtn: (value) {  }, onBtn2: (value) {  });
    // OverlayJackpotMajor().show(money: 200, onBtn: (value) {  }, onBtn2: (value) {  });
    OverlayJackpotMini().show(money: 200, onBtn: (value) {  }, onBtn2: (value) {  });

    // MainController.to.curLevelExp.value = 980;
  }

  onWithddd() {
    Get.toNamed(SSRouttttt.withdrawwwww);
  }

  topMoney() {
    double money = MainController.to.curMonnnn.value;
    // money = 30510.1;
    String suffix = "";
    if (money >= 1000000) {
      money = money / 1000000;
      suffix = "M";
    } else if (money >= 1000) {
      money = money / 1000;
      suffix = "k";
    }
    return GestureDetector(
      onTap: onWithddd,
      child: Container(
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
            duration: Duration(milliseconds: 800),
            fractionDigits: 2,
            // wholeDigits: 2,
            prefix: SSCountry.curGuojiaFuhao(),
            suffix: suffix,
            value: money,
            textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xff6AFF00),
              fontSize: 16.sp,
              height: 1,
              fontFamily: FontFamily.rubik,
            ),
          ),
        ),
      ),
    );
  }

  topXp() {
    int level = MainController.to.level();
    return GestureDetector(
      onTap: onExp,
      child: Container(
        width: 100.w,
        height: 26.h,
        padding: EdgeInsets.only(left: 22.w),
        decoration: BoxDecoration(
          color: Colors.teal.withValues(alpha: 0.0),
          // borderRadius: BorderRadius.circular(30.h),
          // gradient: LinearGradient(
          //   colors: [
          //     Color(0xff540406),
          //     Color(0xff3C0302),
          //     Color(0xff360100),
          //     Color(0xff560000),
          //   ],
          // ),
          // border: Border.all(color: Color(0xffAA3A3D), width: 1.w),
        ),
        child: Center(
          child: SSAniiiiCount(
            duration: Duration(milliseconds: 500),
            fractionDigits: 0,
            prefix: "LV.",
            value: level,
            // pass in a value like 2014
            textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xffFFFFFF),
              fontSize: 14.sp,
              // height: 1.1,
            ),
          ),
        ),
      ),
    );
  }

  expProgress() {
    double progress = MainController.to.curLevelProgress();
    return Center(
      child: Container(
        width: 100.w,
        height: 20.h,
        child: Center(
          child: SSProjjjj(
            height: 20.h,
            innerHeight: 16.h,
            width: 100.w,
            progress: progress,
            gradientColors: [
              Color(0xff139FCE),
              Color(0xff64F7FE),
              Color(0xff055AD5),
              Color(0xff178AEF),
              // Color(0xff139FCE),
            ],
            bgColor: Color(0xff3C0302),
          ),
        ),
      ),
    );
  }

  void onExp() {
    OverlayExp().show();
  }
}
