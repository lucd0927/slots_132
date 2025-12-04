import 'dart:async';
import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart' hide Velocity;
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newton_particles/newton_particles.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_ad/adsid.dart';
import 'package:slots_132/jc_ad/common_ads.dart';
import 'package:slots_132/jc_gj/audio.dart';
import 'package:slots_132/jc_gj/denglugengzhong.dart';
import 'package:slots_132/jc_gj/jc_huanjing/cccc.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/overlay_floaing.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_notification/android_notification.dart';
import 'package:slots_132/ss_common/diallll/overlay_tz_notify.dart';
import 'package:slots_132/ss_common/diallll/overlay_tz_reward.dart';
import 'package:slots_132/ss_common/sssssp/spine_hand.dart';
import 'package:slots_132/ss_common/sssssp/spine_main_center_pq.dart';
import 'package:slots_132/ss_common/sssssp/spine_piaoqian.dart';
import 'package:slots_132/ss_common/sssssp/spine_sdlr.dart';
import 'package:slots_132/ss_common/sssssp/spine_tanc_xuanguang.dart';
import 'package:slots_132/ss_common/sssssp/spine_txlast.dart';
import 'package:slots_132/ss_pages/daily_bonus/daily_bonus.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/avatar_row.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/bottom_view.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/center_view.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/top_view.dart';
import 'package:slots_132/ss_pages/phone_card/phone_card_controller.dart';
import 'package:slots_132/ss_pages/wheeee/whe_controller.dart';
import 'package:slots_132/ss_pages/zhifu/chat/chat_controller.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(MainController());
    Get.put(WheController());
    Get.put(WithdddController());
    Get.put(SSChatController());
    Get.put(PhoneCardController());
    MainController.initLottieComposition();

    SSEventReporttttt.install();
    SSEventReporttttt.session();
    SSEventReporttttt.launch_page();
    SSEventReporttttt.home_page(source_from: "NORMAL");

    initNotification(showDialog: true);
    bgMusic.play(loopMode: LoopMode.single);

    Timer.periodic(Duration(seconds: 60), (timer) {
      if (mounted) {
        SlideAcrossOverlay().show(context);
      }
    });

    jiazaiInterrrr();
  }


  jiazaiInterrrr() async {
    if(SSDlTracking.qidongduoshaoDay() <= 1 && SSHuanjing.hasPppord()){
      return;
    }


    int load = 1;
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      bool hasFirstIntLoaded = SSCommonAds.hasFirstIntLoaded;
      if (!hasFirstIntLoaded) {
        SSCommonAds().showInterstitialAd(
          adPosId: SSAdsPosId.eyomt_launch,
          ignored_hasDisplayAd: true,
          canTryAgain: false
        );
        break;
      } else {
        load = load + 1;
        if (load >= 30) {
          break;
        }
      }
    }
  }

  initNotification({required bool showDialog}) async {
    try {
      ssLogggg("===initNotification==");
      // 本地通知初始化
      if (Platform.isIOS) {
        // await GGLocalNotificationUtils().init();
      } else {
        // await GGLocalAndroidNotification().initAllNotification();
        await SSTzNotificattttt().init();
        ssLogggg("===initNotification==检查通知");
        bool result = await SSTzNotificattttt().checkNotificationPermission();
        ssLogggg("===initNotification==result:$result");
        if (!result) {
          await Future.delayed(Duration(milliseconds: 200));
          OverlayTzNotify().show(
            onClose: (v) {
              onDailyBonus();
            },
          );
          return;
        }
      }
    } catch (e) {
      ssLogggg("===initNotification=error:$e=");
      FirebaseCrashlytics.instance.recordError(e, null, fatal: false);
    }
    onDailyBonus();

    bool clickTz = SSTzNotificattttt.clickTz;
    if (clickTz) {
      OverlayTzReward().show(
        money: 50,
        onBtn: (v) {
          MainController.to.onAddMoney(v, showMoneyAnimated: true);
        },
        onBtn2: (value) {
          MainController.to.onAddMoney(value, showMoneyAnimated: true);
        },
      );
    }
  }

  onDailyBonus() async {
    if (SSDlTracking.isFirstLoginToday) {
      await Future.delayed(Duration(milliseconds: 200));
      OverlayDailyBonus().show(showAddMoney: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(resizeToAvoidBottomInset: false, body: mainView());
  }

  Widget mainView() {
    return Obx(() {
      bool showFreeSpin = MainController.to.curShowFreeSpin.value;

      return SizedBox(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Stack(
          children: [
            Image.asset(
              Assets.img.mainBg.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              gaplessPlayback: true,
            ),
            Positioned.fill(
              child: FittedBox(
                child: Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().screenHeight,
                  // width: 311.w,
                  // height: 232.w,
                  // color: Colors.yellow,
                  child: Center(child: SSSpineMainCenterpq()),
                ),
              ),
            ),
            // Positioned.fill(
            //   top: -200.h,
            //   left: 0.w,
            //
            //   child: Container(
            //     width: ScreenUtil().screenWidth,
            //     height: ScreenUtil().screenHeight,
            //     child:const SSSpinePiaoqian(),
            //   ),
            // ),
            Column(
              children: [
                TopView(),
                AvatarRow(),
                Expanded(child: CenterView()),
                BottomView(key: ValueKey("mainBottomView")),
                Container(
                  width: double.infinity,
                  height: ScreenUtil().bottomBarHeight,

                  // decoration: BoxDecoration(color: Colors.black),
                  // child:   ClipRRect(child: StarFieldBackground()),
                ),
              ],
            ),

            if (showFreeSpin)
              Container(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                color: Colors.transparent,
              ),

          ],
        ),
      );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
