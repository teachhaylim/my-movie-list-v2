import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  final PackageInfo packageInfo;
  final AndroidDeviceInfo androidDeviceInfo;
  final IosDeviceInfo iosDeviceInfo;

  const AppInfo({required this.packageInfo, required this.androidDeviceInfo, required this.iosDeviceInfo});
}
