import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foreground_service_gp/foreground_service_gp.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_gj/jc_huanjing/cccc.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';

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
          SSEventReporttttt.all_noti_t(source_from: "time");
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
          .extractMessageReceivedNum("lock");
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

  List get imgTz => [
    "tzimg1",
    "tzimg2",
    "tzimg3",
    "tzimg4",
    "tzimg5",
    "tzimg6",
    "tzimg7",
    "tzimg8",
    "tzimg9",
    "tzimg10",
  ];

  List<T> getRandomNMinus4<T>(List<T> source) {
    if (source.length <= 4) {
      throw ArgumentError('数组长度必须大于 3');
    }

    final list = List<T>.from(source); // 拷贝一份，避免修改原数组
    list.shuffle(Random()); // 随机打乱
    return list.sublist(0, 4);
  }

  init() async {
    bool result = await requestNotificationPermission();
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
        tongsongdianji(payload);
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
        tongsongdianji(notificationResponse?.payload);
      }
    }
    List newContents = getRandomNMinus4(contents);
    List tzimages = getRandomNMinus4(imgTz);
    ssLogggg("====newContents:$newContents=tzimages:$tzimages");
    dingshi(
      id: dingshitzid,
      minutes: SSHuanjing.hasDevvvvv() ? 1 : 29,
      title: newContents[0]['content'],
      content: newContents[0]['content'],
      tzimage: tzimages[0],
    );
    dingshi(
      id: dingshitzid2,
      minutes: SSHuanjing.hasDevvvvv() ? 2 : 47,
      title: newContents[1]['content'],
      content: newContents[1]['content'],
      tzimage: tzimages[1],
    );
    dingshi(
      id: dingshitzid3,
      minutes: SSHuanjing.hasDevvvvv() ? 3 : 73,
      title: newContents[2]['content'],
      content: newContents[2]['content'],
      tzimage: tzimages[2],
    );
    dingshi(
      id: dingshitzid4,
      minutes: SSHuanjing.hasDevvvvv() ? 4 : 103,
      title: newContents[3]['content'],
      content: newContents[3]['content'],
      tzimage: tzimages[2],
    );
    fcmtongzhi();
    jiesoutz();
    ssLogggg("====result:$result=前台服务启动");
    if (result) {
      ssLogggg("=====前台服务启动");
      ForegroundServiceGp().initListener(() {
        ssLogggg("=====收到点击事件");
        SSEventReporttttt.all_noti_c(source_from: "fixed");
      });

      double tmpMooon = SSHive.box.get(MainController.hkMonnnn) ?? 1000;
      ForegroundServiceGp()
          .start(
            title:
                "My Cash = ${SSCountry.curGuojiaFuhao()}${tmpMooon.toStringAsFixed(0)}",
            content: "Withdraw",
            imgNameBg: "tzp",
            imgNameSmall: "tzps",
          )
          .then((result) {
            if (result == true) {
              SSEventReporttttt.all_noti_t(source_from: "fixed");
            }
          });
    }
  }

  tongsongdianji(String? tuisongid) {
    String payload = "";
    print("====tongsongdianji==tzid:$tuisongid==");
    if (tuisongid == "lock") {
      payload = "lock";
    } else if (tuisongid == "local") {
      payload = "time";
    } else if (tuisongid == "fixed") {
      payload = "fixed";
    } else {
      payload = "fcm";
    }
    SSEventReporttttt.all_noti_c(source_from: payload);
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
  int dingshitzid4 = 6670;
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
      // ongoing: true,
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
            "c132fcm_1",
            AndroidNotificationDetails(
              'slots_1',
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

      bool? result2 = await AndroidFlutterLocalNotificationsPlugin()
          .subscribeToTopic(
            "c132fcm_2",
            AndroidNotificationDetails(
              'slots_1',
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
      ssLogggg(
        "==initNotification=_subscribeFcmTopic===$result result2=:$result2",
      );
    } catch (e) {
      ssLogggg("==initNotification=_subscribeFcmTopic=error==$e");
    }
  }

  int unlockId = 8777;

  Future<void> jiesoutz() async {
    //自定义通知ID
    int id = unlockId;
    int length = contents.length;
    int random = Random().nextInt(length);
    List tzimages = getRandomNMinus4(imgTz)..shuffle();
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
          tzimages[0],
          'Go Earn',
          'ic_launcher',
        ),
        //“groupKey”：防止通知被系统折叠
        groupKey: "$id",
      ),
      'lock',
    );
  }

  Future<bool> checkNotificationPermission() async {
    bool result = await Permission.notification.isGranted;
    ssLogggg("==requestNotificationPermission=result:$result");
    return result;
  }
}
