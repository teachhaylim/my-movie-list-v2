import 'package:my_movie_list_v2/core/network/api_response.dart';
import 'package:my_movie_list_v2/data/model/movie/movie.dto.dart';
import 'package:my_movie_list_v2/data/model/pagination/pagination.dto.dart';

abstract class MovieRepo {
  Future<ApiResponse<PaginationDto<MovieDto>>> getPopularMovies({int page = 0});
  Future<ApiResponse<PaginationDto<MovieDto>>> getUpcomingMovies({int page = 0});
  Future<ApiResponse<PaginationDto<MovieDto>>> getTopRatedMovies({int page = 0});
  Future<ApiResponse<PaginationDto<MovieDto>>> getNowPlayingMovies({int page = 0});
  Future<ApiResponse<MovieDto>> getLatestMovie();
}
