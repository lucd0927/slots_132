
import 'foreground_service_gp_platform_interface.dart';

class ForegroundServiceGp {
  Future<String?> getPlatformVersion() {
    return ForegroundServiceGpPlatform.instance.getPlatformVersion();
  }
}
