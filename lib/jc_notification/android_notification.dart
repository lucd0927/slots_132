import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_gj/jc_huanjing/cccc.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';

// 顶层方法（不能在类里）
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   pbLog("后台收到 FCM 消息: ${message.messageId}");
//   // 这里可以做数据处理、存储、触发本地通知等
// }

@pragma('vm:entry-point')
void backgourdListener(NotificationResponse ntftRse) {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: avoid_print
  print(
    '点击通知 notificationTapBackground (${ntftRse.id}) action tapped: '
    '${ntftRse.actionId} with'
    ' payload: ${ntftRse.payload}',
  );
}

class SSTzNotificattttt {
  static final SSTzNotificattttt _shli = SSTzNotificattttt._();

  SSTzNotificattttt._();

  factory SSTzNotificattttt() {
    return _shli;
  }

  static bool _dianjTzzzz = false;

  static bool get clickTz => _dianjTzzzz;

  static String baioti = "";
  static String neirong = "";

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidFlutterLocalNotificationsPlugin
  androidFlutterLocalNotificationsPlugin =
      AndroidFlutterLocalNotificationsPlugin();

  csTzNum() async {
    final String payload = "local";
    try {
      int localN = await AndroidFlutterLocalNotificationsPlugin()
          .extractMessageReceivedNum("local");
      ssLogggg("==initNotificationCount==localcount:$localN==");
      if (localN > 0) {
        for (int i = 0; i < localN; i++) {
          SSEventReporttttt.all_noti_t(source_from: "local");
        }
      }

      int fcmNnnn = await AndroidFlutterLocalNotificationsPlugin()
          .extractMessageReceivedNum("fcm");
      ssLogggg("==initNotificationCount==fcmcount:$fcmNnnn==");
      if (fcmNnnn > 0) {
        for (int i = 0; i < localN; i++) {
          SSEventReporttttt.all_noti_t(source_from: "data_fcm");
        }
      }

      int lockNnnn = await AndroidFlutterLocalNotificationsPlugin()
          .extractMessageReceivedNum("unlock");
      ssLogggg("==initNotificationCount==unlockcount:$lockNnnn==");
      if (lockNnnn > 0) {
        for (int i = 0; i < localN; i++) {
          SSEventReporttttt.all_noti_t(source_from: "lock");
        }
      }
    } catch (e) {
      ssLogggg("===initNotificationCount==error:$e=");
    }
  }

  List get contents => [
    {"title": "", "content": "Payout Complete: Your \$1,000 Has Arrived!"},
    {"title": "", "content": "KA-CHING! Your \$1,000 Just Hit Your Account!"},
    {"title": "", "content": "Payout Ready! Click to Secure Your Cash! 💰"},
    {
      "title": "",
      "content": "\$1K Status Check: Time to Claim Your Daily Share! 👑",
    },
    {
      "title": "",
      "content": "Final Shard Located! Tap to Forge Your iPhone! 🔨",
    },
    {
      "title": "",
      "content": "You're a Cashout King! View Your Transaction History. ✅",
    },
    {
      "title": "",
      "content": "Your Elves Are Full! Collect Your Factory Earnings Now! 🏭",
    },
    {"title": "", "content": "XP Boost Active! Spin Now to Hit Level 100! ✨"},
    {
      "title": "",
      "content": "10th Anniv. Offer ENDS TODAY! Tap for Final Deal! ⏳",
    },
    {
      "title": "",
      "content": "VIP Partner Invite Closing Soon! Don't Miss Out! 💸",
    },
  ];

  List get imgTz => [
    "tzimg1",
    "tzimg1",
    "tzimg1",
    "tzimg1",
    "tzimg1",
    "tzimg1",
  ];

  List<T> getRandomNMinus3<T>(List<T> source) {
    if (source.length <= 3) {
      throw ArgumentError('数组长度必须大于 3');
    }

    final list = List<T>.from(source); // 拷贝一份，避免修改原数组
    list.shuffle(Random()); // 随机打乱
    return list.sublist(0, 3);
  }

