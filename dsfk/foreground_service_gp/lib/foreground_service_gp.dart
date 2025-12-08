
import 'foreground_service_gp_platform_interface.dart';

class ForegroundServiceGp {
  Future<String?> getPlatformVersion() {
    return ForegroundServiceGpPlatform.instance.getPlatformVersion();
  }


  start({
    String title = 'Running',
    String content = 'App is running in background',
  }){
    return ForegroundServiceGpPlatform.instance.start(title: title,content: content);
  }
}
