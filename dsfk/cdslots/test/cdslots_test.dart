import 'package:flutter_test/flutter_test.dart';
import 'package:cdslots/cdslots.dart';
import 'package:cdslots/cdslots_platform_interface.dart';
import 'package:cdslots/cdslots_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCdslotsPlatform
    with MockPlatformInterfaceMixin
    implements CdslotsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CdslotsPlatform initialPlatform = CdslotsPlatform.instance;

  test('$MethodChannelCdslots is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCdslots>());
  });

  test('getPlatformVersion', () async {
    Cdslots cdslotsPlugin = Cdslots();
    MockCdslotsPlatform fakePlatform = MockCdslotsPlatform();
    CdslotsPlatform.instance = fakePlatform;

    expect(await cdslotsPlugin.getPlatformVersion(), '42');
  });
}
