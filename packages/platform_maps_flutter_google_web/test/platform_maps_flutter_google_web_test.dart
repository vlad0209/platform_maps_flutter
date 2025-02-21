import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:mockito/mockito.dart';
import 'package:platform_maps_flutter_google_web/platform_maps_flutter_google_web.dart';
import 'package:platform_maps_flutter_google_web/src/google_maps_bitmap_descriptor.dart';
import 'package:platform_maps_flutter_google_web/src/google_maps_camera_update.dart';
import 'package:platform_maps_flutter_google_web/src/google_maps_widget.dart';
import 'package:platform_maps_flutter_platform_interface/platform_maps_flutter_platform_interface.dart';

// Mock dependencies
class MockPlatformMapsPlatformWidgetCreationParams extends Mock
    implements PlatformMapsPlatformWidgetCreationParams {}

void main() {
  group('PlatformMapsGoogleWeb Tests', () {
    late PlatformMapsGoogleWeb platformMapsGoogleWeb;

    setUp(() {
      platformMapsGoogleWeb = PlatformMapsGoogleWeb();
    });

    test('should register itself as the instance', () {
      // Act
      PlatformMapsGoogleWeb.registerWith(Registrar());

      // Assert
      expect(PlatformMapsPlatform.instance, isA<PlatformMapsGoogleWeb>());
    }, skip: !kIsWeb,);

    test('should create a GoogleMapsWidget when calling createPlatformMapsPlatformWidget', () {
      // Arrange
      final mockParams = MockPlatformMapsPlatformWidgetCreationParams();

      // Act
      final widget = platformMapsGoogleWeb.createPlatformMapsPlatformWidget(mockParams);

      // Assert
      expect(widget, isA<GoogleMapsWidget>());
    }, skip: !kIsWeb,);

    test('should create a GoogleMapsPlatformBitmapDescriptor when calling createBitmapDescriptor', () {
      // Act
      final bitmapDescriptor = platformMapsGoogleWeb.createBitmapDescriptor();

      // Assert
      expect(bitmapDescriptor, isA<GoogleMapsPlatformBitmapDescriptor>());
    }, skip: !kIsWeb,);

    test('should create a GoogleMapsPlatformCameraUpdate when calling createPlatformCameraUpdate', () {
      // Act
      final cameraUpdate = platformMapsGoogleWeb.createPlatformCameraUpdate();

      // Assert
      expect(cameraUpdate, isA<GoogleMapsPlatformCameraUpdate>());
    }, skip: !kIsWeb,);
  });
}
