import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:confetti/confetti.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart' hide Velocity;
import 'package:flutter/services.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_floating_particles/flutter_floating_particles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:move_to_background/move_to_background.dart';
import 'package:newton_particles/newton_particles.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_ad/adsid.dart';
import 'package:slots_132/jc_ad/common_ads.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/audio.dart';
import 'package:slots_132/jc_gj/denglugengzhong.dart';
import 'package:slots_132/jc_gj/jc_huanjing/cccc.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/overlay_floaing.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_tushi.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_notification/android_notification.dart';
import 'package:slots_132/jc_notification/ios_notification.dart';
import 'package:slots_132/ss_common/animated_win/animated_xuanguang.dart';
import 'package:slots_132/ss_common/diallll/overlay_tz_notify.dart';
import 'package:slots_132/ss_common/diallll/overlay_tz_reward.dart';
import 'package:slots_132/ss_common/routes.dart';
import 'package:slots_132/ss_common/sssssp/spine_freespin_selected.dart';
import 'package:slots_132/ss_common/sssssp/spine_hand.dart';
import 'package:slots_132/ss_common/sssssp/spine_main_avatar.dart';
import 'package:slots_132/ss_common/sssssp/spine_main_center_pq.dart';
import 'package:slots_132/ss_common/sssssp/spine_piaoqian.dart';
import 'package:slots_132/ss_common/sssssp/spine_sdlr.dart';
import 'package:slots_132/ss_common/sssssp/spine_tanc_xuanguang.dart';
import 'package:slots_132/ss_common/sssssp/spine_txlast.dart';
import 'package:slots_132/ss_common/webviewchangeios.dart';
import 'package:slots_132/ss_pages/daily_bonus/daily_bonus.dart';
import 'package:slots_132/ss_pages/daily_bonus/daily_bonus_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/avatar_row.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/bottom_view.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/center_view.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/top_view.dart';
import 'package:slots_132/ss_pages/phone_card/phone_card_controller.dart';
import 'package:slots_132/ss_pages/wheeee/whe_controller.dart';
import 'package:slots_132/ss_pages/zhifu/chat/chat_controller.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

