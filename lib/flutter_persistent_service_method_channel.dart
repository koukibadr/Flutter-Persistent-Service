import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_persistent_service_platform_interface.dart';

/// An implementation of [FlutterPersistentServicePlatform] that uses method channels.
class MethodChannelFlutterPersistentService extends FlutterPersistentServicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_persistent_service');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
