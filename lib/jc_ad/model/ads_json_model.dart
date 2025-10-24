import 'dart:convert';

import '../gg_common_config.dart';



T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class AdsJsonModel {
  AdsJsonModel({
    required this.adsId,
    required this.adsPlatform,
    required this.adsType,
    required this.timeout,
  });

  AdsJsonModel.fromJson(Map<String, dynamic> json)
    : adsId = asT<String>(json[GGCommonJson.k_ads_id]) ?? "",
      adsPlatform = asT<String>(json[GGCommonJson.k_platfrom]) ?? "",
      adsType = asT<String>(json[GGCommonJson.k_ad_type]) ?? "",
      timeout = asT<int>(json[GGCommonJson.k_time_out]) ?? 0;

  final String adsId;
  final String adsPlatform;
  final String adsType;
  final int timeout;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    GGCommonJson.k_ads_id: adsId,
    GGCommonJson.k_platfrom: adsPlatform,
    GGCommonJson.k_ad_type: adsType,
    GGCommonJson.k_time_out: timeout,
  };
}