import 'dialoggg/overlay_money_tips.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> with AutomaticKeepAliveClientMixin {

  Timer? _timerWithdraw;
  Timer? _timerMoneyTips;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(MainController());
    Get.put(DailyBonusController());
    Get.put(WheController());
    Get.put(WithdddController());
    Get.put(SSChatController());
    Get.put(PhoneCardController());
    MainController.initLottieComposition();

    SSEventReporttttt.home_page(source_from: "NORMAL");

    initNotification(showDialog: true);
    bgMusic.play(loopMode: LoopMode.single);
    bgMusicFreeSpin.play(loopMode: LoopMode.single).then((v) {
      bgMusicFreeSpin.pause();
    });

    WidgetsBinding.instance.addPostFrameCallback((_){
      initABListener();
    });

    initOverlayTips();

    jiazaiInterrrr();
  }

  initABListener()async{
    WVChannelIosC143().nbaIosChan(context);
    SSABChange().listen((packName) async{
      ssLogggg("===SSABChange().listen==packName:$packName");

      // await Future.delayed(Duration(milliseconds: 15000));
      if (packName == SSABChange.packageB) {
        ssLogggg("===SSABChange().listen==reset Data");


        if (Platform.isIOS) {
          MainController.to.resetInitDataB();
          DailyBonusController.to.resetDataB();

          SSNotificationIos().init();
          initOverlayTips();
          Future.delayed(Duration(milliseconds: 1),(){
            onDailyBonus();
            WVChannelIosC143().asfdasfLoadCcccc();
            // 卡顿
            WVChannelIosC143().lasflkafAnsGetaldsjlkasfBbbb();
            WVChannelIosC143().idC143faaaa();
            WVChannelIosC143().distinctID();
          });

          if(mounted){
            setState(() {

            });
          }
        }
      }else{
        if(Platform.isIOS){
          WVChannelIosC143().asdfAnsRAaaaVi1111();
        }


      }
    });
  }

  initOverlayTips(){
    if(SSABChange.isPackageB()){
      _timerWithdraw?.cancel();
      _timerWithdraw = Timer.periodic(Duration(seconds: 60), (timer) {
        if (mounted) {
          SlideAcrossOverlay().show(context);
        }
      });
      _timerMoneyTips?.cancel();
      _timerMoneyTips = Timer.periodic(Duration(seconds: 30), (timer) {
        if (mounted) {
          // OverlayMoneyTips().show();

          if(MainController.to.curMonnnn.value >= MainController.minWithdddMoney || WithdddController.to.hasSaveCardId()){
            _timerMoneyTips?.cancel();
            return;
          }
          MainController.tooltipController.show();
        }
      });
    }
  }

  jiazaiInterrrr() async {
    if (SSDlTracking.qidongduoshaoDay() <= 1 || !SSABChange.isPackageB()) {
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
          canTryAgain: false,
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
        await SSNotificationIos().init();

        ssLogggg("===initNotification=ios=检查通知");

      } else {
        // await GGLocalAndroidNotification().initAllNotification();
        await SSTzNotificattttt().init();
        ssLogggg("===initNotification=android=检查通知");

      }

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

    } catch (e) {
      ssLogggg("===initNotification=error:$e=");
      FirebaseCrashlytics.instance.recordError(e, null, fatal: false);
    }
    onDailyBonus();

    bool clickTz = SSTzNotificattttt.clickTz;
    if(Platform.isIOS){
      clickTz = SSNotificationIos.clickTz;
    }
    if (clickTz) {
      initTzReward();
    }
  }

  initTzReward(){
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

  onDailyBonus() async {
    if (SSDlTracking.isFirstLoginToday) {
      await Future.delayed(Duration(milliseconds: 200));
      bool hasClick = DailyBonusController.to.todayClickBonus.value;
      int days = DailyBonusController.to.continueLoginDays.value;
      int weeks = DailyBonusController.to.continueLoginWeeks.value;

      bool hasFirstDay = days == 1 && weeks == 0;

      if (hasFirstDay && !hasClick) {
        MainController.to.onAddMoney(50, showMoneyAnimated: true);
        DailyBonusController.to.todayClickBonus.value = true;
        DailyBonusController.to.saveTodayClickBonusStatus(true);
        return;
      }

      OverlayDailyBonus().show(showAddMoney: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PopScope(
      canPop: true,
      // onPopInvoked: (didPop) {
      //   if (didPop) return;
      //
      //   // 自己处理返回逻辑
      //   MoveToBackground.moveTaskToBack();
      // },
      child: Scaffold(resizeToAvoidBottomInset: false, body: mainView()),
      // onWillPop: () async {
      //
      // },
    );

  }

  Widget mainView() {
    return Obx(() {
      bool showFreeSpin = MainController.to.curShowFreeSpin.value;
      if (MainController.to.curFreeSpinCount.value <= 0) {
        showFreeSpin = false;
      }
      // ssLogggg(
      //   "=====showFreeSpin:$showFreeSpin hasScrollerStart:${MainController.to.hasScrollerStart.value}",
      // );



      Widget child =  DefaultTextStyle(
        style: TextStyle(fontFamily: FontFamily.ghostKidAOEPro),
        child: SizedBox(
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

              ParticleEffects(
                isEnabled: true,
                config: ParticleConfig(
                  particleType: ParticleType.image,
                  direction: ParticleDirection.topToBottom,
                  // Already falling
                  particleCount: 10,
                  imagePath:SSABChange.isPackageB()? Assets.img.money.path:Assets.imga.coin.path,
                  minSize: 50.w,
                  maxSize: 50.w,
                  enableRotation: true,
                  enableSizeVariation: false,
                  velocityMultiplier: 2,
                  animationDuration: Duration(seconds: 5),
                  minOpacity: 0.0,
                  maxOpacity: 1.0,
                ),
                child: Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().screenHeight,
                  // width: 375.w,
                  // height: 400.h,
                  color: Colors.yellow.withValues(alpha: 0.0),
                ),
              ),
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
                GestureDetector(
                  onTap: (){
                    ssTushi(text: "Free Spin is in progress. Please wait until it’s over.");
                  },
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().screenHeight,
                    color: Colors.transparent,
                  ),
                ),


            ],
          ),
        ),
      );

      return  OverlayPortal(
        controller: MainController.tooltipController,
        overlayChildBuilder: (BuildContext context) {
          return MainTopMoneyTipsWidget(
            onClose: () {
              MainController.tooltipController.hide();
            },
          );
        },
        child: child,
      );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timerWithdraw?.cancel();
    _timerMoneyTips?.cancel();
  }
}
