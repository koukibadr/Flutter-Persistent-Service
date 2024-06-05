import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_persistent_service_method_channel.dart';

abstract class FlutterPersistentServicePlatform extends PlatformInterface {
  /// Constructs a FlutterPersistentServicePlatform.
  FlutterPersistentServicePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPersistentServicePlatform _instance = MethodChannelFlutterPersistentService();

  /// The default instance of [FlutterPersistentServicePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPersistentService].
  static FlutterPersistentServicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPersistentServicePlatform] when
  /// they register themselves.
  static set instance(FlutterPersistentServicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
