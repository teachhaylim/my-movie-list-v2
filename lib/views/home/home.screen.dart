import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_list_v2/core/config/colors.dart';
import 'package:my_movie_list_v2/core/locale/locale.dart';
import 'package:my_movie_list_v2/core/widgets/dialog.dart';
import 'package:my_movie_list_v2/views/home/bloc/home_screen.bloc.dart';
import 'package:my_movie_list_v2/views/home/components/main_banner.dart';
import 'package:my_movie_list_v2/views/home/movie_tab/movie_tab.dart';
import 'package:my_movie_list_v2/views/shared_components/skeleton_loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late HomeScreenBloc homeScreenBloc;
  int tabIndex = 0;

  final List<Widget> tabs = [
    Tab(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.movie_rounded),
          SizedBox(width: 8),
          Text("Movies"),
        ],
      ),
    ),
    Tab(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.tv_rounded),
          SizedBox(width: 8),
          Text("Tv Shows"),
        ],
      ),
    ),
  ];

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: tabs.length, vsync: this);
    homeScreenBloc = HomeScreenBloc()..add(const HomeScreenGetMainBannerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeScreenBloc,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text(AppLocale.appName),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              BlocBuilder<HomeScreenBloc, HomeScreenState>(
                buildWhen: (pre, cur) => cur is HomeScreenMainBannerLoadedState || cur is HomeScreenMainBannerLoadingState,
                builder: (context, state) {
                  if (state is HomeScreenMainBannerLoadedState) {
                    return SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.only(top: 8),
                        child: MainBanner(movies: state.banners),
                      ),
                    );
                  }

                  if (state is HomeScreenMainBannerLoadingState) {
                    return SliverToBoxAdapter(
                      child: SkeletonLoading.boxSkeleton(marginSize: 16),
                    );
                  }

                  return SliverToBoxAdapter(
                    child: Container(),
                  );
                },
              ),
              SliverAppBar(
                pinned: true,
                elevation: 0,
                titleSpacing: 0,
                floating: true,
                title: TabBar(
                  controller: controller,
                  tabs: tabs,
                  dividerColor: Colors.transparent,
                  onTap: (index) {
                    setState(() => tabIndex = index);
                  },
                ),
              ),
            ];
          },
          body: IndexedStack(
            index: tabIndex,
            children: [
              const MovieTab(),
              Container(),
            ],
          ),
          // body: TabBarView(
          //   controller: controller,
          //   children: [
          //     const MovieTab(),
          //     Container(),
          //   ],
          // ),
        ),
      ),
    );
  }
}
