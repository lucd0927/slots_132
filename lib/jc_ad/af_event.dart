// import 'dart:convert';
// import 'dart:math';
//
// import 'package:appsflyer_sdk/appsflyer_sdk.dart';
// import 'package:slots_132/hive/sshive.dart';
// import 'package:slots_132/jc_gj/denglugengzhong.dart';
//
//
// import '../jc_gj/firebbbbbb.dart';
// import '../jc_gj/log.dart';
// import '../jc_gj/package.dart';
//
// class PBAfEvent {
//   static Map<String, dynamic>? _innerJson;
//
//   static final Map<String, dynamic> local = {
//     "c117_pv": 5,
//     "c117_pv_else": 8,
//     "c117_ltv0": 0.1,
//     "c117_ltv0_else": 0.2,
//   };
//
//   static _onlineJson() {
//     Map<String, dynamic> localJson = local;
//     try {
//       String name = "ma_kwai_event";
//       String key = PBFireBbbbbb().by(name: name);
//       pbLog("===PBAfEvent afevent: $name string:$key test===");
//
//       Map<String, dynamic> json = jsonDecode(key);
//       localJson = json;
//       pbLog("PBAfEvent afevent: $name json $json");
//     } on Exception catch (e) {
//       pbLog("PBAfEvent afevent onlineJson:$e");
//     }
//
//     pbLog("PBAfEvent afevent: final json ${jsonEncode(localJson)}");
//     return localJson;
//   }
//
//   static double c_kkkk(String key) {
//     _innerJson ??= _onlineJson();
//     _innerJson ??= local;
//     return _innerJson![key] * 1.0 ?? 10.0;
//   }
//
//   static c117_pv(int adCount) {
//     _pv_event("c117_pv", adCount);
//   }
//
//   static ad_impression_total(double adRe) {
//     String adLookCount = "ioualmflkmv";
//     int ccc = ___box.get(adLookCount) ?? 0;
//     int tmpccc = ccc + 1;
//     ___box.put(adLookCount, tmpccc);
//     // adRe = Random().nextDouble() * 0.01;
//     pbLog("==ad_impression_total=adRe:$adRe=tmpccc:$tmpccc");
//     c117_pv(tmpccc);
//     c117_pv_else(tmpccc);
//
//     bool sfJinT = PBLoginGenzhong.isTodayLogin();
//     pbLog("=ad_impression_total= sfJinT:$sfJinT");
//     if (!sfJinT) {
//       reset2ZeroRe("c117_ltv0");
//       reset2ZeroRe("c117_ltv0_else");
//     }
//
//     addTodayRe(adRe);
//
//     c117_ltv0(adRe);
//     c117_ltv0_else(adRe);
//   }
//
//   static _pv_event(String key, int adCount) {
//     String event = key;
//     double tmpData = c_kkkk(event);
//     double tmpAdCount = adCount * 1.0;
//     pbLog(
//       "=ad_impression_total=$event ===tmpData:$tmpData tmpAdCount:$tmpAdCount ",
//     );
//     if (tmpAdCount >= tmpData) {
//       AppsflyerSdk? appsflyerSdk = PBLogicAB.appsflyerSdk();
//       int xxx = tmpData.toInt();
//       pbLog(
//         "=ad_impression_total=$event ===上报 appsflyerSdk:$appsflyerSdk value:$xxx ",
//       );
//
//       appsflyerSdk?.logEvent(event, {
//         "kwai_key_event_action_type": 1,
//         "kwai_key_event_action_value": xxx,
//       });
//       _tba_c117_event(key, xxx);
//     }else{
//       pbLog(
//         "=ad_impression_total=$event ===没有上报 ",
//       );
//     }
//   }
//
//   static _tba_c117_event(String eventName, dynamic count) {
//     // PBWangluo().buryPoint(
//     //   moistValue: eventName,
//     //   veinKey: "kwai_key_event_action_type",
//     //   veinKeyValue: "1",
//     //   veinKey2: "kwai_key_event_action_value",
//     //   veinKeyValue2: "$count",
//     // );
//   }
//
//   static c117_pv_else(int adCount) {
//     String event = "c117_pv_else";
//     _pv_event(event, adCount);
//   }
//
//   static var ___box = PBHive.box;
//   static const String hkToadyRevenue = "hkToadyRevenue_adnask";
//
//   static double todayRe() {
//     double tmp = (___box.get(hkToadyRevenue)?? 0)*1.0 ;
//     return tmp;
//   }
//
//   static void addTodayRe(double re) {
//     double tmmmm = todayRe();
//     double tmpNew = tmmmm + re;
//     ___box.put(hkToadyRevenue, tmpNew);
//   }
//
//   static void reset2ZeroRe(String kkkkk) {
//     ___box.put(hkToadyRevenue, 0.0);
//     ___box.put(kkkkk, null);
//   }
//
//   static c117_ltv0(double adRevenue) {
//     _ltv0("c117_ltv0", adRevenue);
//   }
//
//   static c117_ltv0_else(double adRevenue) {
//     _ltv0("c117_ltv0_else", adRevenue);
//   }
//
//   static _ltv0(String event, double adRevenue) {
//     String kkkkkkk = event;
//     double tmpData = c_kkkk(kkkkkkk);
//     double tmpAdCount = todayRe();
//     pbLog(
//       "=ad_impression_total=$kkkkkkk=tmpAdCount:$tmpAdCount tmpData:$tmpData adRevenue:$adRevenue",
//     );
//     if (tmpAdCount >= tmpData) {
//       var data = ___box.get(kkkkkkk);
//       if (data == null) {
//         ___box.put(kkkkkkk, true);
//         AppsflyerSdk? appsflyerSdk = PBLogicAB.appsflyerSdk();
//         pbLog(
//           "==ad_impression_total=$kkkkkkk ==上报=appsflyerSdk:$appsflyerSdk  ",
//         );
//         appsflyerSdk?.logEvent(kkkkkkk, {
//           "kwai_key_event_action_type": 4,
//           "kwai_key_event_action_value": tmpData,
//         });
//         _tba_c117_event(event, tmpData);
//       } else {
//         pbLog(
//           "==ad_impression_total=$kkkkkkk ==已经上报  ",
//         );
//       }
//     }else{
//       pbLog(
//         "==ad_impression_total=$kkkkkkk ==达不到上报条件  ",
//       );
//     }
//   }
// }
