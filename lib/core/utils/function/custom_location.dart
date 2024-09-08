import 'package:geolocator/geolocator.dart';

Future<void> fetchLocation() async {
  try {
    Position position = await getCurrentLocation();
    String mapLink = generateGoogleMapsLink(position);
    print("Your location: $mapLink");
  } catch (e) {
    print("Error: $e");
  }
}

Future<Position> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  // Check for location permission
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  return await Geolocator.getCurrentPosition();
}

String generateGoogleMapsLink(Position position) {
  double latitude = position.latitude;
  double longitude = position.longitude;
  return "google.navigation:q=$latitude,$longitude";
}
