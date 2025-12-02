
import 'cdslots_platform_interface.dart';

class Cdslots {
  Future<String?> getPlatformVersion() {
    return CdslotsPlatform.instance.getPlatformVersion();
  }
}
