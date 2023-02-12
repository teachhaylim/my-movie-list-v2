class AppConstant {
  static const String apiKey = "ef5ba3b7290c00693a61fb4f2d67091d";
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static String baseImageUrl({required String path, String size = "original"}) => "https://image.tmdb.org/t/p/$size/$path";
}
