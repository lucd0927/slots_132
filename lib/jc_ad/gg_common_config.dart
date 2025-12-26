import 'dart:io';

import 'package:slots_132/jc_gj/jc_huanjing/cccc.dart';
import 'package:thinkup_sdk/at_index.dart';
import 'package:applovin_max/applovin_max.dart';

class GGCommonAdsListener {
  final InterstitialListener? interstitialListener;
  final RewardedAdListener? rewardedAdListener;
  final void Function(ATRewardResponse)? atRewardResponse;
  final void Function(ATInterstitialResponse)? atInterstitialResponse;

  GGCommonAdsListener({
    required this.interstitialListener,
    required this.rewardedAdListener,
    required this.atRewardResponse,
    required this.atInterstitialResponse,
  });
}

enum EnumGetScene {
  // daily_treasure(name: "daily treasure"),

  spin(name: "spin"),
  bonus(name: "bonus"),
  single_slots(name: "single_slots"),
  unknow(name: "unknow");

  const EnumGetScene({required this.name});

  final String name;
}

enum EnumAdsPlatform {
  max("max"),
  topon("topon");

  const EnumAdsPlatform(this.name);

  final String name;
}

enum EnumAdsType {
  interstitial("interstitial"),
  reward("reward");

  const EnumAdsType(this.name);

  final String name;
}

class GGCommonJson {
  // 哪种方案 A 老方案 B 新方案
  static const String k_which_scheme = "eyomt_switch";
  static const bool scheme_A = false;
  static const bool scheme_B = true;

  static const String k_out_int = "chaping";
  static const String k_out_rv = "jili";

  // static const String k_int_one_name = "glgns_int_one";
  // static const String k_int_two_name = "glgns_int_two";
  // static const String k_rv_one_name = "glgns_rv_one";
  // static const String k_rv_two_name = "glgns_rv_two";

  // 广告id
  static const String k_ads_id = "ldhjempw";

  // 广告平台 max topon
  static const String k_platfrom = "eoqcdsxf";

  // 广告类型 【interstitial为插屏类型，native为原生类型，reward为激励视频类型】
  static const String k_ad_type = "fwjysnic";
  static const String k_time_out = "hvmcyweh";

  static const String k_ecpm = "ecpm";

  // 广告过期时间

  static const String maxkeyEncode =
      "ydPO/uzqwdTwz/X8yM/WyMXo0vbQ/dXiy7bS/NPe0/DS/NvX/tDTx9vJ4+veyLPv0M/K8L3wt8nby+PN3raw6sbc1tz80uC96+PVwfSzsrWy0NPit8c=";

  // max 平台
  static final String ad_platfrom_max = EnumAdsPlatform.max.name;

  // topon 平台
  static final String ad_platfrom_topon = EnumAdsPlatform.topon.name;

  // 插屏
  static final String ad_type_int = EnumAdsType.interstitial.name;

  // 激励
  static final String ad_type_rv = EnumAdsType.reward.name;

  static Map<String, dynamic> changeLocal(Map<String, dynamic> online) {
    Map<String, dynamic> newLocal = {};

    newLocal['oxocbdkw'] = online['oxocbdkw'];
    newLocal['rywjknyu'] = online['rywjknyu'];
    newLocal[k_which_scheme] = online[k_which_scheme];
    newLocal[k_out_int] = online['eyomt_int'];

    newLocal[k_out_rv] = online['eyomt_rv'];
    return newLocal;
  }

  static var localB = Platform.isIOS
      ? {
          "oxocbdkw": 100,
          "rywjknyu": 100,
          "eyomt_switch": false,
          "eyomt_int": [
            {
              "ldhjempw": "2ff77839ffb8b8a4",
              "eoqcdsxf": "max",
              "fwjysnic": "interstitial",
              "hvmcyweh": 3000,
            },
          ],
          "eyomt_rv": [
            {
              "ldhjempw": "161b263216add44d",
              "eoqcdsxf": "max",
              "fwjysnic": "reward",
              "hvmcyweh": 3000,
            },
          ],
        }
      : {
          "oxocbdkw": 100,
          "rywjknyu": 100,
          "eyomt_switch": false,
          "eyomt_int": [
            {
              "ldhjempw": "cf6ef230700c5753",
              "eoqcdsxf": "max",
              "fwjysnic": "interstitial",
              "hvmcyweh": 3000,
            },
          ],
          "eyomt_rv": [
            {
              "ldhjempw": "ecd48d326f269413",
              "eoqcdsxf": "max",
              "fwjysnic": "reward",
              "hvmcyweh": 3000,
            },
          ],
        };

  static var localTest = {
    "oxocbdkw": 100,
    "rywjknyu": 100,
    "eyomt_switch": true,
    "eyomt_int": [
      {
        "ldhjempw": "67323d496e8d7453",
        "eoqcdsxf": "max",
        "fwjysnic": "interstitial",
        "hvmcyweh": 3000,
      },
    ],
    "eyomt_rv": [
      {
        "ldhjempw": "b00e3491297ec4d0",
        "eoqcdsxf": "max",
        "fwjysnic": "reward",
        "hvmcyweh": 3000,
      },
    ],
  };
  static var localTestIos = {
    "oxocbdkw": 100,
    "rywjknyu": 100,
    "eyomt_switch": true,
    "eyomt_int": [
      {
        "ldhjempw": "42002dc450d2c09e",
        "eoqcdsxf": "max",
        "fwjysnic": "interstitial",
        "hvmcyweh": 3000,
      },
    ],
    "eyomt_rv": [
      {
        "ldhjempw": "88eff2c28bf48703",
        "eoqcdsxf": "max",
        "fwjysnic": "reward",
        "hvmcyweh": 3000,
      },
    ],
  };

  static var localTopon = {
    "doubqzaq": 100,
    "ddixmpdd": 100,
    "cdyun_switch": false,
    "cdyun_int": [
      {
        "lhewiloc": "n1grn4hvvceb6r",
        "vvmmyknm": "topon",
        "jpburjoz": "interstitial",
        "nohbmlex": 3000,
      },
    ],
    "cdyun_rv": [
      {
        "lhewiloc": "n1grn4hvvcf4pn",
        "vvmmyknm": "topon",
        "jpburjoz": "reward",
        "nohbmlex": 3000,
      },
    ],
  };

  static var local = SSHuanjing.hasDevvvvv() ? localTestIos : localB;
}
