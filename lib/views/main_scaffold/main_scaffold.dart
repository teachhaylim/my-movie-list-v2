import 'package:flutter/material.dart';
import 'package:my_movie_list_v2/core/locale.dart';
import 'package:my_movie_list_v2/views/main_scaffold/home/home.screen.dart';
import 'package:my_movie_list_v2/views/main_scaffold/search/search.screen.dart';
import 'package:my_movie_list_v2/views/setting/setting.screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: const [
          HomeScreen(),
          SearchScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (index) => setState(() => currentPageIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: AppLocale.navigationHomeLabel,
            tooltip: "",
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search_rounded),
            label: AppLocale.navigationSearchLabel,
            tooltip: "",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings_rounded),
            label: AppLocale.navigationSettingLable,
            tooltip: "",
          ),
        ],
      ),
    );
  }
}
