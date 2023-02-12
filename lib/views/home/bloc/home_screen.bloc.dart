import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_list_v2/core/di.dart';
import 'package:my_movie_list_v2/core/error/custom_error.dart';
import 'package:my_movie_list_v2/core/network/api_response.dart';
import 'package:my_movie_list_v2/data/model/movie/movie.dto.dart';
import 'package:my_movie_list_v2/data/model/pagination/pagination.dto.dart';
import 'package:my_movie_list_v2/domain/repo/movie.repo.dart';

part "home_screen.event.dart";
part "home_screen.state.dart";

enum HomeScreenTypeEnum {
  banner,
  nowPlaying,
  topRated,
  upcoming,
  popular,
}

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final MovieRepo _movieRepo = getIt<MovieRepo>();

  HomeScreenBloc() : super(const HomeScreenIntialState()) {
    on<HomeScreenGetMainBannerEvent>(_getMainBanner);
    on<HomeScreenGetMoviesByTypeEvent>(_getMovieByType, transformer: concurrent());
  }

  void _getMainBanner(HomeScreenGetMainBannerEvent event, Emitter<HomeScreenState> emit) async {
    emit(const HomeScreenMainBannerLoadingState());

    final res = await _movieRepo.getNowPlayingMovies();

    if (res is ApiSuccessResponse) {
      final data = (res as ApiSuccessResponse<PaginationDto<MovieDto>>).data.results.take(5).toList();
      return emit(HomeScreenMainBannerLoadedState(banners: data));
    }

    if (res is ApiErrorResponse) {
      return emit(HomeScreenErrorState(type: HomeScreenTypeEnum.banner, error: (res as ApiErrorResponse).toCustomError));
    }
  }

  void _getMovieByType(HomeScreenGetMoviesByTypeEvent event, Emitter<HomeScreenState> emit) async {
    final type = event.type;

    emit(HomeScreenGetMoviesByTypeLoadingState(type: type));

    ApiResponse<PaginationDto<MovieDto>>? res;

    switch (type) {
      case HomeScreenTypeEnum.nowPlaying:
        res = await _movieRepo.getNowPlayingMovies();
        break;
      case HomeScreenTypeEnum.popular:
        res = await _movieRepo.getPopularMovies();
        break;
      case HomeScreenTypeEnum.upcoming:
        res = await _movieRepo.getUpcomingMovies();
        break;
      case HomeScreenTypeEnum.topRated:
        res = await _movieRepo.getTopRatedMovies();
        break;
      case HomeScreenTypeEnum.banner:
        res = null;
        break;
    }

    if (res == null) {
      return emit(HomeScreenErrorState(type: type, error: const CustomError(message: "Unsupported event type")));
    }

    if (res is ApiErrorResponse) {
      return emit(HomeScreenErrorState(type: type, error: (res as ApiErrorResponse).toCustomError));
    }

    if (res is ApiSuccessResponse) {
      final movies = (res as ApiSuccessResponse).data;
      return emit(HomeScreenGetMoviesByTypeLoadedState(type: type, movies: movies));
    }
  }
}
