// // 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.326085
// import 'dart:math';
//
// // auto patch 975
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../jc_huanjing/jc_huanjing.dart';
// import '../index.dart';
// import '../jc_net/event_report.dart';
//
// @pragma('vm:entry-point')
//
// Future<void> onLocalBackgroundMessage(final NotificationResponse message) {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   swPrint("onLocalBackgroundMessage message:${message.data}");
//   SharedPreferences.getInstance().then(
//     (sp) => SWLocalNotificationUtils().setUn(
//       SWLocalNotificationUtils().getUn(sp) + 1,
//       sp,
//     ),
//   );
//   return Future.value();
// }
//
// class SWLocalNotificationUtils {
//   static final SWLocalNotificationUtils _instance =
//       SWLocalNotificationUtils._();
//
//   SWLocalNotificationUtils._();
//
// // auto patch 596
//   factory SWLocalNotificationUtils() => _instance;
//
//   IOSFlutterLocalNotificationsPlugin? _plugin;
//
//   void setUn(int value, SharedPreferences sp) => sp.setInt("tongzi_un", value);
//
//   int getUn(SharedPreferences sp) => sp.getInt("tongzi_un") ?? 0;
//
//   Future<void> init() async {
//     swPrint("========LocalNotificationUtils init");
//     try{
//       await _pre();
//       await _ggTong();
//     }catch(e){
//       swPrint("========LocalNotificationUtils init error:$e");
//     }
//   }
//
//   Future<IOSFlutterLocalNotificationsPlugin> _pre() async {
//     if (_plugin != null) return _plugin!;
//     _plugin = IOSFlutterLocalNotificationsPlugin();
//     await _plugin!.initialize(
//       DarwinInitializationSettings(),
//       onDidReceiveNotificationResponse: (p) {
//         swPrint("======p${p.id}=");
//         // LocalNotificationUtils().onTap(p.id??0);
//       },
//       onDidReceiveBackgroundNotificationResponse: onLocalBackgroundMessage,
//     );
//
//     /// 杀死进程后，进入的点击
//     if ((await didLaunchApp())) {
//       if (_notificationResponse != null) {
//         onTap(_notificationResponse!);
//       }
//     }
//     final un = getUn(SWSpUtil.sp);
//     for (int i = 0; i < un; i++) {
//       if (_notificationResponse != null) {
//         onTap(_notificationResponse!);
//       }
//     }
//     setUn(0, SWSpUtil.sp);
//     return _plugin!;
//   }
//
//   NotificationResponse? _notificationResponse;
//
//   // Future onTap() => LGERUtils().event("inform_c")
//   onTap(NotificationResponse p) {
//     int id = p.id ?? -1;
//     String name = "";
//     if (id == 700) {
//       name = "fix";
//     } else if (id == 701) {
//       name = "sign";
//     } else if (id == 702) {
//       name = "quiz";
//     } else if (id == 703) {
//       name = "paypel";
//     }
//   }
//
//   Future<bool> didLaunchApp() async {
//     final plugin =
// // auto patch 513
//         _plugin ?? (GGABPackage.isPackageB() ? (await _pre()) : null);
//     if (plugin == null) return false;
// // auto patch 361
//     NotificationAppLaunchDetails? notificationAppLaunchDetails = await plugin
//         .getNotificationAppLaunchDetails();
//     _notificationResponse = _notificationResponse;
//     return notificationAppLaunchDetails?.didNotificationLaunchApp == true;
//   }
//
//    _ggTong() async {
//     final plugin = await _pre();
// // auto patch 195
//     await plugin.requestPermissions();
//     final r = await plugin.checkPermissions();
//     if (r == null || !r.isEnabled) return;
//
//     List data = [
//       {
//         "title": "Daily Tree Bonus!",
//         "content": "Water today, tixian tomorrow—claim daily rewards!",
//       },
//       {
//         "title": "Roots to Cash!",
//         "content": "Grow deep roots, earn real tixian—start now!",
//       },
//       {
//         "title": "Tree Fortune Unleashed!",
//         "content":
//             " Your profitable forest is blooming—water a tree today, claim tixian rewards tomorrow!",
//       },
//       {
//         "title": "Special Gift Awaiting!",
//         "content": "Special gift waiting! Tap to reveal!",
//       },
//       {
//         "title": "Green Harvest: Plant & Cash In!",
//         "content":
//             "A new round of tree rewards is here—grow your garden and withdraw real tixian now!",
//       },
//       {
//         "title": "Cash Canopy: Grow Big, Earn Bigger!",
//         "content":
//             "The taller your trees, the fatter your wallet—start tending to your forest today!",
//       },
//       {
//         "title": "Green Earn & Grow!",
//         "content": "Every tree waters, every tixian rewards—start planting!",
//       },
//       {
//         "title": "Leafy Cash Ready!",
//         "content": "Your forest grows, tixian flows—claim your reward!",
//       },
//       {
//         "title": "Plant & Profit Now!",
//         "content": "One tree planted, one reward claimed—don’t wait!",
//       },
//       {
//         "title": "Eco-Cash Boost!",
//         "content": "Grow trees, earn big—your payout is here!",
//       },
//     ];
//
//     var notificationData = data[Random.secure().nextInt(10)];
//     plugin.periodicallyShowWithDuration(
//       800,
//
//       notificationData?['title'],
//       notificationData?['content'],
//       SWAppConfig.isDEV() ? Duration(minutes: 1) : Duration(minutes: 30),
//     );
//
//     // final body = [
// // auto patch 966
//     //   "💰More than 1,000 users have successfully withdrawn money",
//     //   "🎁Turn your knowledge into tixian",
//     //   "🔥Here‘s \$100 for you! Expired after 5 minutes!",
//     // ];
//     //
//     // // - 固定通知：
//     // plugin.periodicallyShowWithDuration(
//     //   700,
//     //   "Earn money by QuizMind",
//     //   body[Random.secure().nextInt(3)],
//     //   GGAppConfig.isDEV() ? Duration(minutes: 1) : Duration(minutes: 30),
//     // );
//     // // - 签到通知：
//     // plugin.periodicallyShowWithDuration(
//     //   701,
//     //   "Cash in check daily",
//     //   "Sign up now and start earning money effortlessly.",
//     //   GGAppConfig.isDEV() ? Duration(minutes: 30) : Duration(minutes: 60),
//     // );
//     // // - 答题通知：
//     // var questionN = [
//
//     //   "💰Someone just made a successful withdrawal on QuizMind！",
//     //   "🎁Put your knowledge to work and earn money!",
//
//     // ];
//     //
//     // plugin.periodicallyShowWithDuration(
//     //   702,
//     //   "Answer right, Earn Big!",
//     //   questionN[Random.secure().nextInt(2)],
//     //   GGAppConfig.isDEV() ? Duration(minutes: 30) : Duration(minutes: 60),
//     // );
//     // // - Paypal弹窗
//     // plugin.periodicallyShowWithDuration(
//     //   703,
//     //   "Pending withdraw amount",
//     //   "\$100 has arrived in your account",
//     //   GGAppConfig.isDEV() ? Duration(minutes: 30) : Duration(minutes: 30),
//     // );
//   }
// }
// // Dummy injected code for hash diff
// void _dummyHashAdjuster_986936() {
//
// // auto patch 513
//   final now = DateTime.now().microsecondsSinceEpoch;
//   if (now == 122754227) print('Unreachable dummy code');
// }
