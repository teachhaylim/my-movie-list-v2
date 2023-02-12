part of "home_screen.bloc.dart";

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List get props => [];
}

class HomeScreenIntialState extends HomeScreenState {
  const HomeScreenIntialState();
}

class HomeScreenMainBannerLoadingState extends HomeScreenState {
  const HomeScreenMainBannerLoadingState();
}

class HomeScreenGetMoviesByTypeLoadingState extends HomeScreenState {
  final HomeScreenTypeEnum type;
  const HomeScreenGetMoviesByTypeLoadingState({required this.type});

  @override
  List get props => [type];
}

class HomeScreenMainBannerLoadedState extends HomeScreenState {
  final List<MovieDto> banners;
  const HomeScreenMainBannerLoadedState({required this.banners});

  @override
  List get props => [banners];
}

class HomeScreenGetMoviesByTypeLoadedState extends HomeScreenState {
  final HomeScreenTypeEnum type;
  final PaginationDto<MovieDto> movies;
  const HomeScreenGetMoviesByTypeLoadedState({required this.type, required this.movies});

  @override
  List get props => [type, movies];
}

class HomeScreenErrorState extends HomeScreenState {
  final CustomError error;
  final HomeScreenTypeEnum type;
  const HomeScreenErrorState({required this.type, required this.error});

  @override
  List get props => [type, error];
}
