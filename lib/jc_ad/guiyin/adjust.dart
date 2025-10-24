import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_ad_revenue.dart';
import 'package:adjust_sdk/adjust_attribution.dart';
import 'package:adjust_sdk/adjust_config.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:slots_132/jc_ad/gg_common_config.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/log.dart';


class JcAdjust {
  static const String TGA = "JcAdjust";
  static final JcAdjust _instance = JcAdjust._();

  factory JcAdjust() {
    return _instance;
  }

  JcAdjust._();

  AdjustConfig? adjustConfig() => _config;

  AdjustConfig? _config;

  initSdk(String appToken) async {
    // 在进行测试时，应当确保将环境设置为 AdjustEnvironment.sandbox 。请在向应用商店提交应用前将此设为 AdjustEnvironment.production。
    AdjustConfig config = AdjustConfig(appToken, AdjustEnvironment.production);
    config.logLevel = AdjustLogLevel.verbose;
    var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
    // config.externalDeviceId =distinct_id;
    pbLog("$TGA===initSdk=");
    _config = config;
    Adjust.addGlobalCallbackParameter("customer_user_id", distinct_id);
    config.attributionCallback = (AdjustAttribution attributionChangedData) {
      pbLog('$TGA: Attribution changed!');

      if (attributionChangedData.trackerToken != null) {
        pbLog(
          '$TGA: Tracker token: ${attributionChangedData!.trackerToken ?? ""}',
        );
      }
      if (attributionChangedData.trackerName != null) {
        pbLog('$TGA: Tracker name: ${attributionChangedData.trackerName}');
      }
      if (attributionChangedData.campaign != null) {
        pbLog('$TGA: Campaign: ${attributionChangedData.campaign}');
      }
      String? network = attributionChangedData.network;
      if (network != null) {
        pbLog('$TGA: Network: ${network}');
        // JCABluoji().guiyin(network);
      }
      if (attributionChangedData.creative != null) {
        pbLog('$TGA: Creative: ${attributionChangedData.creative}');
      }
      if (attributionChangedData.adgroup != null) {
        pbLog('$TGA: Adgroup: ${attributionChangedData.adgroup}');
      }
      if (attributionChangedData.clickLabel != null) {
        pbLog('$TGA: Click label: ${attributionChangedData.clickLabel}');
      }
      if (attributionChangedData.fbInstallReferrer != null) {
        pbLog(
          '$TGA: facebook install referrer: ${attributionChangedData.fbInstallReferrer}',
        );
      }
      if (attributionChangedData.jsonResponse != null) {
        pbLog('$TGA: JSON Response: ${attributionChangedData.jsonResponse}');
      }
    };

    Adjust.initSdk(config,);


    Adjust.getAttribution().then((attributionChangedData){
      String? network = attributionChangedData.network;
      pbLog("$TGA====network:$network");
      JCABluoji().guiyin(network??"");
    });
    // JCShijianBaogao.adjust_req();



  }

  adjustRevenue({
    required final String network,
    required final String currency,
    required final double value,
    required final EnumAdsPlatform source,
  }) {
    String adSource = "applovin_max_sdk";

    if (source == EnumAdsPlatform.max) {
      adSource = "applovin_max_sdk";
    } else if (source == EnumAdsPlatform.topon) {
      adSource = "topon_sdk";
    }

    AdjustAdRevenue adjustAdRevenue = AdjustAdRevenue(adSource);
    adjustAdRevenue.setRevenue(value, currency);
    adjustAdRevenue.adRevenueNetwork = network;
    Adjust.trackAdRevenue(adjustAdRevenue);
  }
}