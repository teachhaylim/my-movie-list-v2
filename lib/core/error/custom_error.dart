class CustomError {
  final String message;
  final int statusCode;

  const CustomError({this.statusCode = -1, required this.message});
}
