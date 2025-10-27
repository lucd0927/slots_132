import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
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
          // PBMaiDian.inform_p(veinKeyValue: "local");
        }
      }

      int fcmNnnn = await AndroidFlutterLocalNotificationsPlugin()
          .extractMessageReceivedNum("fcm");
      ssLogggg("==initNotificationCount==fcmcount:$fcmNnnn==");
      if (fcmNnnn > 0) {
        for (int i = 0; i < localN; i++) {
          // PBMaiDian.inform_p(veinKeyValue: "fcm");
        }
      }

      int lockNnnn = await AndroidFlutterLocalNotificationsPlugin()
          .extractMessageReceivedNum("unlock");
      ssLogggg("==initNotificationCount==unlockcount:$lockNnnn==");
      if (lockNnnn > 0) {
        for (int i = 0; i < localN; i++) {
          // PBMaiDian.inform_p(veinKeyValue: "unlock");
        }
      }
    } catch (e) {
      ssLogggg("===initNotificationCount==error:$e=");
    }
  }

  List get contents => [

  ];

  List get imgTz => [

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

    int length = contents.length;
    int random = Random().nextInt(length);
    int length2 = imgTz.length;
    int random2 = Random().nextInt(length2);
    pushIcon = imgTz[random2];
    baioti = contents[random]['title'];
    neirong = contents[random]['content'];

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
    print("=====newContents:$newContents");
    dingshi(
      id: dingshitzid,
      minutes: SSHuanjing.hasDevvvvv() ? 1 : 30,
      title: newContents[0]['title'],
      content: newContents[0]['content'],
      tzimage: tzimages[0],
    );
    dingshi(
      id: dingshitzid2,
      minutes: SSHuanjing.hasDevvvvv() ? 2 : 60,
      title: newContents[1]['title'],
      content: newContents[1]['content'],
      tzimage: tzimages[1],
    );
    dingshi(
      id: dingshitzid3,
      minutes: SSHuanjing.hasDevvvvv() ? 3 : 90,
      title: newContents[2]['title'],
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
      payload = "unlock";
    } else if (tuisongid == dingshitzid ||
        tuisongid == dingshitzid2 ||
        tuisongid == dingshitzid3) {
      payload = "local";
    } else {
      payload = "fcm";
    }
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

  int dingshitzid = 5654;
  int dingshitzid2 = 5655;
  int dingshitzid3 = 5656;
  String pushIcon = "tzimg1";

  Future<void> dingshi({
    required int id,
    required int minutes,

    required String title,
    required String content,
    required String tzimage,
  }) async {
    ssLogggg("==initNotification=_repeatNotification===id:$id minutes:$minutes");
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

    var tttttt = contents[random]['title'];
    var ccccc = contents[random]['content'];
    await AndroidFlutterLocalNotificationsPlugin().showBroadcastNotification(
      id,
      tttttt,
      ccccc,
      //两次发送解锁通知的间隔，根据需求设置
      SSHuanjing.hasDevvvvv() ? Duration(seconds: 5) : Duration(minutes: 15),
      'android.intent.action.USER_PRESENT',
      AndroidNotificationDetails(
        'pbwwww',
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
