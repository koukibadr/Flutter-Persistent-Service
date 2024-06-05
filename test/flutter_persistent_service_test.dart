import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_persistent_service/flutter_persistent_service.dart';
import 'package:flutter_persistent_service/flutter_persistent_service_platform_interface.dart';
import 'package:flutter_persistent_service/flutter_persistent_service_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPersistentServicePlatform
    with MockPlatformInterfaceMixin
    implements FlutterPersistentServicePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterPersistentServicePlatform initialPlatform = FlutterPersistentServicePlatform.instance;

  test('$MethodChannelFlutterPersistentService is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPersistentService>());
  });

  test('getPlatformVersion', () async {
    FlutterPersistentService flutterPersistentServicePlugin = FlutterPersistentService();
    MockFlutterPersistentServicePlatform fakePlatform = MockFlutterPersistentServicePlatform();
    FlutterPersistentServicePlatform.instance = fakePlatform;

    expect(await flutterPersistentServicePlugin.getPlatformVersion(), '42');
  });
}
