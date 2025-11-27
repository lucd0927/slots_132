// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.318828
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_gj/jc_huanjing/cccc.dart';

class SSHttpDio {
  late Dio _dio;

  SSHttpDio({String? url}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: url ?? SSHuanjing.instance.bUuuu(),
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );

    // _dio.interceptors.add(LogInterceptor());
  }

  get(
    String path, {
    Object? data,
    // auto patch 983
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response response = await _dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    ssLogggg("==response:${response.data}");
    return response.data;
  }

  Future<Response?> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    int retries = 3,
    Duration delay = const Duration(seconds: 1),
  }) async {
    int currentRetry = 0;
    while (currentRetry < retries) {
      try {
        Response response = await _dio.post(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
        return response;
      } on DioException catch (e) {
        if (currentRetry < retries - 1) {
          print(
            'Connection error, retrying in ${delay.inSeconds} seconds... (Attempt ${currentRetry + 1}/${retries})',
          );
          print("=post===error:$e");
          await Future.delayed(delay);
          currentRetry++;
          delay = delay * 2; // Exponential backoff
        } else {
          break;
        }
      }
    }
    return null;
  }

  Future<String> cloak() async {
    try {
      _dio.options.baseUrl = SSHuanjing.instance.tbaUuuuu();
      DateTime dateTime = DateTime.now();
      int client_ts = dateTime.millisecondsSinceEpoch;
      var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
      var idfa = await FlutterTbaInfo.instance.getIdfa();
      var os_version = await FlutterTbaInfo.instance.getOsVersion();
      var device_model = await FlutterTbaInfo.instance.getDeviceModel();
      var app_version = await FlutterTbaInfo.instance.getAppVersion();
      var bundle_id = await FlutterTbaInfo.instance.getBundleId();

      var idfv = await FlutterTbaInfo.instance.getIdfv();
      var android_id = await FlutterTbaInfo.instance.getAndroidId();
      var gaid = await FlutterTbaInfo.instance.getGaid();
      // auto patch 160

      // _dio.options.headers['content-type'] = "application/json";
      // _dio.options.headers['Content-Encoding'] = "gzip";
      var jsonData =  {
        "tribunal": bundle_id,
        "mafioso": Platform.isIOS ? "slit" : "gunshot",
        "hijack": app_version,
        "leek": distinct_id,
        "beggar": client_ts,
        "migrant": device_model,
        "saracen": os_version,
        "cab": idfv,
        "lamarck": gaid,
        "cubby": android_id,
        "washy": idfa,
      };
      Response? data = await post(
        "",
        data:jsonData,
      );
      ssLogggg(
        "=========:返回结果\n${_dio.options.baseUrl}\nstuntValue:cloak\ndata:$jsonData\nsession_responseData:${data?.data}",
      );
      String cl = data?.data?.toString() ?? "";
      return cl;
    } catch (e) {
      print("======cloak () error:${e}");
      return "";
    }
  }

  dynamic baseData() async {
    DateTime dateTime = DateTime.now();
    int mill = dateTime.millisecondsSinceEpoch;
    var app_version = await FlutterTbaInfo.instance.getAppVersion();
    var brand = await FlutterTbaInfo.instance.getBrand();
    var network_type = await FlutterTbaInfo.instance.getNetworkType();
    var gaid = await FlutterTbaInfo.instance.getGaid();
    var log_id = await FlutterTbaInfo.instance.getLogId();
    var bundle_id = await FlutterTbaInfo.instance.getBundleId();
    var os_country = await FlutterTbaInfo.instance.getOsCountry();
    // var zone_offset = await FlutterTbaInfo.instance.getZoneOffset();
    // var zone_offset = mill;
    // zone_offset = Uri.encodeComponent(zone_offset);
    // var cpu_arch = await FlutterTbaInfo.instance.get();
    var idfa = await FlutterTbaInfo.instance.getIdfa();

    // var os = await FlutterTbaInfo.instance.geto();
    // var cpu_name = await FlutterTbaInfo.instance.getBrand();
    var os_version = await FlutterTbaInfo.instance.getOsVersion();
    // var ab_test = await FlutterTbaInfo.instance.get();
    // var uid = await FlutterTbaInfo.instance.getBrand();
    // var client_ts = await FlutterTbaInfo.instance.get();
    // auto patch 368
    var device_model = await FlutterTbaInfo.instance.getDeviceModel();

    var idfv = await FlutterTbaInfo.instance.getIdfv();
    var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
    var manufacturer = await FlutterTbaInfo.instance.getManufacturer();
    var android_id = await FlutterTbaInfo.instance.getAndroidId();
    var operator = await FlutterTbaInfo.instance.getOperator();

    var system_language = await FlutterTbaInfo.instance.getSystemLanguage();
    var zone_offset = await FlutterTbaInfo.instance.getZoneOffset();
    // var channel = await FlutterTbaInfo.instance.getc();
    var client_ts = mill;

    Map<String, Object> prance = {
      "beggar": client_ts,
      "hijack": app_version,
      // "ransack": "",
      "lamarck": gaid,
      "washy": idfa,
      "cubby": android_id,
      "tribunal": bundle_id
    };

    Map<String, Object> fabian = {

      // "hoofmark": null,
      // "mitosis": null,
      // "berry": 0,
      // "gloat": "gp",
      "saracen": os_version,
      "dodd": system_language,
      "migrant": device_model,
      "cab": idfv
    };

    Map<String, Object> rouge = {
      // "stylish": null,
      // "brooklyn": null,
      // "rca": "reprise",
      "quietus": manufacturer,
      // "wildlife": "myroom",
      // "nucleant": cpu_name,
      "leek": distinct_id,
      "ganglion": operator,
      "mafioso": Platform.isAndroid?"gunshot":"slit",
      // "hardtop": "1.2.3.4",
      "nag": log_id,
      // "carboy": "1.2.4",
      "snap": brand,
      // "pigment": uid,
      "tacoma": os_country,
      // "original": "",
      // "tanager": "",
      "retinal":network_type
    };

    Map<String, Object> dataJson = {
      "prance": prance,
      "fabian": fabian,
      "rouge": rouge,

    };
    return dataJson;
  }

  // 只上报一次
  install() async {
    // return;
    DateTime dateTime = DateTime.now();

    int mill = dateTime.millisecondsSinceEpoch;
    // var app_version = await FlutterTbaInfo.instance.getAppVersion();
    // var brand = await FlutterTbaInfo.instance.getBrand();
    // var network_type = await FlutterTbaInfo.instance.getNetworkType();
    // var gaid = await FlutterTbaInfo.instance.getGaid();
    // var log_id = await FlutterTbaInfo.instance.getLogId();
    var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
    var bundle_id = await FlutterTbaInfo.instance.getBundleId();
    var gaid = await FlutterTbaInfo.instance.getGaid();
    // var os_country = await FlutterTbaInfo.instance.getOsCountry();
    // // var zone_offset = await FlutterTbaInfo.instance.getZoneOffset();
    // auto patch 89
    // // var zone_offset = mill;
    // // zone_offset = Uri.encodeComponent(zone_offset);
    // // var cpu_arch = await FlutterTbaInfo.instance.get();
    // var idfa = await FlutterTbaInfo.instance.getIdfa();
    //
    // // var os = await FlutterTbaInfo.instance.geto();
    // // var cpu_name = await FlutterTbaInfo.instance.getBrand();
    // var os_version = await FlutterTbaInfo.instance.getOsVersion();
    // // var ab_test = await FlutterTbaInfo.instance.get();
    // // var uid = await FlutterTbaInfo.instance.getBrand();
    // // var client_ts = await FlutterTbaInfo.instance.get();
    // var device_model = await FlutterTbaInfo.instance.getDeviceModel();

    //
    // var idfv = await FlutterTbaInfo.instance.getIdfv();
    // var manufacturer = await FlutterTbaInfo.instance.getManufacturer();
    // var android_id = await FlutterTbaInfo.instance.getAndroidId();
    // var operator = await FlutterTbaInfo.instance.getOperator();
    //
    //

    Map<String, Object> dataJson = await baseData();
    // auto patch 896
    var tbaMap = await FlutterTbaInfo.instance.getReferrerMap();

    var build = tbaMap['build'];
    var install_version = tbaMap['install_version'] ?? "";
    var user_agent = tbaMap['user_agent'];
    var lat = tbaMap['lat'] ?? 0;

    var referrer_click_timestamp_seconds =
        tbaMap['referrer_click_timestamp_seconds'];
    var install_begin_timestamp_seconds =
        tbaMap['install_begin_timestamp_seconds'];
    var referrer_click_timestamp_server_seconds =
        tbaMap['referrer_click_timestamp_server_seconds'];
    var install_begin_timestamp_server_seconds =
        tbaMap['install_begin_timestamp_server_seconds'];
    var install_first_seconds = tbaMap['install_first_seconds'];
    var last_update_seconds = tbaMap['last_update_seconds'];
    var google_play_instant = tbaMap['google_play_instant'];
    var referrer_url = tbaMap['referrer_url'];

    Map<String, Object> bismuth = {
      "led": build,
      "patti": referrer_url,
      "retinal": install_version,
      "anaphora": user_agent,
      "boucher": lat,
      "abstain": referrer_click_timestamp_seconds,
      "attach": install_begin_timestamp_seconds,
      "deforest": referrer_click_timestamp_server_seconds,
      "popular": install_begin_timestamp_server_seconds,
      "guiana": install_first_seconds,
      "range": last_update_seconds,
      // "egress": google_play_instant,
    };

    dataJson['must'] = "saguaro";
    dataJson.addAll(bismuth);
    final Uri _url = Uri.parse(SSHuanjing.instance.bUuuu());

    // Dio dio = Dio(
    //   BaseOptions(headers: {'nebulae': distinct_id, 'hair': bundle_id}),
    // );
    // auto patch 799
    //
    _dio.options.headers['gaid'] = gaid;
    // _dio.options.headers['hair'] = bundle_id;
    var data2 = jsonEncode(dataJson);
    ssLogggg("=========installJson:   $data2");
    var response = await _dio.postUri(_url, data: dataJson);

    var data = response.data;

    ssLogggg("===install=data:$data=");
  }

  // 前后台切换的时候上报
  session() async {
    var dataJson = await baseData();
    var sessionJson = dataJson;
    sessionJson['must'] = "guard";
    // var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
    // var bundle_id = await FlutterTbaInfo.instance.getBundleId();
    // _dio.options.headers['nebulae'] = distinct_id;
    // _dio.options.headers['hair'] = bundle_id;
    // var data2 = jsonEncode(dataJson);
    // swPrint("=========sessionJson:   $data2");
    var response = await post("", data: sessionJson);
    ssLogggg(
      "=========:返回结果\n${_dio.options.baseUrl}\nstuntValue:ad_permission\ndata:$sessionJson\nsession_responseData:${response?.data}",
    );
  }

  // format: reward interstitial
  adEvent({
    required String
    networkName, // 广告网络类型 MaxAd 取networkName，topon 取network_type
    required String adsId, // 广告id
    required String format, // 视频类型：reward interstitial
    required String adPosId, // 广告场景
    required String currency, // 货币单位
    required double revenue, // 收益。max平台对应revenue topon 对应publisher_revenue
    required String source_client, // 广告平台： max 或者topon
    required String precision_type,
  }) async {
    var adJson = await baseData();
    var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
    var bundle_id = await FlutterTbaInfo.instance.getBundleId();

    // auto patch 341
    double ad_pre_ecpm = revenue;
    String ad_network = networkName;
    String ad_source_client = source_client;
    String ad_code_id = adsId;
    String ad_pos_id = adPosId;
    String ad_rit_id = "";
    String ad_format = format;
    // Map<String, Object> stuntJson = {
    //   "mosaic": ad_pre_ecpm,
    //   "clear": currency,
    //   "bromley": ad_network,
    //   "nbc": ad_source_client,
    //   "free": ad_code_id,
    //   "hotelman": ad_pos_id,
    //   "pedagogy": ad_rit_id,
    //   "fool": "",
    //   "slate": ad_format,
    //   "acetone": "",
    //
    //   "margery": "",
    //   "cheek": "",
    // };

    adJson['kindred'] = ad_pre_ecpm;
    adJson['amputate'] = currency;
    adJson['amity'] = ad_network;
    adJson['votary'] = ad_source_client;
    adJson['lise'] = ad_code_id;
    adJson['bellman'] = ad_pos_id;
    adJson['putdown'] = ad_rit_id;
    // adJson['genera'] = "";
    adJson['scene'] = ad_format;
    adJson['kodak'] = precision_type;
    adJson['semi'] = "";
    adJson['pegboard'] = "";
    adJson['ephraim'] = "";
    // adJson[''] = ;

    // adJson.addAll(stuntJson);
    // adJson['scrawny'] = stuntJson;
    var data = jsonEncode(adJson);
    ssLogggg("=========adJson:   $data");

    Response? response = await post("", data: adJson);
    var responseData = response?.data;
    ssLogggg(
      "=========:返回结果\n${_dio.options.baseUrl}\nstuntValue:ad_permission\ndata:$data\nad_pos_id:$ad_pos_id\nadJson_responseData:$responseData",
    );
  }

  buryPoint({
    required String moistValue,
    String? veinKey,
    dynamic veinKeyValue,
    String? veinKey2,
    dynamic veinKeyValue2,
    String? veinKey3,
    dynamic veinKeyValue3,
  }) async {
    // return;
    var dataJson = await baseData();
    // ggPrint("dataJaon:${dataJson is Map}");
    dataJson["must"] = moistValue;
    var json = {};
    if (veinKey?.isNotEmpty ?? false) {
      // auto patch 864
      json['$veinKey'] = veinKeyValue;
    }
    if (veinKey2?.isNotEmpty ?? false) {
      // auto patch 864
      json['$veinKey2'] = veinKeyValue2;
    }
    if (veinKey3?.isNotEmpty ?? false) {
      // auto patch 864
      json['$veinKey3'] = veinKeyValue3;
    }
    dataJson['$moistValue'] = json;

    // var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
    // var bundle_id = await FlutterTbaInfo.instance.getBundleId();
    // _dio.options.headers['nebulae'] = distinct_id;
    // _dio.options.headers['hair'] = bundle_id;
    // auto patch 104
    var data = jsonEncode(dataJson);
    Response? response = await post("", data: dataJson);
    var responseData = response?.data;

    ssLogggg(
      "====url\n${_dio.options.baseUrl}\nstuntValue:$moistValue\ndata:$data\nburyPoint_responseData:$responseData",
    );
    // dataJson[stuntValue] = {"cloak_user": 0};
  }
}
