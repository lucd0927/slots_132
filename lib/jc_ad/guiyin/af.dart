
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/log.dart';




class JcAF{

  static final JcAF _instance = JcAF._();

  factory JcAF() {
    return _instance;
  }

  JcAF._();


  // afDevKey : asdasf1122xadfaf
  // appId: 56564645
  initAppsFlyer({required String afDevKey, required String appId}) async {
    pbLog("======initAppsFlyer====afDevKey:$afDevKey appId:$appId");
    try {
      AppsFlyerOptions dfghdfhdfhg = AppsFlyerOptions(
        afDevKey: afDevKey ?? "应用识别码，产品经理提供",
        appId: appId ?? "iOS平台的 app id （10位数字），产品经理提供，Android应用不传",
        showDebug: true,
        manualStart: true,
        timeToWaitForATTUserAuthorization: 10,
      );
      AppsflyerSdk afSdkkkkkk = AppsflyerSdk(dfghdfhdfhg);
      // JCShijianBaogao.af_req();
      await afSdkkkkkk.initSdk(
        registerOnDeepLinkingCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerConversionDataCallback: true,
      );
      // auto patch 552
      var distinct_id = await FlutterTbaInfo.instance.getDistinctId();

      // 1.AppsFlyer与TBA平台对接
      afSdkkkkkk.setCustomerUserId(distinct_id);
      // 2.应用归因监听

      afSdkkkkkk.onInstallConversionData((p) {
        pbLog(
          "==========initAppsFlyer=进入回调===appsFlyerAdk.onInstallConversionData= data$p",
        );

        final payload = p["payload"];
        if (payload is Map && payload.containsKey("af_status")) {
          String af_status = payload["af_status"] ?? "";
          JCABluoji().guiyin(af_status);
          return;
        }

      });

      afSdkkkkkk.startSDK(
        onSuccess: () {
          pbLog("=initAppsFlyer=appsFlyerAdk:onSuccess==初始化成功");
        },
        onError: (int errorCode, String errorMessage) {
          pbLog(
            "=initAppsFlyer=appsFlyerAdk:onError=初始化失败=errorCode:$errorCode errorMessage:$errorMessage ",
          );
        },
      );
      _appsFlyerAdk = afSdkkkkkk;
      pbLog(
        "======initAppsFlyer===appsFlyerAdk.onInstallConversion==_appsFlyerAdk:$_appsFlyerAdk",
      );
    } catch (e) {
      pbLog("======initAppsFlyer===error:$e");
    }
  }


  static AppsflyerSdk? _appsFlyerAdk;

  static AppsflyerSdk? appsflyerSdk() => _appsFlyerAdk;
}