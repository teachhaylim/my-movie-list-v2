import 'package:get/get.dart';
import 'package:my_movie_list_v2/core/routes.dart';
import 'package:my_movie_list_v2/views/change_theme/change_theme.screen.dart';
import 'package:my_movie_list_v2/views/main_scaffold/main_scaffold.dart';
import 'package:my_movie_list_v2/views/splash_screen/splash.screen.dart';

class AppRouter {
  static final router = [
    GetPage(name: AppRoutes.mainScaffoldScreen, showCupertinoParallax: false, page: () => const MainScaffold()),
    GetPage(name: AppRoutes.splashScreen, showCupertinoParallax: false, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.changeThemeScreen, showCupertinoParallax: false, page: () => const ChangeThemeScreen()),
  ];
}
