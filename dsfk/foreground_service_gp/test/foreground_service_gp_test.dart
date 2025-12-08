import 'package:flutter_test/flutter_test.dart';
import 'package:foreground_service_gp/foreground_service_gp.dart';
import 'package:foreground_service_gp/foreground_service_gp_platform_interface.dart';
import 'package:foreground_service_gp/foreground_service_gp_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockForegroundServiceGpPlatform
    with MockPlatformInterfaceMixin
    implements ForegroundServiceGpPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ForegroundServiceGpPlatform initialPlatform = ForegroundServiceGpPlatform.instance;

  test('$MethodChannelForegroundServiceGp is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelForegroundServiceGp>());
  });

  test('getPlatformVersion', () async {
    ForegroundServiceGp foregroundServiceGpPlugin = ForegroundServiceGp();
    MockForegroundServiceGpPlatform fakePlatform = MockForegroundServiceGpPlatform();
    ForegroundServiceGpPlatform.instance = fakePlatform;

    expect(await foregroundServiceGpPlugin.getPlatformVersion(), '42');
  });
}
