import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:slots_132/jc_gj/base_utils.dart';
import 'package:slots_132/jc_ad/guiyin/firebbbbbb.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_net/wangluo.dart';


import 'package:tuple/tuple.dart';


import 'dsf/pbpig.dart';

class PBFk {
  static bool _hasDanger = false;

  static bool get hasDanger => _hasDanger;
  static bool _hasRequestNet = false;

  static bool get hasRequestNet => _hasRequestNet;
  static String encryptTxt =
      "ODMCAjEkLD8+Gi88HQMWOzQkMDc3JDQxJgI0AiY0Pzc0OCwZQT4WDxcNJCwWJzY6EiY9RRkPJwETADxaHxMTLTotBT0gLScjGEY2JxwMOzlBOEAgRSMMRgQ2Xj06Q0FaFEQvL0czMxY+OTJDTBo6AyAeNgA4B0U2NAIwNDQkSEg=";
  static int code = 117;

  static Future initNumberUnit() async {
    try {
      var src = PBBaseUtils.decrypt(encryptTxt, code);
      pbLog("=====key:$src");
      await Pbpig.instance.initddddNumsssberUdddnit(apiKey: src);

      __onlineJson();
      pbLog("==__onlineJson:$_onlineJson====");
      bool hasNeedDevice = needUidevice();
      bool hasNeedShemeng = needUinumber();
      bool hasNeedBehavior = needUibehavior();
      pbLog("==hasNeedDevice:$hasNeedDevice====");
      maidian();
      if (hasNeedDevice) {
        await deviceErr();
      }
      if (!_hasDanger) {
        if (hasNeedShemeng) {
          await shumeng();
        }
      }

      if (!_hasDanger) {
        if (hasNeedBehavior) {}
      }
    } catch (e) {
      pbLog("===initNumberUnit=error=$e");
    }
  }

  static getNumberUnitID() async {
    final did = await Pbpig.instance.getNaaaaufffbedddrUnitID(
      channel: "shumeng_117",
      message: "shumeng_msg",
    );
    pbLog("====did===$did");
    return did;
  }

  static ip() async {
    Response? data = await PBWangluo().post(
      "https://ip-prod.piggybankboostreward.com/api/cape",
      data: {"androidId": "alion"},
    );

    var responseData = data?.data??"";
    var dess = decrypt(responseData, 16);
    var jsonData = jsonDecode(dess);
    pbLog("==ip===$dess==");
    if (jsonData is Map) {
      String key = "bduck";
      var hasBanned = jsonData[key] ?? false;
      return hasBanned;
    }

    return false;
  }

  //“key”：示例图片中“encrypt”字段下的“key”字段的值
  static String decrypt(String encrypted, int key) {
    final decode = base64.decode(encrypted);
    final decode2 = decode.toList();
    List<int> xorList = [];
    for (int i = 0; i < decode2.length; i++) {
      xorList.add(decode2[i] ^ key);
    }
    return utf8.decode(xorList);
  }

  static Future<bool> shumeng({int count = 0}) async {
    var did = await getNumberUnitID();
    try {
      Response? data = await PBWangluo().post(
        "https://sg-ddi.shuzilm.cn/q",
        data: {
          "protocol": 2,
          "did": "$did",
          "pkg": "com.piggybank.boostreward.pro",
        },
      );

      pbLog("==shumeng==data:${data?.data}=");
      var responseData = data?.data;
      if (responseData is Map) {
        bool err = responseData['err'] == 0;
        bool device_type = responseData['device_type'] != 0;
        bool result = err && device_type;
        _hasDanger = result;
        _hasRequestNet = true;
        pbLog("==shumeng==_hasDanger:${_hasDanger}=");
        if (_hasDanger) {
          risk_chance(value: "number");
        }

        return result;
      }
      // _hasDanger = false;
      _hasRequestNet = false;
      return false;
    } catch (e) {
      count = count + 1;
      _hasRequestNet = false;
      pbLog("===shumeng net=error=count:$count=");
      return false;
    }
  }

