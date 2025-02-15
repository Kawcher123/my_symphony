import 'dart:async';
import 'dart:ui' as ui;
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ServiceCenterController extends GetxController {
  GoogleMapController? mapController;
  var currentLocation = LatLng(23.8103, 90.4125).obs;
  var markers = <Marker>{}.obs;
  var serviceCenters = <Map<String, dynamic>>[].obs;
  var polylines = <Polyline>{}.obs;
  var isLoading = true.obs; // Track loading state
  var locationPermissionGranted = false.obs; // Track location permission status

  @override
  void onInit() {
    super.onInit();
    _checkLocationPermission();
  }


  void _checkLocationPermission() async {
    try {
      Location location = Location();
      var permissionStatus = await location.hasPermission();

      // Continuously request permission until granted
      while (permissionStatus == PermissionStatus.denied ||
          permissionStatus == PermissionStatus.deniedForever) {
        permissionStatus = await location.requestPermission();
        if (permissionStatus == PermissionStatus.granted) {
          locationPermissionGranted.value = true;
          _getCurrentLocation();
          return;
        } else {
          locationPermissionGranted.value = false;
          await _showPermissionDeniedDialog(); // Ensure user sees this every time
        }
      }

      if (permissionStatus == PermissionStatus.granted) {
        locationPermissionGranted.value = true;
        _getCurrentLocation();
      }
    } catch (e) {
      locationPermissionGranted.value = false;
      _handleError(e);
    }
  }

  // Show permission denied dialog every time until permission is granted
  Future<void> _showPermissionDeniedDialog() async {
    await Get.dialog(
      AlertDialog(
        title: Text('Permission Denied'),
        content: Text('Location permission is required to access this screen. Please allow permission in settings.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              openAppSettings(); // Open app settings for user to manually allow permission
            },
            child: Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  // Method to open app settings
  void openAppSettings() {
    AppSettings.openAppSettings();
  }


  // Get current location after permission is granted
  void _getCurrentLocation() async {
    if (!locationPermissionGranted.value) return;

    try {
      Location location = Location();
      var userLocation = await location.getLocation();
      currentLocation.value = LatLng(userLocation.latitude!, userLocation.longitude!);
      _moveCameraToCurrentLocation(); // Move camera after fetching location
      _loadServiceCenters();
    } catch (e) {
      _handleError(e);
    }
  }

  // Move camera to the current location
  void _moveCameraToCurrentLocation() {
    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(currentLocation.value, 14), // Adjust zoom level as needed
      );
    }
  }

  // Load service centers and markers concurrently in a single loop
  void _loadServiceCenters() async {
    try {
      isLoading.value = true;

      // Create a list of Future tasks to generate markers concurrently
      List<Future<Map<String, dynamic>>> markerTasks = List.generate(10, (index) async {
        double lat = 23.8103 + (index * 0.01);
        double lng = 90.4125 + (index * 0.01);

        // Create the service center data with explicit types
        var center = <String, dynamic>{
          'name': 'Service Center ${index + 1}',
          'address': 'Address ${index + 1}, Dhaka',
          'distance': '${(index + 1) * 0.5} KM',
          'latLng': LatLng(lat, lng),
        };

        // Create the custom marker for each service center concurrently
        final markerIcon = await _createCustomMarkerFromUrl('assets/icons/shop_cart.png'); // Your image path here

        // Add the marker to the set of markers
        markers.add(
          Marker(
            markerId: MarkerId(center['name'] as String), // Cast 'name' to String explicitly
            position: center['latLng'] as LatLng, // Cast 'latLng' to LatLng explicitly
            icon: markerIcon, // Set custom marker icon here
            infoWindow: InfoWindow(title: center['name'] as String, snippet: center['address'] as String),
            onTap: () => drawPolyline(center['latLng'] as LatLng),
          ),
        );

        return center; // Return the service center data explicitly typed as Map<String, dynamic>
      });

      // Wait for all marker creation tasks to finish and assign service centers to the list
      serviceCenters.value = await Future.wait(markerTasks);

      isLoading.value = false;
    } catch (e) {
      _handleError(e);
    }
  }



  // Create custom marker from asset or URL
  Future<BitmapDescriptor> _createCustomMarkerFromUrl(String imageUrl) async {
    try {
      final imageProvider = AssetImage(imageUrl);
      final imageStream = imageProvider.resolve(ImageConfiguration());

      final completer = Completer<ui.Image>();
      imageStream.addListener(
          ImageStreamListener((ImageInfo imageInfo, bool synchronousCall) {
            completer.complete(imageInfo.image);
          }));

      final image = await completer.future;

      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);
      const size = Size(120, 180);
      const circleRadius = 35.0;
      final centerX = size.width / 2;
      const centerY = 50.0;
      const tailHeight = 30.0;
      const tailWidth = 25.0;
      const tailY = centerY + circleRadius;

      // Draw marker background
      final markerPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(centerX, centerY), circleRadius, markerPaint);

      // Draw border
      final borderPaint = Paint()
        ..color = Get.theme.primaryColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10;
      canvas.drawCircle(Offset(centerX, centerY), circleRadius, borderPaint);

      // Draw pointer tail
      final tailPath = Path()
        ..moveTo(centerX - tailWidth / 2, tailY)
        ..lineTo(centerX, tailY + tailHeight)
        ..lineTo(centerX + tailWidth / 2, tailY)
        ..close();
      final tailPaint = Paint()
        ..color = Get.theme.primaryColor
        ..style = PaintingStyle.fill;
      canvas.drawPath(tailPath, tailPaint);

      // Draw profile image
      final clipPath = Path()
        ..addOval(Rect.fromCircle(center: Offset(centerX, centerY), radius: circleRadius));
      canvas.clipPath(clipPath);
      canvas.drawImageRect(
        image,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        Rect.fromCircle(center: Offset(centerX, centerY), radius: circleRadius),
        Paint(),
      );

      final picture = recorder.endRecording();
      final img = await picture.toImage(size.width.toInt(), size.height.toInt());
      final data = await img.toByteData(format: ui.ImageByteFormat.png);

      if (data == null) throw Exception('Failed to create marker image');
      return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
    } catch (e) {
      debugPrint('Error creating custom marker: $e');
      return BitmapDescriptor.defaultMarker;
    }
  }

  // Update markers with custom shop cart icon
  void _updateMarkers() async {
    try {
      markers.clear();
      final markerIcon = await _createCustomMarkerFromUrl('assets/icons/shop_cart.png'); // Your image path here

      for (var center in serviceCenters) {
        markers.add(
          Marker(
            markerId: MarkerId(center['name']),
            position: center['latLng'],
            icon: markerIcon, // Set custom marker icon here
            infoWindow: InfoWindow(title: center['name'], snippet: center['address']),
            onTap: () => drawPolyline(center['latLng']),
          ),
        );
      }
    } catch (e) {
      _handleError(e);
    }
  }

  // Draw polyline when a service center marker is clicked
  void drawPolyline(LatLng destination) async {
    try {
      // Show loading dialog
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      print('Drawing polyline to $destination');
      polylines.clear();
      PolylinePoints polylinePoints = PolylinePoints();

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: '', // Replace with your actual API key
        request: PolylineRequest(
          origin: PointLatLng(currentLocation.value.latitude, currentLocation.value.longitude),
          destination: PointLatLng(destination.latitude, destination.longitude),
          mode: TravelMode.driving,
        ),
      );

      // Close loading dialog after route is drawn
      Get.back();

      if (result.status == 'OK' && result.points.isNotEmpty) {
        List<LatLng> polylineCoordinates = result.points
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList();

        polylines.add(
          Polyline(
            polylineId: PolylineId("route"),
            points: polylineCoordinates,
            color: Get.theme.primaryColor,
            width: 5,
          ),
        );

        // Move camera to the destination service center location
        _moveCameraToDestination(destination);
      } else {
        print("Error retrieving route: ${result.errorMessage}");
      }
    } catch (e) {
      Get.back(); // Close loading dialog
      _handleError(e);
    }
  }

  // Move camera to the destination
  void _moveCameraToDestination(LatLng destination) {
    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(destination, 14), // Adjust zoom level as needed
      );
    }
  }

  // Handle errors and display error dialog
  void _handleError(dynamic error) {
    print("Error: $error");
    Get.snackbar(
      "Error",
      "Something went wrong. Please try again later.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }



  // Method to set the GoogleMapController after the map is initialized
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
