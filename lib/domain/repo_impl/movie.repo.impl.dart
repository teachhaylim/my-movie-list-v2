import 'package:dio/dio.dart';
import 'package:my_movie_list_v2/core/network/api_response.dart';
import 'package:my_movie_list_v2/data/model/pagination/pagination.dto.dart';
import 'package:my_movie_list_v2/data/model/movie/movie.dto.dart';
import 'package:my_movie_list_v2/domain/apis/movie/movie.api.dart';
import 'package:my_movie_list_v2/domain/repo/movie.repo.dart';

class MovieRepoImpl extends MovieRepo {
  final MovieApi movieApi;
  MovieRepoImpl({required this.movieApi});

  @override
  Future<ApiResponse<MovieDto>> getLatestMovie() async {
    try {
      final res = await movieApi.getLatestMovie();
      return res.runForResponse();
    } on DioError catch (e) {
      return ApiResponse.parseDioError(error: e);
    } catch (e) {
      return ApiErrorResponse(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<PaginationDto<MovieDto>>> getNowPlayingMovies({int page = 0}) async {
    try {
      final res = await movieApi.getNowPlayingMovies(page);
      return res.runForResponse();
    } on DioError catch (e) {
      return ApiResponse.parseDioError(error: e);
    } catch (e) {
      return ApiErrorResponse(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<PaginationDto<MovieDto>>> getPopularMovies({int page = 0}) async {
    try {
      final res = await movieApi.getPopularMovies(page);
      return res.runForResponse();
    } on DioError catch (e) {
      return ApiResponse.parseDioError(error: e);
    } catch (e) {
      return ApiErrorResponse(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<PaginationDto<MovieDto>>> getTopRatedMovies({int page = 0}) async {
    try {
      final res = await movieApi.getTopRatedMovies(page);
      return res.runForResponse();
    } on DioError catch (e) {
      return ApiResponse.parseDioError(error: e);
    } catch (e) {
      return ApiErrorResponse(message: e.toString());
    }
  }

  @override
  Future<ApiResponse<PaginationDto<MovieDto>>> getUpcomingMovies({int page = 0}) async {
    try {
      final res = await movieApi.getUpcomingMovies(page);
      return res.runForResponse();
    } on DioError catch (e) {
      return ApiResponse.parseDioError(error: e);
    } catch (e) {
      return ApiErrorResponse(message: e.toString());
    }
  }
}
