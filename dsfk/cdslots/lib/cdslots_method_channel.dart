import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cdslots_platform_interface.dart';

/// An implementation of [CdslotsPlatform] that uses method channels.
class MethodChannelCdslots extends CdslotsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cdslots');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
