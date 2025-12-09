import 'dart:ui';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'foreground_service_gp_method_channel.dart';

abstract class ForegroundServiceGpPlatform extends PlatformInterface {
  /// Constructs a ForegroundServiceGpPlatform.
  ForegroundServiceGpPlatform() : super(token: _token);

  static final Object _token = Object();

  static ForegroundServiceGpPlatform _instance = MethodChannelForegroundServiceGp();

  /// The default instance of [ForegroundServiceGpPlatform] to use.
  ///
  /// Defaults to [MethodChannelForegroundServiceGp].
  static ForegroundServiceGpPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ForegroundServiceGpPlatform] when
  /// they register themselves.
  static set instance(ForegroundServiceGpPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Future<bool> start({
    String title = 'Running',
    String content = 'App is running in background',
    String imgNameSmall = 'tzps',
    String imgNameBg = 'tzp',
  }) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  void initListener(VoidCallback onClick);


}
