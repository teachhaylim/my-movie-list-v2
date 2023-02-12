import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_list_v2/views/home/bloc/home_screen.bloc.dart';
import 'package:my_movie_list_v2/views/home/components/list_item.dart';

class MovieTab extends StatefulWidget {
  const MovieTab({super.key});

  @override
  State<MovieTab> createState() => _MovieTabState();
}

class _MovieTabState extends State<MovieTab> {
  @override
  void initState() {
    super.initState();
    context.read<HomeScreenBloc>()
      ..add(const HomeScreenGetMoviesByTypeEvent(type: HomeScreenTypeEnum.popular))
      ..add(const HomeScreenGetMoviesByTypeEvent(type: HomeScreenTypeEnum.nowPlaying))
      ..add(const HomeScreenGetMoviesByTypeEvent(type: HomeScreenTypeEnum.upcoming))
      ..add(const HomeScreenGetMoviesByTypeEvent(type: HomeScreenTypeEnum.topRated));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<HomeScreenBloc, HomeScreenState>(
            buildWhen: (pre, cur) {
              if (cur is HomeScreenGetMoviesByTypeLoadingState) return true;

              if (cur is HomeScreenGetMoviesByTypeLoadedState && cur.type == HomeScreenTypeEnum.popular) return true;

              return false;
            },
            builder: (context, state) {
              if (state is HomeScreenGetMoviesByTypeLoadingState) {
                return Container(
                  height: 100,
                  color: Colors.amberAccent,
                );
              }

              if (state is HomeScreenGetMoviesByTypeLoadedState) {
                return ListItem(
                  title: "Popular",
                  items: state.movies.results,
                  onViewItem: (movie) {},
                  onViewMore: () {},
                );
              }

              return Container();
            },
          ),
          BlocBuilder<HomeScreenBloc, HomeScreenState>(
            buildWhen: (pre, cur) {
              if (cur is HomeScreenGetMoviesByTypeLoadingState) return true;

              if (cur is HomeScreenGetMoviesByTypeLoadedState && cur.type == HomeScreenTypeEnum.nowPlaying) return true;

              return false;
            },
            builder: (context, state) {
              if (state is HomeScreenGetMoviesByTypeLoadingState) {
                return Container(
                  height: 100,
                  color: Colors.amberAccent,
                );
              }

              if (state is HomeScreenGetMoviesByTypeLoadedState) {
                return ListItem(
                  title: "Now Playing",
                  items: state.movies.results,
                  onViewItem: (movie) {},
                  onViewMore: () {},
                );
              }

              return Container();
            },
          ),
          BlocBuilder<HomeScreenBloc, HomeScreenState>(
            buildWhen: (pre, cur) {
              if (cur is HomeScreenGetMoviesByTypeLoadingState) return true;

              if (cur is HomeScreenGetMoviesByTypeLoadedState && cur.type == HomeScreenTypeEnum.upcoming) return true;

              return false;
            },
            builder: (context, state) {
              if (state is HomeScreenGetMoviesByTypeLoadingState) {
                return Container(
                  height: 100,
                  color: Colors.amberAccent,
                );
              }

              if (state is HomeScreenGetMoviesByTypeLoadedState) {
                return ListItem(
                  title: "Upcoming",
                  items: state.movies.results,
                  onViewItem: (movie) {},
                  onViewMore: () {},
                );
              }

              return Container();
            },
          ),
          BlocBuilder<HomeScreenBloc, HomeScreenState>(
            buildWhen: (pre, cur) {
              if (cur is HomeScreenGetMoviesByTypeLoadingState) return true;

              if (cur is HomeScreenGetMoviesByTypeLoadedState && cur.type == HomeScreenTypeEnum.topRated) return true;

              return false;
            },
            builder: (context, state) {
              if (state is HomeScreenGetMoviesByTypeLoadingState) {
                return Container(
                  height: 100,
                  color: Colors.amberAccent,
                );
              }

              if (state is HomeScreenGetMoviesByTypeLoadedState) {
                return ListItem(
                  title: "Top Rated",
                  items: state.movies.results,
                  onViewItem: (movie) {},
                  onViewMore: () {},
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
