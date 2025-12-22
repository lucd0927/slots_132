import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:permission_handler/permission_handler.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/log.dart';


const local_ios = "c132iosnotificationcount";

const int gudingC143 = 5890;
const int jianchaNotiC143 = 5891;
const int answerNotiC143 = 5892;
const int zhifuNotifiC143 = 5893;

@pragma('vm:entry-point')
backgroundNotfication(NotificationResponse notif) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  JCTzIossssss().shezhiTzCount(JCTzIossssss().huoquTzCount(sp), sp);
}

class JCTzIossssss {
  static final JCTzIossssss _instance = JCTzIossssss._();

  JCTzIossssss._();

  factory JCTzIossssss() {
    return _instance;
  }

  static bool _clickTz = false;

  static bool get clickTz => _clickTz;

  static String title = "";
  static String contentC143 = "";

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  final IOSFlutterLocalNotificationsPlugin _plugin =
  IOSFlutterLocalNotificationsPlugin();

  initNotificationCount() async {
    final String payload = "local";
  }

  List get contents => [
    {"title": "", "content": " Your \$1,000 Has Arrived!"},
    {"title": "", "content": " ⚠️ \$1,000 missing"},
    {"title": "", "content": "Action Required: Finish Your Payout"},
    {"title": "", "content": "Payment Received: \$50.00"},
    {
      "title": "",
      "content": "Come back now or lose your chance to cash out \$1,000.",
    },
    {
      "title": "",
      "content":
      "We are about to cancel your pending reward. Is this a mistake? Tap to reclaim your spins.",
    },
    {"title": "", "content": "Oops? We added too many spins..."},
    {"title": "", "content": "You forgot to unwrap this"},
    {"title": "", "content": "Your daily \$1,000 payout limit is ready."},
    {"title": "", "content": "Private Room Invitation"},
  ];

  void shezhiTzCount(int value, SharedPreferences sp) =>
      sp.setInt(local_ios, value);

  int huoquTzCount(SharedPreferences sp) => sp.getInt(local_ios) ?? 0;

  init() async {
    if(!SSABChange.isPackageB()){
      return;
    }
    await requestNotificationPermission();

    initNotificationCount();

    ssLogggg("=initNotification====init===");

    const InitializationSettings initSettings = InitializationSettings(
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // 点击通知回调
        ssLogggg("点击通知 onDidReceiveNotificationResponse: ${response.payload}");
        tongsongdianji(response.id);
      },
      onDidReceiveBackgroundNotificationResponse: backgroundNotfication,
    );
    NotificationAppLaunchDetails? notificationAppLaunchDetails = await _plugin
        .getNotificationAppLaunchDetails();
    ssLogggg(
      "=initNotification====getNotificationAppLaunchDetails==notificationAppLaunchDetails:$notificationAppLaunchDetails=",
    );

    if (notificationAppLaunchDetails != null) {
      NotificationResponse? notificationResponse =
          notificationAppLaunchDetails.notificationResponse;
      bool didNotificationLaunchApp =
          notificationAppLaunchDetails.didNotificationLaunchApp ?? false;
      _clickTz = didNotificationLaunchApp;
      ssLogggg(
        "点击通知 notificationAppLaunchDetails: didNotificationLaunchApp:${didNotificationLaunchApp} id:${notificationResponse?.id} data:${notificationResponse?.payload}",
      );
      if (didNotificationLaunchApp) {
        tongsongdianji(notificationResponse?.id);
      }
    }
    dingshi();

    fcmtongzhi();
    jiesoutz();
  }

  tongsongdianji(int? tuisongid) {
    String payload = "";
    ssLogggg("====tongsongdianji==tzid:$tuisongid==");
    if (tuisongid == gudingC143) {
      payload = "fix";
    } else if (tuisongid == jianchaNotiC143) {
      payload = "sign";
    } else if (tuisongid == answerNotiC143) {
      payload = "quiz";
    } else if (tuisongid == zhifuNotifiC143) {
      payload = "paypel";
    } else {
      payload = "fix";
    }

    SSEventReporttttt.all_noti_c(source_from: payload);

  }

  Future<bool> requestNotificationPermission() async {
    bool result = await Permission.notification.isGranted;

    if (await Permission.notification.isDenied) {
      PermissionStatus permissionStatus = await Permission.notification
          .request();
      result = permissionStatus == PermissionStatus.granted;
    }
    ssLogggg("==requestNotificationPermission=result:$result");
    return result;
  }

  String pushIcon = "tzimg1";

  Future<void> dingshi() async {

    ssLogggg("==initNotification=_repeatNotification=");
    int length = contents.length;
    int random = Random().nextInt(length);
    String baioti = contents[random]['title'];
    String neirong = contents[random]['content'];
    _plugin.periodicallyShowWithDuration(
      gudingC143,
      SSABChange.isPackageB() ? baioti : "QuizSpark",
      SSABChange.isPackageB() ? neirong : "Come join the quiz!",
      Duration(minutes: 30),
    );
    var datiC = [
      "💰Someone just made a successful withdrawal on QuizMind！",
      "🎁Put your knowledge to work and earn money!",
    ];
    _plugin.periodicallyShowWithDuration(
      answerNotiC143,
      SSABChange.isPackageB() ? "Answer right, Earn Big!" : "QuizSpark",
      SSABChange.isPackageB()
          ? datiC[Random.secure().nextInt(2)]
          : "Come join the quiz!",
      Duration(minutes: 60),
    );
    _plugin.periodicallyShowWithDuration(
      jianchaNotiC143,
      SSABChange.isPackageB() ? "Cash in check daily" : "QuizSpark",
      SSABChange.isPackageB()
          ? "Sign up now and start earning money effortlessly."
          : "Come join the quiz!",
      Duration(minutes: 45),
    );

    _plugin.periodicallyShowWithDuration(
      zhifuNotifiC143,
      SSABChange.isPackageB() ? "Pending withdraw amount" : "QuizSpark",
      SSABChange.isPackageB()
          ? "\$100 has arrived in your account"
          : "Come join the quiz!",
      Duration(minutes: 30),
    );
  }

  Future<void> fcmtongzhi() async {}

  int unlockId = 805;

  Future<void> jiesoutz() async {}

  Future<bool> checkNotificationPermission() async {
    bool result = await Permission.notification.isGranted;
    ssLogggg("==requestNotificationPermission=result:$result");
    return result;
  }
}