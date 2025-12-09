import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'foreground_service_gp_platform_interface.dart';

/// An implementation of [ForegroundServiceGpPlatform] that uses method channels.
class MethodChannelForegroundServiceGp extends ForegroundServiceGpPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('foreground_service_gp');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> start({
    String title = 'Running',
    String content = 'App is running in background',
    String imgNameSmall = 'tzps',
    String imgNameBg = 'tzp',
  }) async {
    final result = await methodChannel.invokeMethod('start', {
      'title': title,
      'content': content,
      'imgNameSmall': imgNameSmall,
      'imgNameBg': imgNameBg,
    });
    print("=====MethodChannelForegroundServiceGp result:$result=");
    return result == true;
  }


   void initListener(VoidCallback onClick) {
     methodChannel.setMethodCallHandler((call) async {
      if (call.method == 'onNotificationClick') {
        print('=========通知被点击了');
        onClick.call();
        // 你可以在这里：
        // Navigator.push(...)
        // 或刷新 UI
      }
    });
  }

}
