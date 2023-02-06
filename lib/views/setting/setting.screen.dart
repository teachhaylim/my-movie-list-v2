import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie_list_v2/core/app_info.dart';
import 'package:my_movie_list_v2/core/di.dart';
import 'package:my_movie_list_v2/core/dialog.dart';
import 'package:my_movie_list_v2/core/locale.dart';
import 'package:my_movie_list_v2/core/routes.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlutterLogo(size: 80),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Dolores nulla takimata consetetur lorem. Sit ea et. Dolor est sit esse dolor feugiat. Ipsum in dolore ut magna tempor clita et dolor sadipscing dolore. Dolores nulla takimata consetetur lorem. Sit ea et. Dolor est sit esse dolor feugiat. Ipsum in dolore ut magna tempor clita et dolor sadipscing dolore",
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.color_lens_rounded),
            title: const Text(AppLocale.changeThemeText),
            onTap: () => Get.toNamed(AppRoutes.changeThemeScreen),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: const Text(AppLocale.aboutText),
            onTap: () => CustomSimpleDialog.showMessageDialog(context: context, message: ""),
          ),
          const Spacer(),
          Text(getIt<AppInfo>().packageInfo.version),
          const SizedBox(height: 8),
          const Text(AppLocale.madeWithLoveText),
          const SizedBox(height: 16, width: double.infinity),
        ],
      ),
    );
  }
}
