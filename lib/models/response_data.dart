class ResponseData {
  final bool isLoading;
  final int statusCode;
  final dynamic responseData;

  ResponseData({
    required this.isLoading,
    required this.statusCode,
    required this.responseData,
  });
}
