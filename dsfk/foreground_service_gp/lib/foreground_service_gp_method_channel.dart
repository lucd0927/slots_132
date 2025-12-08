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
}