  init() async {
    await requestNotificationPermission();
    csTzNum();

    baioti = "132Title";
    neirong = "content";

    ssLogggg("=initNotification====init===");
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher'); // 通知图标

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // 点击通知回调
        print("点击通知 onDidReceiveNotificationResponse: ${response.payload}");
        String payload = response.payload ?? "local";
        tongsongdianji(response.id);
      },
      onDidReceiveBackgroundNotificationResponse: backgourdListener,
    );
    NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await AndroidFlutterLocalNotificationsPlugin()
            .getNotificationAppLaunchDetails();
    ssLogggg(
      "=initNotification====getNotificationAppLaunchDetails==notificationAppLaunchDetails:$notificationAppLaunchDetails=",
    );

    if (notificationAppLaunchDetails != null) {
      NotificationResponse? notificationResponse =
          notificationAppLaunchDetails.notificationResponse;
      bool didNotificationLaunchApp =
          notificationAppLaunchDetails.didNotificationLaunchApp ?? false;
      _dianjTzzzz = didNotificationLaunchApp;
      print(
        "点击通知 notificationAppLaunchDetails: didNotificationLaunchApp:${didNotificationLaunchApp} id:${notificationResponse?.id} data:${notificationResponse?.payload}",
      );
      if (didNotificationLaunchApp) {
        tongsongdianji(notificationResponse?.id);
      }
    }
    List newContents = getRandomNMinus3(contents);
    List tzimages = getRandomNMinus3(imgTz);
    // print("=====newContents:$newContents");
    dingshi(
      id: dingshitzid,
      minutes: SSHuanjing.hasDevvvvv() ? 1 : 30,
      title: newContents[0]['content'],
      content: newContents[0]['content'],
      tzimage: tzimages[0],
    );
    dingshi(
      id: dingshitzid2,
      minutes: SSHuanjing.hasDevvvvv() ? 2 : 60,
      title: newContents[1]['content'],
      content: newContents[1]['content'],
      tzimage: tzimages[1],
    );
    dingshi(
      id: dingshitzid3,
      minutes: SSHuanjing.hasDevvvvv() ? 3 : 90,
      title: newContents[2]['content'],
      content: newContents[2]['content'],
      tzimage: tzimages[2],
    );
    fcmtongzhi();
    jiesoutz();
  }

  tongsongdianji(int? tuisongid) {
    String payload = "";
    print("====tongsongdianji==tzid:$tuisongid==");
    if (tuisongid == unlockId) {
      payload = "lock";
    } else if (tuisongid == dingshitzid ||
        tuisongid == dingshitzid2 ||
        tuisongid == dingshitzid3) {
      payload = "local";
    } else {
      payload = "fcm";
    }
    SSEventReporttttt.all_noti_c(source_from:payload);
    // PBMaiDian.launch_page(veinKeyValue: "push");
    // PBMaiDian.inform_c(veinKeyValue: payload);
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

  int dingshitzid = 6667;
  int dingshitzid2 = 6668;
  int dingshitzid3 = 6669;
  String pushIcon = "tzimg1";

  Future<void> dingshi({
    required int id,
    required int minutes,

    required String title,
    required String content,
    required String tzimage,
  }) async {
    ssLogggg(
      "==initNotification=_repeatNotification===id:$id minutes:$minutes",
    );
    //自定义通知ID
    // id = dingshitzid;

    AndroidNotificationDetails details = AndroidNotificationDetails(
      'channelId:$id',
      'repeat:$id',
      styleInformation: BeautyStyleInformation(
        title,
        content,
        tzimage,
        'Go Earn',
        'ic_launcher',
      ),
      priority: Priority.high,
      importance: Importance.high,
      //“groupKey”：防止通知被系统折叠
      groupKey: "$id",
      ongoing: true,
    );
    await AndroidFlutterLocalNotificationsPlugin().periodicallyShowWithDuration(
      id,
      title,
      content,
      //间隔时长根据需求设置
      Duration(minutes: minutes),
      notificationDetails: details,
      scheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: "local",
    );
  }

  Future<void> fcmtongzhi() async {
    try {
      bool? result = await AndroidFlutterLocalNotificationsPlugin()
          .subscribeToTopic(
            "c117fcm_piggy_br",
            AndroidNotificationDetails(
              'pbccasd',
              'fcm_notification',
              styleInformation: BeautyStyleInformation(
                '',
                '',
                pushIcon,
                'Go Earn',
                'ic_launcher',
              ),
              priority: Priority.high,
              importance: Importance.high,
            ),
          );
      ssLogggg("==initNotification=_subscribeFcmTopic===$result");
    } catch (e) {
      ssLogggg("==initNotification=_subscribeFcmTopic=error==$e");
    }
  }

  int unlockId = 805;

  Future<void> jiesoutz() async {
    //自定义通知ID
    int id = unlockId;
    int length = contents.length;
    int random = Random().nextInt(length);

    var tttttt = contents[random]['content'];
    var ccccc = contents[random]['content'];
    await AndroidFlutterLocalNotificationsPlugin().showBroadcastNotification(
      id,
      tttttt,
      ccccc,
      //两次发送解锁通知的间隔，根据需求设置
      SSHuanjing.hasDevvvvv() ? Duration(seconds: 5) : Duration(minutes: 15),
      'android.intent.action.USER_PRESENT',
      AndroidNotificationDetails(
        'sslots',
        'unlock:$id',
        priority: Priority.high,
        importance: Importance.max,
        styleInformation: BeautyStyleInformation(
          tttttt,
          ccccc,
          pushIcon,
          'Go Earn',
          'ic_launcher',
        ),
        //“groupKey”：防止通知被系统折叠
        groupKey: "$id",
      ),
      'unlock',
    );
  }

  Future<bool> checkNotificationPermission() async {
    bool result = await Permission.notification.isGranted;
    ssLogggg("==requestNotificationPermission=result:$result");
    return result;
  }
}
