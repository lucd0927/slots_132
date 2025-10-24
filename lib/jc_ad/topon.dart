
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_huanjing/config.dart';
import 'package:thinkup_sdk/at_index.dart';


final InitManger = InitTool();

class InitTool {
  // 打开SDK的Debug log，强烈建议在测试阶段打开，方便排查问题。
  setLogEnabled() async {
    await ATInitManger.setLogEnabled(logEnabled: true);
  }

  // 设置渠道，可用于统计数据和进行流量分组
  setChannelStr() async {
    await ATInitManger.setChannelStr(channelStr: "test_setChannel");
  }

  // 设置子渠道，可用于统计数据和进行流量分组
  setSubchannelStr() async {
    await ATInitManger.setSubChannelStr(subchannelStr: "test_setSubchannelStr");
  }

  // 设置自定义的Map信息，可匹配后台配置的对应流量分组（App纬度）（可选配置）
  setCustomDataDic() async {
    await ATInitManger.setCustomDataMap(
      customDataMap: {'setCustomDataDic': 'myCustomDataDic'},
    );
  }

  // 设置排除交叉推广App列表
  setExludeBundleIDArray() async {
    await ATInitManger.setExludeBundleIDArray(
      exludeBundleIDList: ['test_setExludeBundleIDArray'],
    );
  }

  // 设置自定义的Map信息，可匹配后台配置的对应的流量分组（Placement纬度）（可选配置）
  setPlacementCustomData() async {
    await ATInitManger.setPlacementCustomData(
      placementIDStr: 'b5b72b21184aa8',
      placementCustomDataMap: {
        'setPlacementCustomData': 'test_setPlacementCustomData',
      },
    );
  }

  // 判断是否位于欧盟地区
  getUserLocation() async {
    await ATInitManger.getUserLocation().then((value) {
      pbLog('flutter: Get user location -- ${value.toString()}');
    });
  }

  // 获取GDPR的授权级别
  getGDPRLevel() async {
    await ATInitManger.getGDPRLevel().then((value) {
      pbLog('flutter:Get GDPR --${value.toString()}');
    });
  }

  setDataConsentSet() async {
    await ATInitManger.setDataConsentSet(
      gdprLevel: ATInitManger.dataConsentSetPersonalized(),
    );
  }

  deniedUploadDeviceInfo() async {
    await ATInitManger.deniedUploadDeviceInfo(
      deniedUploadDeviceInfoList: [ATInitManger.aOAID()],
    );
  }

  // 展示GDPR的界面 (v6.2.87废弃，请使用showGDPRConsentDialog()代替)
  showGDPRAuth() async {
    await ATInitManger.showGDPRAuth();
  }

  // v6.2.87+, 展示GDPR的界面(UMP)
  showGDPRConsentDialog() async {
    await ATInitManger.showGDPRConsentDialog();
  }

  // 获取GDPR的监听事件回调
  initListen() {
    ATListenerManager.initEventHandler.listen((value) {
      if (value.userLocation != null) {
        switch (value.userLocation) {
          case InitUserLocation.initUserLocationInEU:
            pbLog("flutter Monitor initial user location in the EU--");

            ATInitManger.getGDPRLevel().then((value) {
              if (value == ATInitManger.dataConsentSetUnknown()) {
                showGDPRAuth();
              }
            });
            break;
          case InitUserLocation.initUserLocationOutOfEU:
            pbLog(
              "flutter: flutter The location of the listening initial user is not in the EU",
            );
            break;
          case InitUserLocation.initUserLocationUnknown:
            pbLog(
              "flutter: flutter The location of the initial listening user is unknown",
            );
            break;
        }
      }

      if (value.consentDismiss != null) {
        pbLog("flutter: flutter consent dismiss callback");
      }
    });
  }

  // 初始化TopOn的SDK
  initTopon({
    required void Function(ATRewardResponse)? atRewardResponse,
    required void Function(ATInterstitialResponse)? atInterstitialResponse,
  }) async {
    try {
      String appidS = PBPeizhi.isDEV() ? "h68f08f5ae3b21" : "h68ad7ba66635c";
      String appidkeyStr= PBPeizhi.isDEV()
          ? "a6e684ab80848d5a5792d0027fb5443b5"
          : "aa25858a3da423bc9ff10facbbeed3794";
      String result = await ATInitManger.initAnyThinkSDK(
        appidStr: appidS,
        appidkeyStr: appidkeyStr,
      );
      interstitialListener(atInterstitialResponse);
      rewardListener(atRewardResponse);
      pbLog("==initTopon====appidS:$appidS appidkeyStr:$appidkeyStr result:$result ");
    } catch (e) {
      pbLog("==initTopon====error:$e");
    }
  }

  // 加载Interstitial广告
  loadInterstitialAd({required String placementId}) async {
    // bool result =  await hasInterAdReady(placementId);
    await ATInterstitialManager.loadInterstitialAd(
      placementID: placementId,
      extraMap: {},
    );
  }

  // 判断是否有广告缓存：
  hasInterAdReady({required String placementId}) async {
    bool result = await ATInterstitialManager.hasInterstitialAdReady(
      placementID: placementId,
    );
    pbLog('===topon===flutter插屏广告视频缓存hasInterAdReady:$result');
    return result;
  }

  // 插屏广告只要调用展示api并传递展示广告位ID
  showInterAd({required String placementId}) async {
    await ATInterstitialManager.showInterstitialAd(placementID: placementId);
  }

  // 实现插屏的监听器
  // ATInterstitialResponse属性介绍:
  //
  // InterstitialStatus: 插屏广告状态
  //
  // placementID: placementID
  //
  // requestMessage: 请求信息（错误信息）
  //
  // extraMap: 回调信息
  //
  // isDeeplinkSuccess: isDeeplinkSuccess
  //
  // 有关插屏广告事件的通知示例如下:
  interstitialListener(
    void Function(ATInterstitialResponse)? atInterstitialResponse,
  ) {
    ATListenerManager.interstitialEventHandler.listen(atInterstitialResponse);
    return;
  }

  loadRewardedVideo({required String placementId}) async {
    pbLog("====topon激励=====loadRewardedVideo");
    await ATRewardedManager.loadRewardedVideo(
      placementID: placementId,
      extraMap: {
        ATRewardedManager.kATAdLoadingExtraUserDataKeywordKey(): '1234',
        ATRewardedManager.kATAdLoadingExtraUserIDKey(): '1234',
      },
    );
  }

  // 判断是否有广告缓存：
  hasRewardAdReady({required String placementId}) async {
    bool result = await ATRewardedManager.rewardedVideoReady(
      placementID: placementId,
    );
    pbLog('==topon===广告视频缓存hasRewardAdReady:$result');
    return result;
  }

  // 激励视频只要调用展示api并传递展示广告位ID
  showRewardAd({required String placementId}) async {
    await ATRewardedManager.showRewardedVideo(placementID: placementId);
  }

  // 实现激励视频的监听器
  // ATRewardResponse属性介绍:
  //
  // RewardedStatus: 激励视频状态
  //
  // placementID: placementID
  //
  // requestMessage: 请求信息（错误信息）
  //
  // extraMap: 回调信息
  //
  // isDeeplinkSuccess: isDeeplinkSuccess
  rewardListener(void Function(ATRewardResponse)? atRewardResponse) {
    ATListenerManager.rewardedVideoEventHandler.listen(atRewardResponse);
    return;
  }
}
