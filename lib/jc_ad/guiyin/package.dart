import 'dart:async';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:rxdart/rxdart.dart';
import 'package:slots_132/jc_gj/jc_huanjing/cccc.dart';
import 'package:slots_132/jc_gj/jc_net/http_dio.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/jc_ad/common_ads.dart';
import 'package:slots_132/jc_ad/fengkong.dart';
import 'package:slots_132/jc_ad/guiyin/adjust.dart';
import 'package:slots_132/jc_ad/guiyin/af.dart';
import 'package:slots_132/jc_ad/guiyin/firebbbbbb.dart';
import 'package:slots_132/jc_gj/log.dart';

class SSABChange {
  static final SSABChange _instance = SSABChange._();

  // auto patch 642
  factory SSABChange() {
    return _instance;
  }

  SSABChange._();

  static String get cloakBData => Platform.isIOS ? "speech" : "funereal";

  static String get cloakAData => Platform.isIOS ? "out" : "germ";
  static const String afDataOrganic = "Organic";

  static const String kHivePackage = "kjdsdsfjkghj";
  static const String packageA = "ppppppA";
  static const String packageB = "ppppppB";

  static String get clockData => _cloakData;

  // static String _clockData = "";

  static bool showH5() {
    ssLogggg("$TGA====showH5=_cloakData:$_cloakData==cloakBData:$cloakBData");
    return _cloakData == cloakBData;
  }

  static String _name = packageA;

  // 哪个包  A包还是B包 默认A包
  static String get name => _name;
  final subject = BehaviorSubject<String>();

  static bool isPackageB() {
    return packageB == name;
  }

  var box = SSHive.box;

  sendAAA({required String cloakData, required String afData}) async {
    bool entryBBB =
        cloakData == cloakBData &&
        (afData.isNotEmpty && afData != afDataOrganic);
    ssLogggg(
      "$TGA=SSABChange().listen ABPackage send: cloakData:$cloakData  ====afData:$afData entryBBB:$entryBBB",
    );

    var data = box.get(kHivePackage);
    // entryBBB = true;
    // await Future.delayed(Duration(milliseconds: 15000));
    if (entryBBB) {
      if (data == packageB) {
        _name = packageB;
        return;
      }
      _name = packageB;

      box.put(kHivePackage, packageB);
      SSWindsCccc.initNumberUnit();

      initCompleter?.complete(true);
      initCompleter = null;
      subject.add(_name);
    } else {
      _name = packageA;
      box.put(kHivePackage, packageA);
      initCompleter?.complete(false);
      initCompleter = null;
      subject.add(_name);
    }
  }

  void dispose() {
    subject.close();
  }

  void listen(void Function(String packageName) update) {
    subject.stream.listen((String a) {
      ssLogggg("$TGA=ABPackage: update packageName:$a");
      update(a);
    });
  }

  // 正常模式 B包 oft
  // 命中黑名单 A包   brash
  static String _cloakData = cloakAData;

  // Organic network里是否包含【Organic】字段，如果包含则为自然量用户，并且展示为A包
  String _appsFlyerData = afDataOrganic;

  static const String kkGuiyin = "sdfjkdshfgkj";

  hasSaveGuiyinData() {}

  guiyin(String source) {
    if (isPackageB()) {
      return;
    }
    box.put(kkGuiyin, source);
    String qs_af_on123 = PBFireBbbbbb().by(name: "qs_adjust_on");
    ssLogggg("$TGA==guiyin=pre==qs_af_on123:$qs_af_on123==");
    if (qs_af_on123.isEmpty) {
      qs_af_on123 = "1";
    }
    ssLogggg("$TGA==guiyin=now==qs_af_on123:$qs_af_on123==");

    if (qs_af_on123 == "1") {
      ssLogggg("$TGA==guiyin=now==qm_af_on: 返回1 需要判断af的数据");
      if (source.isNotEmpty && source != afDataOrganic) {
        ssLogggg("$TGA===========guiyin= mailiang");
        // 4.满足买量用户的判断条件
        _appsFlyerData = source;
        // JCShijianBaogao.organic_to_buy();
      } else {
        _appsFlyerData = afDataOrganic;
        ssLogggg("$TGA===========guiyin= zirang");
      }
      // JCShijianBaogao.adjust_suc(_appsFlyerData == afDataOrganic ? "0" : "1");
      // int mill = 12000;
      // Future.delayed(Duration(milliseconds: mill), () {
      //   // todo: 测试代码
      //   _appsFlyerData = "ddd";
      //   sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
      // });

      sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
    } else if (qs_af_on123 == "0") {
      ssLogggg("$TGA===now==qm_af_on: 返回0 不需要判断af的数据");
      _appsFlyerData = "qs_af_on123";
      sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
    }
  }


  Future<void> requestATT() async {
    if(Platform.isIOS){
      final status = await AppTrackingTransparency.trackingAuthorizationStatus;
      ssLogggg("$TGA===requestATT==status: $status");
      if (status == TrackingStatus.notDetermined) {
        TrackingStatus trackingStatus = await AppTrackingTransparency.requestTrackingAuthorization();
        ssLogggg("$TGA===requestATT==trackingStatus: $trackingStatus");
      }
    }


  }

