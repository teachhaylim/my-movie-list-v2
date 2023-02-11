import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:my_movie_list_v2/core/network/api_request.dart';
import 'package:my_movie_list_v2/core/config/app_info.dart';
import 'package:my_movie_list_v2/domain/apis/movie/movie.api.dart';
import 'package:my_movie_list_v2/domain/repo/movie.repo.dart';
import 'package:my_movie_list_v2/domain/repo_impl/movie.repo.impl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
final logger = Logger();

Future<void> initDependencyInjection() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  final AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
  final IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<AppInfo>(() => AppInfo(packageInfo: packageInfo, androidDeviceInfo: androidDeviceInfo, iosDeviceInfo: iosDeviceInfo));
  getIt.registerLazySingleton<Dio>(() => dio);

  //! API
  getIt.registerLazySingleton<MovieApi>(() => MovieApi(getIt()));

  //! Repo
  getIt.registerLazySingleton<MovieRepo>(() => MovieRepoImpl(movieApi: getIt()));
}
