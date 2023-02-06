import 'package:dio/dio.dart';
import 'package:my_movie_list_v2/core/locale.dart';

class CustomError {
  final int statusCode;
  final String message;

  const CustomError({this.statusCode = -1, this.message = AppLocale.somethingWentWrong});

  static CustomError serverError(DioError error) {
    //TODO: add DioError parer
    return const CustomError();
  }
}