  static maidian() async {
    try {
      bool hasContainerRoot = await rootChajian();
      pbLog("=maidian==hasContainerRoot:$hasContainerRoot==");
      session_custom(name: "root", value: hasContainerRoot ? "1" : "0");

      bool hasContainervpn = await vpnChajian();
      pbLog("=maidian==hasContainervpn:$hasContainervpn==");
      session_custom(name: "vpn", value: hasContainervpn ? "1" : "0");

      bool hasContainersim = await simChajian();
      pbLog("=maidian==hasContainersim:$hasContainersim==");
      session_custom(name: "sim", value: hasContainersim ? "1" : "0");

      bool hasContainersimulator = await simulatorChajian();
      pbLog("=maidian==hasContainersimulator:$hasContainersimulator==");
      session_custom(
        name: "simulator",
        value: hasContainersimulator ? "1" : "0",
      );

      bool hasContainergoogleplay = await storeChajian();
      pbLog("=maidian==hasContainergoogleplay:$hasContainergoogleplay==");
      session_custom(
        name: "googleplay",
        value: hasContainergoogleplay ? "1" : "0",
      );

      bool hasContainerdeveloper = await developerChajian();
      pbLog("=maidian==hasContainerdeveloper:$hasContainerdeveloper==");
      session_custom(
        name: "developer",
        value: hasContainerdeveloper ? "1" : "0",
      );

      pbLog(
        "=风控=root:$hasContainerRoot===vpn:$hasContainervpn=sim:$hasContainersim=simulator:$hasContainersimulator googleplay:$hasContainergoogleplay developer:$hasContainerdeveloper",
      );
    } catch (e) {
      pbLog("===maidian=error==$e");
    }
  }

  static Future<bool> rootChajian() async {
    bool hasxxx = await Pbpig.instance.rttttt();
    return hasxxx;
  }

  static Future<bool> vpnChajian() async {
    bool hasxxx = await Pbpig.instance.vpppppn();
    return hasxxx;
  }

  static Future<bool> simChajian() async {
    bool hasxxx = await Pbpig.instance.sicccccm();
    return hasxxx;
  }

  static Future<bool> simulatorChajian() async {
    bool hasxxx = await Pbpig.instance.sicccccmulator();
    return hasxxx;
  }

  static Future<bool> storeChajian() async {
    bool hasxxx = await Pbpig.instance.stoooxxxre();
    return hasxxx;
  }

  static Future<bool> developerChajian() async {
    bool hasxxx = await Pbpig.instance.dessssvewwwloffffper();
    return hasxxx;
  }

  static Future<void> initNumberUnitChajian(String key) async {
    await Pbpig.instance.initddddNumsssberUdddnit(apiKey: key);
  }

  static Future<String> getNumberUnitIDChajian() async {
    var hasxxx = await Pbpig.instance.getNaaaaufffbedddrUnitID();
    return hasxxx;
  }

  static Future<bool> deviceErr() async {
    try {
      List<String> panduanShebei = devices();

      bool hasContainerRoot = panduanShebei.contains("root");

      bool hasContainervpn = panduanShebei.contains("vpn");

      bool hasContainersim = panduanShebei.contains("sim");

      bool hasContainersimulator = panduanShebei.contains("simulator");

      bool hasContainergoogleplay = panduanShebei.contains("googleplay");

      bool hasContainerdeveloper = panduanShebei.contains("developer");

      bool hasContainerip = panduanShebei.contains("ip");
      pbLog(
        "deviceErr=panduanShebei:$panduanShebei==hasContainergoogleplay:$hasContainergoogleplay hasContainerdeveloper:$hasContainerdeveloper hasContainerRoot:$hasContainerRoot hasContainervpn:$hasContainervpn hasContainersim:$hasContainersim hasContainersimulator:$hasContainersimulator",
      );
      if (hasContainerRoot) {
        bool hasRoot = await rootChajian();
        pbLog("deviceErr=hasRoot:$hasRoot====");
        if (hasRoot) {
          _hasDanger = true;
          risk_chance(value: "root");
          return true;
        }
      }

      if (hasContainervpn) {
        bool hasvpn = await vpnChajian();
        pbLog("deviceErr=hasvpn:$hasvpn====");
        if (hasvpn) {
          _hasDanger = true;
          risk_chance(value: "vpn");
          return true;
        }
      }

      if (hasContainersim) {
        bool sim = await simChajian();
        pbLog("deviceErr=sim:$sim====");
        if (!sim) {
          _hasDanger = true;
          risk_chance(value: "sim");
          return true;
        }
      }

      if (hasContainersimulator) {
        bool simulator = await simulatorChajian();
        pbLog("deviceErr=simulator:$simulator====");
        if (simulator) {
          _hasDanger = true;
          risk_chance(value: "simulator");
          return true;
        }
      }

      if (hasContainerdeveloper) {
        bool developer = await developerChajian();
        pbLog("deviceErr=developer:$developer====");
        if (developer) {
          _hasDanger = true;
          risk_chance(value: "developer");
          return true;
        }
      }
      if (hasContainergoogleplay) {
        bool googlePlay = await storeChajian();
        pbLog("deviceErr=googlePlay:$googlePlay====");
        if (!googlePlay) {
          _hasDanger = true;
          risk_chance(value: "googlePlay");
          return true;
        }
      }
      if (hasContainerip) {
        bool bannerd = await ip();
        if (bannerd) {
          _hasDanger = true;
          risk_chance(value: "ip");
          return true;
        }
      }
    } catch (e) {
      pbLog("=deviceErr=error=$e=");
    }
    return false;
  }

