import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencyInjection(PackageInfo packageInfo) async {
  final prefs = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<PackageInfo>(() => packageInfo);
}