  cloakAAAA({int count = 0}) async {
    // JCShijianBaogao.cloak_req();
    var data = await SSHttpDio().cloak();
    ssLogggg("$TGA=package cloak data:$data count:$count");

    _cloakData = data;
    // JCShijianBaogao.cloak_suc(_cloakData == cloakBData ? "1" : "0");
    // 正常模式 B包
    if (data == cloakBData) {
      ssLogggg("$TGA=====正常模式 B包==data:$data=");
      _cloakData = data;
      // send(cloakData: _cloakData, afData: _appsFlyerData);
      // await _initAppsFlyer();
      return data;
    }
    // 命中黑名单 A包
    else if (data == cloakAData) {
      ssLogggg("$TGA=====命中黑名单 A包==data:$data=");
      _cloakData = data;
      // send(cloakData: _cloakData, afData: _appsFlyerData);
      // await _initAppsFlyer();
      return data;
    }
    // 其他数据则再次请求
    else {
      if (count == 10) {
        return cloakAData;
      }

      await Future.delayed(Duration(milliseconds: 1000), () {});
      var nextCount = count + 1;
      return await cloakAAAA(count: nextCount);
    }
  }

  Future _initA() async {


    // 广告初始化
    ssLogggg("$TGA====_initA==cloak();==");
    var cloakData = await cloakAAAA();
    ssLogggg("$TGA====_initA==cloakData:$cloakData==");
    DateTime dateTime = DateTime.now();
    ssLogggg("$TGA===PBFireBbbbbb==${dateTime.millisecondsSinceEpoch}");
    // 初始化firebase
    await PBFireBbbbbb().initFirebase();
    DateTime dateTime2 = DateTime.now();
    ssLogggg(
      "$TGA===PBFireBbbbbb==${dateTime2.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch}",
    );
    initAd();
    await _chushiGuiyin();

    ssLogggg("$TGA===_chushiGuiyin==end");
  }

  Future _initB() async {
    // await TBDeviceManager.isLimitAdTrackingEnabled();
    // 广告初始化
    ssLogggg("$TGA===_initB===GGCommonAds().init start==");
    int time = DateTime.now().millisecondsSinceEpoch;
    // await GGCommonAds().init();
    int time2 = DateTime.now().millisecondsSinceEpoch;
    ssLogggg("$TGA===_initB===GGCommonAds().init end===耗时:${time2 - time}");
    var box = SSHive.box;
    box.put(kHivePackage, packageB);
    ssLogggg("$TGA===_initB===_initAppsFlyer() start==");
    initAd();
    await _chushiGuiyin();
    int time3 = DateTime.now().millisecondsSinceEpoch;
    ssLogggg("$TGA===_initB===_initAppsFlyer() end===耗时:${time3 - time2}");
    if (Platform.isAndroid) {
      await SSWindsCccc.initNumberUnit();
      int time4 = DateTime.now().millisecondsSinceEpoch;
      ssLogggg("$TGA===_initB===SWFengKong() end===耗时:${time4 - time3}");
    }

    // JCShijianBaogao.cloak_req();
    SSHttpDio().cloak().then((v) {
      _cloakData = v ?? "";
      if (v.isEmpty) {
        _cloakData = cloakAData;
      }
      // JCShijianBaogao.cloak_suc(_cloakData == cloakBData ? "1" : "0");
    });

    initCompleter?.complete(true);
  }

  // auto patch 285

  Completer<bool>? initCompleter;
  static const String TGA = "13222222:";

  Future<bool> init() async {
    initCompleter = Completer<bool>();
    var box = SSHive.box;
    var packageName = box.get(kHivePackage) ?? packageA;
    // packageName = packageB;
    if (Platform.isAndroid) {
      packageName = packageB;
    }
    // packageName = packageA;
    _name = packageName;
    DateTime dateTime = DateTime.now();
    await requestATT();
    ssLogggg("$TGA=package==init:$packageName==");
    if (packageName == packageB) {
      ssLogggg("$TGA===PBFireBbbbbb==${dateTime.millisecondsSinceEpoch}");
      // 初始化firebase
      await PBFireBbbbbb().initFirebase();
      DateTime dateTime2 = DateTime.now();
      ssLogggg(
        "$TGA===PBFireBbbbbb==${dateTime2.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch}",
      );

      _initB();
    } else {
      _initA();
    }

    bool result = (await initCompleter?.future) ?? false;
    DateTime dateTimeEnd = DateTime.now();
    ssLogggg(
      "$TGA==SSABChange().listen==guiyin time==${dateTimeEnd.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch}",
    );

    ssLogggg("$TGA=package==result:$result==isPackageB:${isPackageB()}");
    // if (isPackageB() || true) {
    //   await initAd();
    // }
    // await Future.delayed(Duration(milliseconds: 20000));
    return result;
  }

  initAd() async {
    DateTime dd = DateTime.now();
    // 初始化firebase
    await SSCommonAds().init();
    DateTime dddd = DateTime.now();
    ssLogggg(
      "$TGA===SSCommonAds==${dddd.millisecondsSinceEpoch - dd.millisecondsSinceEpoch}",
    );
  }

  bool sfChushiAF = false;
  bool hasAdjust = true;

  _chushiGuiyin() async {
    if (!sfChushiAF) {
      sfChushiAF = true;

      if (hasAdjust) {
        await SSAdjust().initSdk(
          SSHuanjing.hasDevvvvv()
              ? (Platform.isIOS
                    ? "ih2pm2dr3k74"
                    : "4qedga65udq8")
              : (Platform.isIOS ? "jg382mhf3b40" : "dxxu9j7r8phc"),
        );
      } else {
        String asdkasfdhka = "XM9ua37BHJWBKq8jTYg74a";
        if (asdkasfdhka.isEmpty) {
          return;
        }
        await JcAF().initAppsFlyer(afDevKey: asdkasfdhka, appId: "6752763599");
      }
      String qs_af_on123 = PBFireBbbbbb().by(name: "qs_adjust_on");
      ssLogggg("==qs_af_on123==$qs_af_on123");
    }
  }
}
