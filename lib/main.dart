import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:my_movie_list_v2/core/di.dart";
import 'package:my_movie_list_v2/core/locale/locale.dart';
import 'package:my_movie_list_v2/core/navigation/router.dart';
import 'package:my_movie_list_v2/core/navigation/routes.dart';
import 'package:my_movie_list_v2/core/config/theme.dart';
import "package:my_movie_list_v2/utils/ext/shared_preference.ext.dart";
import "package:shared_preferences/shared_preferences.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyMovieListApp());
}

class MyMovieListApp extends StatelessWidget {
  const MyMovieListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppLocale.appName,
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
