import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'cdslots_method_channel.dart';

abstract class CdslotsPlatform extends PlatformInterface {
  /// Constructs a CdslotsPlatform.
  CdslotsPlatform() : super(token: _token);

  static final Object _token = Object();

  static CdslotsPlatform _instance = MethodChannelCdslots();

  /// The default instance of [CdslotsPlatform] to use.
  ///
  /// Defaults to [MethodChannelCdslots].
  static CdslotsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CdslotsPlatform] when
  /// they register themselves.
  static set instance(CdslotsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
