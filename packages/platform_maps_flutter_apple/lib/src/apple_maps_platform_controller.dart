import 'dart:typed_data';

import 'package:apple_maps_flutter/apple_maps_flutter.dart' as apple_maps;
import 'package:platform_maps_flutter_apple/src/apple_maps_camera_update.dart';
import 'package:platform_maps_flutter_apple/src/mapper_extensions.dart';
import 'package:platform_maps_flutter_platform_interface/platform_maps_flutter_platform_interface.dart';


class AppleMapsPlatformController extends PlatformMapsPlatformController {
  AppleMapsPlatformController(this._appleMapController);
  final apple_maps.AppleMapController _appleMapController;

  @override
  Future<void> animateCamera(CameraUpdate cameraUpdate) {
    if (cameraUpdate is AppleMapsCameraUpdate) {
      return _appleMapController
          .animateCamera(cameraUpdate.appleMapsCameraUpdate);
    }
    throw UnsupportedError(
      'AppleMapsPlatformController: animateCamera - cameraUpdate is not a AppleMapsCameraUpdate\n${cameraUpdate.toString()}',
    );
  }

  @override
  Future<LatLngBounds> getVisibleRegion() async {
    final visibleRegion = await _appleMapController.getVisibleRegion();
    return visibleRegion.platformLatLngBounds;
  }

  @override
  Future<void> hideMarkerInfoWindow(MarkerId markerId) {
    return _appleMapController
        .hideMarkerInfoWindow(markerId.appleMapsAnnotationId);
  }

  @override
  Future<bool> isMarkerInfoWindowShown(MarkerId markerId) async {
    return (await _appleMapController
            .isMarkerInfoWindowShown(markerId.appleMapsAnnotationId)) ??
        false;
  }

  @override
  Future<void> moveCamera(CameraUpdate cameraUpdate) {
    if (cameraUpdate is AppleMapsCameraUpdate) {
      return _appleMapController.moveCamera(cameraUpdate.appleMapsCameraUpdate);
    }
    throw UnsupportedError(
      'AppleMapsPlatformController: moveCamera - cameraUpdate is not a AppleMapsCameraUpdate\n${cameraUpdate.toString()}',
    );
  }

  @override
  Future<void> showMarkerInfoWindow(MarkerId markerId) {
    return _appleMapController
        .showMarkerInfoWindow(markerId.appleMapsAnnotationId);
  }

  @override
  Future<Uint8List?> takeSnapshot() {
    return _appleMapController.takeSnapshot();
  }

  @override
  Future<void> lookAround(
      LatLng latLng, List<PointOfInterestCategory> poiFilter,) async {
    return _appleMapController.lookAround(
        apple_maps.LatLng(latLng.latitude, latLng.longitude),
        poiFilter
            .map((e) => apple_maps.PointOfInterestCategory.values[e.index])
            .toList(),);
  }

  @override
  Future<bool> isLookAroundAvailable(LatLng latLng) async {
    return (await _appleMapController.isLookAroundAvailable(
          apple_maps.LatLng(latLng.latitude, latLng.longitude),
        )) ??
        false;
  }
}
