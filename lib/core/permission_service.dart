import 'package:permission_handler/permission_handler.dart';

PermissionStatus? permissionStorageStatus;
PermissionStatus? permissionCameraStatus;

Future<bool> isPermissionStorageGranted() async {
  permissionStorageStatus = await Permission.storage.status;

  if (permissionStorageStatus == PermissionStatus.denied) {
    permissionStorageStatus = await Permission.storage.request();
    return permissionStorageStatus == PermissionStatus.granted;
  } else {
    return permissionStorageStatus == PermissionStatus.granted;
  }
}

Future<bool> isPermissionCameraGranted() async {
  permissionCameraStatus = await Permission.camera.status;

  if (permissionCameraStatus == PermissionStatus.denied) {
    permissionCameraStatus = await Permission.camera.request();
    return permissionCameraStatus == PermissionStatus.granted;
  } else {
    return permissionCameraStatus == PermissionStatus.granted;
  }
}