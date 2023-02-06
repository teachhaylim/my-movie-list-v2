import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:my_movie_list_v2/core/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final BaseOptions options = BaseOptions(
  baseUrl: AppConstant.baseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

final Dio dio = Dio(options)
  ..interceptors.addAll([
    CustomInterceptor(),
    PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90),
    // RetryInterceptor(dio: dio, logPrint: print, retries: 3, retryDelays: const [Duration(seconds: 1), Duration(seconds: 2), Duration(seconds: 3)]),
  ]);

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
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
