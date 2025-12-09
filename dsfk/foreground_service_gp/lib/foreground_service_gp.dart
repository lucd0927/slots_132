import 'dart:ui';

import 'foreground_service_gp_platform_interface.dart';

class ForegroundServiceGp {
  Future<String?> getPlatformVersion() {
    return ForegroundServiceGpPlatform.instance.getPlatformVersion();
  }

  Future<bool> start({
    String title = 'Running',
    String content = 'App is running in background',
    String imgNameSmall = 'tzps',
    String imgNameBg = 'tzp',
  }) async {
    return ForegroundServiceGpPlatform.instance.start(
      title: title,
      content: content,
      imgNameSmall: imgNameSmall,
      imgNameBg: imgNameBg,
    );
  }

  initListener(VoidCallback onClick) {
    ForegroundServiceGpPlatform.instance.initListener(() {
      onClick.call();
    });
  }
}
