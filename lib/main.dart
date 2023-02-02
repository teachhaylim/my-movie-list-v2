import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:my_movie_list_v2/core/di.dart";
import "package:my_movie_list_v2/core/router.dart";
import "package:my_movie_list_v2/core/routes.dart";
import "package:my_movie_list_v2/core/theme.dart";
import "package:my_movie_list_v2/utils/ext/shared_preference.ext.dart";
import "package:package_info_plus/package_info_plus.dart";
import "package:shared_preferences/shared_preferences.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  await initDependencyInjection(packageInfo);
  runApp(const MyMovieListApp());
}

class MyMovieListApp extends StatelessWidget {
  const MyMovieListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My Movie List",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: getIt<SharedPreferences>().savedTheme,
      getPages: AppRouter.router,
      initialRoute: AppRoutes.splashScreen,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
    );
  }
}
