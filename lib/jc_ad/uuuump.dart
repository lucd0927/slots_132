import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:iabtcf_consent_info/iabtcf_consent_info.dart';
import 'package:slots_132/jc_huanjing/config.dart';
import 'package:slots_132/jc_gj/log.dart';



class PbUuuump {
  static const TGA = "PbUuuump:";

  static final PbUuuump _instance = PbUuuump._();

  factory PbUuuump() {
    return _instance;
  }

  PbUuuump._();

  final countryCoddddd = [
    "AT",
    "BE",
    "BG",
    "HR",
    "CY",
    "CZ",
    "DK",
    "EE",
    "FI",
    "FR",
    "DE",
    "GR",
    "HU",
    "IE",
    "IT",
    "LV",
    "LT",
    "LU",
    "MT",
    "NL",
    "PL",
    "PT",
    "RO",
    "SK",
    "SI",
    "ES",
    "SE",
    "NO",
    "IS",
    "LI",
    "CH",
    "GB",
  ];

  init() async {
    Completer<bool> tmalsdflfPpppp = Completer();
    bool gdprHhhhh = _isUuuuump();
    pbLog("$TGA==_huoquGuojia==hasUmp:${gdprHhhhh}");
    // PBMaiDian.eu_user(gdprHhhhh ? "1" : "0");
    if (gdprHhhhh) {
      if(PBPeizhi.isDEV()) {
        // ConsentInformation.instance.reset();
      }
      InitializationStatus status = await MobileAds.instance.initialize();
      ConsentStatus consentStatus = await ConsentInformation.instance
          .getConsentStatus();
      pbLog("$TGA====hasUmp:  consentStatus$consentStatus");
      if (consentStatus == ConsentStatus.notRequired) {
        tmalsdflfPpppp.complete(true);
      } else {
        pbLog("$TGA==InitializationStatus==status:${status.adapterStatuses}");
        ConsentDebugSettings consentDebugSettings = ConsentDebugSettings(
          debugGeography: DebugGeography.debugGeographyEea,
          testIdentifiers: ["55D85BD904B20574A5E0920D3F9F2E3D","65975D90CC135191705D829CCE4E6BAC"],
        );
        final params = PBPeizhi.isDEV()
            ? ConsentRequestParameters(
                // todo: 去掉
                consentDebugSettings: consentDebugSettings,
              )
            : ConsentRequestParameters();

        // Request an update to consent information on every app launch.
        ConsentInformation.instance.requestConsentInfoUpdate(
          params,
          () async {
            // Called when consent information is successfully updated.
            pbLog("$TGA==requestConsentInfoUpdate success==");

            // PrivacyOptionsRequirementStatus privacyOptionsRequirementStatus = await ConsentInformation.instance.getPrivacyOptionsRequirementStatus();

            ConsentForm.loadAndShowConsentFormIfRequired((loadAndShowError) {
              if (loadAndShowError != null) {
                pbLog("$TGA==loadAndShowConsentFormIfRequired error==${loadAndShowError.errorCode} ${loadAndShowError.message}");
                // Consent gathering failed.
                // PBMaiDian.ad_privacypop_fail(loadAndShowError.message);
                tmalsdflfPpppp.complete(false);
              } else {
                pbLog("$TGA==loadAndShowConsentFormIfRequired success==");
                // PBMaiDian.ad_privacypop_suc();
                tmalsdflfPpppp.complete(true);
              }

              // Consent has been gathered.
            });
          },
          (FormError error) {
            String reason = error.message;
            pbLog("$TGA==requestConsentInfoUpdate error==${reason}");
            // Called when there's an error updating consent information.
            // PBMaiDian.ad_privacypop_fail(reason);
            tmalsdflfPpppp.complete(false);
          },
        );
      }

      // await ConsentInformation.instance.reset();
    } else {
      AppLovinMAX.setHasUserConsent(true);
      tmalsdflfPpppp.complete(true);
    }

    await tmalsdflfPpppp.future;

    if (gdprHhhhh) {
      ConsentStatus consentStatus = await ConsentInformation.instance
          .getConsentStatus();
      pbLog("$TGA==consentStatus:${consentStatus}===");
      if (consentStatus == ConsentStatus.obtained) {
        BasicConsentInfo? info = await IabtcfConsentInfo.instance
            .currentConsentInfo();
        if (info != null) {
          bool hasSelect = (info as ConsentInfo).purposeConsents.contains(
            DataUsagePurpose.selectPersonalisedContent,
          );
          AppLovinMAX.setHasUserConsent(hasSelect);
          pbLog("$TGA==hasSelect:${hasSelect}===");
        }
      } else if (consentStatus == ConsentStatus.unknown) {
        AppLovinMAX.setHasUserConsent(false);
      } else {
        AppLovinMAX.setHasUserConsent(true);
      }
    }
    AppLovinMAX.setDoNotSell(false);
    return;
  }

  bool _isUuuuump() {
    Locale sdfgsdfgds = WidgetsBinding.instance.platformDispatcher.locale;
    String fghhdfhsaefsadf = sdfgsdfgds.countryCode ?? "6565";
    // todo: 去掉
    if(PBPeizhi.isDEV()){
      fghhdfhsaefsadf = "CH";
    }

    bool asfasdfasdf = countryCoddddd.contains(fghhdfhsaefsadf);
    return asfasdfasdf;
  }
}