  static void session_custom({required String name, required String value}) {
    PBWangluo().buryPoint(
      moistValue: "session_custom",
      veinKey: name,
      veinKeyValue: value,
    );
  }

  static void risk_chance({required String value}) {
    pbLog("===触发风控==$value==");
    PBWangluo().buryPoint(
      moistValue: "risk_chance",
      veinKey: "risk_from",
      veinKeyValue: value,
    );
  }

  static void see_you_tomorrow() {
    PBWangluo().buryPoint(moistValue: "see_you_tommorow");
  }

  static Map<String, dynamic> __onlineJson() {
    Map<String, dynamic> localJson = local;
    try {
      String name = "risk_control";
      String key = PBFireBbbbbb().by(name: name);
      pbLog(
        "====common_ads=== _onlineJson FirebaseUtils: $name string:$key test===",
      );

      Map<String, dynamic> json = jsonDecode(key);
      localJson = json;
      pbLog("FirebaseUtils: $name json $json");
    } on Exception catch (e) {
      pbLog("onlineJson:$e");
    }

    pbLog("FirebaseUtils: final json ${jsonEncode(localJson)}");
    _onlineJson = localJson;
    return localJson;
  }

  static List<String> devices() {
    try {
      if (_onlineJson == null) {
        __onlineJson();
      }

      var data = _onlineJson?['device'] ?? [];
      pbLog("==devices=before:$data");
      List<String> tmpDevice = [];
      if (data is List) {
        data.forEach((value) {
          tmpDevice.add("$value");
        });
      }
      pbLog("==devices=after:$tmpDevice");
      return tmpDevice;
    } catch (e) {
      pbLog("==devices=error:$e");
      return [];
    }
  }

  static Tuple2<int, int> behavior_ad_short_show() {
    if (_onlineJson == null) {
      __onlineJson();
    }
    var data = _onlineJson!['behavior'];
    var ad_short_show = data['ad_short_show'];

    int item1 = ad_short_show['duration'];
    int item2 = ad_short_show['value'];
    return Tuple2(item1, item2);
  }

  static Tuple2<int, int> behavior_ad_short_close() {
    if (_onlineJson == null) {
      __onlineJson();
    }
    var data = _onlineJson!['behavior'];
    var ad_short_show = data['ad_short_close'];

    int item1 = ad_short_show['duration'];
    int item2 = ad_short_show['value'];
    return Tuple2(item1, item2);
  }

  static behavior_wrong_deem_ad_less() {
    if (_onlineJson == null) {
      __onlineJson();
    }
    var data = _onlineJson!['behavior'];
    var ad_short_show = data['wrong_deem_ad_less'];

    return ad_short_show;
  }

  static behavior_wrong_deem_ad_more() {
    if (_onlineJson == null) {
      __onlineJson();
    }
    var data = _onlineJson!['behavior'];
    var ad_short_show = data['wrong_deem_ad_more'];

    return ad_short_show;
  }

  static behavior_ad_daily_show() {
    if (_onlineJson == null) {
      __onlineJson();
    }
    var data = _onlineJson!['behavior'];
    var ad_short_show = data['ad_daily_show'];

    return ad_short_show;
  }

  static bool needUinumber() {
    if (_onlineJson == null) {
      __onlineJson();
    }
    var data = _onlineJson!['ui'];
    var number = data['number'];
    pbLog("==needUinumber:number:$number====");
    return number == 1;
  }

  static bool needUibehavior() {
    if (_onlineJson == null) {
      __onlineJson();
    }
    var data = _onlineJson!['ui'];
    var behavior = data['behavior'];
    pbLog("==needUibehavior:behavior:$behavior====");
    return behavior == 1;
  }

  static bool needUidevice() {
    if (_onlineJson == null) {
      __onlineJson();
    }
    var data = _onlineJson!['ui'];
    var device = data['device'];
    pbLog("==needUidevice:device:$device====");
    return device == 1;
  }

  static Map<String, dynamic>? _onlineJson;

  //
  static Map<String, dynamic> local = {
    "ui": {"number": 0, "behavior": 0, "device": 0},
    "behavior": {
      "ad_short_show": {"duration": 30, "value": 3},
      "ad_short_close": {"duration": 20, "value": 3},
      "wrong_deem_ad_less": 3,
      "wrong_deem_ad_more": 90,
      "no_install": 1,
      "ad_daily_show": 60,
    },
    "device": [
      "vpn",
      "root",
      "sim",
      "simulator",
      "googleplay",
      "developer",
      "ip",
    ],
  };
}
