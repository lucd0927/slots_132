// import 'package:birdsong/birdsong.dart';
// import 'package:get/get.dart';
//
// import 'package:permission_handler/permission_handler.dart';
// import 'package:piggyboost117/jc_gj/index.dart';
//
// import '../jc_huanjing/config.dart';
// import '../jc_net/event_report.dart';
//
//
//
// class PBTongzhizzzzzz {
//
//   static bool _clickTz = false;
//   static bool get clickTz => _clickTz;
//   List get contents => [
//     {
//       "title": "tzT1".tr,
//       "content": "tzC1".tr,
//     },
//     {
//       "title": "tzT2".tr,
//       "content": "tzC2".tr,
//     },
//     {
//       "title": "tzT3".tr,
//       "content": "tzC3".tr,
//     },
//     {
//       "title": "tzT4".tr,
//       "content": "tzC4".tr,
//     },
//     {
//       "title": "tzT5".tr,
//       "content": "tzC5".tr,
//     },
//
//   ];
//
//   List<BirdsongText> get pushContents {
//     List<BirdsongText> tmpData = [];
//
//     for (var value in contents) {
//       String title = value['title'];
//       String content = value['content'];
//       BirdsongText tmpBirdsongText = BirdsongText(title: title, body: content);
//       tmpData.add(tmpBirdsongText);
//     }
//
//     return tmpData;
//   }
//
//   init() async {
//     BirdsongImage image = BirdsongImage(big: 'tongzhibg',small: 'tongzhibg_small');
//     pbLog("==PBTongzhizzzzzz=init");
//     await Birdsong.instance.initialize(image: image, button: "Claim");
//     await requestNotificationPermission();
//     // pbLog("==PBTongzhizzzzzz=has");
//     // bool hasTz = await Birdsong.instance.has();
//     // if (!hasTz) {
//     //   pbLog("==PBTongzhizzzzzz=request");
//     //   Birdsong.instance.request(allowGotoSettings: false);
//     // }
//
//     List<BirdsongText> content = pushContents;
//     pbLog("==PBTongzhizzzzzz=present");
//     // 解锁
//     Birdsong.instance.present(content: content, duration: Duration(minutes: PBPeizhi.isDEV()?1:2));
//     pbLog("==PBTongzhizzzzzz=repeat");
//     // 定时
//     Birdsong.instance.repeat(content: content, duration: Duration(minutes: PBPeizhi.isDEV()?1:30));
//     pbLog("==PBTongzhizzzzzz=subscribe");
//     // 主题
//     Birdsong.instance.subscribe(topic: PBPeizhi.isDEV()?"c106xxxx":"c106fcm_card").then((value){
//       pbLog("==PBTongzhizzzzzz=subscribe result:$value");
//     });
//
//     // 点击
//     Birdsong.instance.onTap.listen((BirdsongResponse data) {
//       pbLog("==onTap===data:${data.source}=");
//       _clickTz = true;
//       pbLog("==onTap=====hasClickTz:$_clickTz");
//
//       pushClick(data.source);
//     });
//     // 触发
//     Birdsong.instance.onTrigger.listen((BirdsongResponse data) {
//       pbLog("==onTrigger===data:${data.source}=");
//       pushTrigger(data.source);
//     });
//   }
//
//   pushTrigger(String source) {
//     String payload = "local";
//     if (source == "repeat") {
//       payload = "local";
//     } else if (source == "present") {
//       payload = "unlock";
//     } else if (source == "firebase") {
//       payload = "fcm";
//     }
//     PBMaiDian.inform_p(veinKeyValue: payload);
//   }
//
//   pushClick(String source) {
//     String payload = "local";
//     if (source == "repeat") {
//       payload = "local";
//     } else if (source == "present") {
//       payload = "unlock";
//     } else if (source == "firebase") {
//       payload = "fcm";
//     }
//
//     PBMaiDian.launch_page(veinKeyValue: "push");
//     PBMaiDian.inform_c(veinKeyValue: payload);
//   }
//
//   Future<bool> requestNotificationPermission() async {
//     bool result = await Permission.notification.isGranted;
//
//     if (await Permission.notification.isDenied) {
//       PermissionStatus permissionStatus = await Permission.notification
//           .request();
//       result = permissionStatus == PermissionStatus.granted;
//     }
//     pbLog("==requestNotificationPermission=result:$result");
//     return result;
//   }
//
//   Future<bool> checkNotificationPermission() async {
//     bool result = await Permission.notification.isGranted;
//     pbLog("==requestNotificationPermission=result:$result");
//     return result;
//   }
// }
