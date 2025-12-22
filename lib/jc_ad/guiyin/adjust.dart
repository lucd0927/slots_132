import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_ad_revenue.dart';
import 'package:adjust_sdk/adjust_attribution.dart';
import 'package:adjust_sdk/adjust_config.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:slots_132/jc_ad/gg_common_config.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/jc_huanjing/cccc.dart';
import 'package:slots_132/jc_gj/log.dart';

class SSAdjust {
  static const String TGA = "SSAdjust";
  static final SSAdjust _instance = SSAdjust._();

  factory SSAdjust() {
    return _instance;
  }

  SSAdjust._();

  AdjustConfig? adjustConfig() => _config;

  AdjustConfig? _config;

  initSdk(String appToken) async {
    // 在进行测试时，应当确保将环境设置为 AdjustEnvironment.sandbox 。请在向应用商店提交应用前将此设为 AdjustEnvironment.production。
    AdjustConfig config = AdjustConfig(
      appToken,
      SSHuanjing.hasDevvvvv()
          ? AdjustEnvironment.sandbox
          : AdjustEnvironment.production,
    );
    config.logLevel = AdjustLogLevel.verbose;
    var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
    // config.externalDeviceId =distinct_id;
    ssLogggg("$TGA===initSdk=");
    _config = config;
    Adjust.addGlobalCallbackParameter("customer_user_id", distinct_id);
    config.attributionCallback = (AdjustAttribution attributionChangedData) {
      ssLogggg('$TGA: Attribution changed!');

      if (attributionChangedData.trackerToken != null) {
        ssLogggg(
          '$TGA: Tracker token: ${attributionChangedData!.trackerToken ?? ""}',
        );
      }
      if (attributionChangedData.trackerName != null) {
        ssLogggg('$TGA: Tracker name: ${attributionChangedData.trackerName}');
      }
      if (attributionChangedData.campaign != null) {
        ssLogggg('$TGA: Campaign: ${attributionChangedData.campaign}');
      }
      String? network = attributionChangedData.network;
      if (network != null) {
        ssLogggg('$TGA: Network: ${network}');
        // JCABluoji().guiyin(network);
      }
      if (attributionChangedData.creative != null) {
        ssLogggg('$TGA: Creative: ${attributionChangedData.creative}');
      }
      if (attributionChangedData.adgroup != null) {
        ssLogggg('$TGA: Adgroup: ${attributionChangedData.adgroup}');
      }
      if (attributionChangedData.clickLabel != null) {
        ssLogggg('$TGA: Click label: ${attributionChangedData.clickLabel}');
      }
      if (attributionChangedData.fbInstallReferrer != null) {
        ssLogggg(
          '$TGA: facebook install referrer: ${attributionChangedData.fbInstallReferrer}',
        );
      }
      if (attributionChangedData.jsonResponse != null) {
        ssLogggg('$TGA: JSON Response: ${attributionChangedData.jsonResponse}');
      }
    };

    Adjust.initSdk(config);

    Adjust.getAttribution().then((attributionChangedData) {
      String? network = attributionChangedData.network;
      ssLogggg("$TGA====network:$network");
      SSABChange().guiyin(network ?? "");
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
