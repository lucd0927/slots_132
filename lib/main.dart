import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_ad/adsid.dart';
import 'package:slots_132/jc_ad/common_ads.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/audio.dart';
import 'package:slots_132/jc_gj/denglugengzhong.dart';
import 'package:slots_132/jc_gj/jc_huanjing/cccc.dart';
import 'package:slots_132/jc_gj/jc_huanjing/cccc_env.dart';
import 'package:slots_132/jc_gj/jc_net/http_checccc.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_gj/restore_bottom_bar.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_common/routes.dart';
import 'package:spine_flutter/spine_flutter.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter/services.dart';


main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // // 2 本地存储

  await Hive.initFlutter();
  await Hive.openBox(SSHive.hkBbbb);
  await Hive.openBox(SSHive.hkBoxChat);
  await Hive.openBox(SSHive.hkHistory);
  await initSpineFlutter(enableMemoryDebugging: false);
  // 设置只允许竖屏
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown, // 可选：允许上下颠倒的竖屏
  ]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,);

  SSHuanjing.initEvn(SSHuanjingEnv.dev);

  PaintingBinding.instance.imageCache.maximumSize = 2000;
  PaintingBinding.instance.imageCache.maximumSizeBytes = 1024 * 1024 * 300; // 300MB
  SSDlTracking.init();
  SSHttpChhhh().isOnline();
  ssNetChecccc.init();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lcChange();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      // splitScreenMode: true,
      child: GlobalLoaderOverlay(
        child: ToastificationWrapper(
          child: GetMaterialApp(
            // main: MyHomePage(title: '1'),
            title: "Slots",
            initialRoute: SSRouttttt.splash,
            builder: (BuildContext context, Widget? child) {
              return Overlay(
                initialEntries: <OverlayEntry>[
                  OverlayEntry(
                    builder: (BuildContext ctx) {
                      return child!;
                    },
                  ),
                ],
              );
              return Overlay();
            },
            theme: ThemeData(fontFamily: FontFamily.rubik),
            getPages: SSRouttttt.pages,

            // translations: FanyiTools(),
            // 你的翻译
            // fallbackLocale: Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
          ),
        ),
      ),
    );
  }
}




Timer? _bgTtttt;
bool sssshowAd = false;

void lcChange() {
  SystemChannels.lifecycle.setMessageHandler((msg) async {
    ssLogggg('lifecycle> $msg');
    // if(!GGABPackage.isPackageB()){
    //   return msg;
    // }
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top,SystemUiOverlay.bottom]);
    // msg是个字符串，是下面的值
    // AppLifecycleState.resumed
    // AppLifecycleState.inactive
    // AppLifecycleState.paused
    // AppLifecycleState.detached
    if (msg == "AppLifecycleState.resumed") {
      bgMusic.resume();
      // JCShijianBaogao.session();
      _bgTtttt?.cancel();
      SystemUiHelper.restoreTransparentNavBar();
      if (sssshowAd) {
        ssLogggg("===前后切换加载=GGCommonAds().showInterstitialAd=${SSCommonAds.hasDisplayAd()}=");
        if (!SSCommonAds.hasDisplayAd()) {
          ssLogggg("===前后切换加载=GGCommonAds().showInterstitialAd==");

          if (SSABChange.isPackageB()) {
            SSCommonAds().showInterstitialAd(
              adPosId: SSAdsPosId.eyomt_launch,
              ignored_hasDisplayAd: false,
              canTryAgain: false,
            );
          }
        }
      }
      sssshowAd = false;
    } else {
      bgMusic.pause();
      if (msg == "AppLifecycleState.paused") {
        ssLogggg("====AppLifecycleState.paused===");
        // JCShijianBaogao.app_background();
        sssshowAd = false;
        _bgTtttt?.cancel();
        _bgTtttt = Timer(Duration(seconds: 3), () {
          sssshowAd = true;
          ssLogggg("====AppLifecycleState.paused==showAd:$sssshowAd=");
          _bgTtttt?.cancel();
        });
      } else if (msg == "AppLifecycleState.detached") {
      } else if (msg == "AppLifecycleState.inactive") {}
    }

    return msg;
  });
}


