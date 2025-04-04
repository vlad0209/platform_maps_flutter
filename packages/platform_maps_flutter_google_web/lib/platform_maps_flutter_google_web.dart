library platform_maps_flutter_google_web;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:platform_maps_flutter_google_web/src/google_maps_bitmap_descriptor.dart';
import 'package:platform_maps_flutter_google_web/src/google_maps_camera_update.dart';
import 'package:platform_maps_flutter_google_web/src/google_maps_widget.dart';
import 'package:platform_maps_flutter_platform_interface/platform_maps_flutter_platform_interface.dart';

class PlatformMapsGoogleWeb extends PlatformMapsPlatform {
  static void registerWith(Registrar registrar) {
    PlatformMapsPlatform.instance = PlatformMapsGoogleWeb();
  }

  /// Create a new [PlatformPlatformMapsWidget].
  ///
  /// This function should only be called by the app-facing package.
  /// Look at using [PlatformMap] in `platform_maps_flutter` instead.
  @override
  PlatformMapsPlatformWidget createPlatformMapsPlatformWidget(
    PlatformMapsPlatformWidgetCreationParams params,
  ) {
    return GoogleMapsWidget(params);
  }

  /// Create a new [PlatformBitmapDescriptor].
  /// This function should only be called by the app-facing package.
  @override
  GoogleMapsPlatformBitmapDescriptor createBitmapDescriptor() {
    return GoogleMapsPlatformBitmapDescriptor();
  }

  @override
  PlatformCameraUpdate createPlatformCameraUpdate() {
    return GoogleMapsPlatformCameraUpdate();
  }
}
