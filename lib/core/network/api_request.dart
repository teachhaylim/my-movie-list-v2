import 'package:dio/dio.dart';
import 'package:my_movie_list_v2/core/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final BaseOptions options = BaseOptions(
  baseUrl: AppConstant.baseUrl,
  connectTimeout: 600000,
  receiveTimeout: 600000,
);

final Dio dio = Dio(options)
  ..interceptors.addAll([
    CustomInterceptor(),
    PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 150),
  ]);

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final apiQuery = {
      "api_key": AppConstant.apiKey,
    };
    options.queryParameters.addAll(apiQuery);
    options.headers = {
      "contentType": "application/json",
      "Content-Type": "application/json",
    };

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
