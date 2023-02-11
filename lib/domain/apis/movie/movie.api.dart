import 'package:dio/dio.dart';
import 'package:my_movie_list_v2/data/model/movie/movie.dto.dart';
import 'package:my_movie_list_v2/data/model/pagination/pagination.dto.dart';
import 'package:retrofit/retrofit.dart';

part 'movie.api.g.dart';

@RestApi()
abstract class MovieApi {
  factory MovieApi(Dio dio) = _MovieApi;

  @GET("movie/popular")
  Future<HttpResponse<PaginationDto<MovieDto>>> getPopularMovies(
    @Query("page") int page,
  );

  @GET("movie/top_rated")
  Future<HttpResponse<PaginationDto<MovieDto>>> getTopRatedMovies(
    @Query("page") int page,
  );

  @GET("movie/upcoming")
  Future<HttpResponse<PaginationDto<MovieDto>>> getUpcomingMovies(
    @Query("page") int page,
  );

  @GET("movie/now_playing")
  Future<HttpResponse<PaginationDto<MovieDto>>> getNowPlayingMovies(
    @Query("page") int page,
  );

  @GET("movie/latest")
  Future<HttpResponse<MovieDto>> getLatestMovie();
}
