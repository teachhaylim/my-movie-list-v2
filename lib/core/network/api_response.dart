import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_movie_list_v2/core/di.dart';
import 'package:my_movie_list_v2/core/error/custom_error.dart';
import 'package:my_movie_list_v2/core/locale/locale.dart';
import 'package:retrofit/dio.dart';

abstract class ApiResponse<T> {
  const ApiResponse();

  static ApiResponse<T> parseDioError<T>({required DioError error}) {
    try {
      String message = "";
      int statusCode = -1;

      switch (error.type) {
        case DioErrorType.response:
          dynamic errorMessage = error.response?.data["status_message"] ?? error.response?.data["errors"];

          if (errorMessage.runtimeType == List<dynamic>) {
            errorMessage = (errorMessage as List<dynamic>).join(", ");
          } else {
            errorMessage = errorMessage as String;
          }

          message = errorMessage ?? AppLocale.commonServerError;
          statusCode = error.response?.data["status_code"] ?? error.response?.statusCode ?? -1;
          break;
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          message = AppLocale.requestTimeoutError;
          statusCode = 408;
          break;
        default:
          message = error.error is SocketException ? AppLocale.noInternetConnectionError : AppLocale.commonServerError;
          statusCode = -1;
          break;
      }

      logger.e(">> onDioError: $message");
      return ApiErrorResponse(statusCode: statusCode, message: message);
    } catch (e) {
      logger.e(">> onDioError - Catch: $e");
      return ApiErrorResponse(statusCode: -1, message: e.toString());
    }
  }
}

class ApiSuccessResponse<T> extends ApiResponse<T> {
  final T data;

  const ApiSuccessResponse({required this.data});
}

class ApiErrorResponse<T> extends ApiResponse<T> {
  final int statusCode;
  final String message;

  const ApiErrorResponse({this.statusCode = -1, required this.message});

  CustomError get toCustomError {
    return CustomError(statusCode: this.statusCode, message: this.message);
  }
}

extension HttpResponseExt on HttpResponse {
  ApiResponse<T> runForResponse<T>() {
    final int statusCode = response.statusCode ?? 404;

    if (statusCode >= 200 && statusCode <= 299) {
      return ApiSuccessResponse(data: data as T);
    }

    if (statusCode >= 400 && statusCode <= 499) {
      return ApiErrorResponse(statusCode: statusCode, message: response.statusMessage ?? AppLocale.clientError);
    }

    if (statusCode == 500) {
      return ApiErrorResponse(statusCode: statusCode, message: response.statusMessage ?? AppLocale.internalServerError);
    }

    return const ApiErrorResponse(message: AppLocale.commonServerError);
  }
}
