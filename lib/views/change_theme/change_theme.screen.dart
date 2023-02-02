import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie_list_v2/core/di.dart';
import 'package:my_movie_list_v2/core/locale.dart';
import 'package:my_movie_list_v2/utils/ext/shared_preference.ext.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeThemeScreen extends StatefulWidget {
  const ChangeThemeScreen({super.key});

  @override
  State<ChangeThemeScreen> createState() => _ChangeThemeScreenState();
}

class _ChangeThemeScreenState extends State<ChangeThemeScreen> {
  void _handleUpdateTheme(ThemeMode theme) {
    getIt<SharedPreferences>().savedTheme = theme;
    Get.changeThemeMode(theme);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(AppLocale.changeThemeText),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.light_mode_rounded),
            title: const Text(AppLocale.lightThemeText),
            trailing: getIt<SharedPreferences>().savedTheme == ThemeMode.light ? const Icon(Icons.check_rounded) : null,
            onTap: () => _handleUpdateTheme(ThemeMode.light),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode_rounded),
            title: const Text(AppLocale.darkThemeText),
            trailing: getIt<SharedPreferences>().savedTheme == ThemeMode.dark ? const Icon(Icons.check_rounded) : null,
            onTap: () => _handleUpdateTheme(ThemeMode.dark),
          ),
          ListTile(
            leading: const Icon(Icons.phone_android_rounded),
            title: const Text(AppLocale.systemThemeText),
            trailing: getIt<SharedPreferences>().savedTheme == ThemeMode.system ? const Icon(Icons.check_rounded) : null,
            onTap: () => _handleUpdateTheme(ThemeMode.system),
          ),
        ],
      ),
    );
  }
}
