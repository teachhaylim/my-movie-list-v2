import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'movie.api.g.dart';

@RestApi()
abstract class MovieApi {
  factory MovieApi(Dio dio) = _MovieApi;

  @GET("data")
  Future<String> getData();

  @GET("error")
  Future<String> getError();
}
