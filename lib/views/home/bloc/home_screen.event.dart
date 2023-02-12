part of "home_screen.bloc.dart";

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List get props => [];
}

class HomeScreenGetMainBannerEvent extends HomeScreenEvent {
  const HomeScreenGetMainBannerEvent();
}

class HomeScreenGetMoviesByTypeEvent extends HomeScreenEvent {
  final HomeScreenTypeEnum type;
  const HomeScreenGetMoviesByTypeEvent({required this.type});

  @override
  List get props => [type];
}
