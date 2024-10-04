class ApiResponse<T> {
  final bool success;
  final T? data;
  final int? status;
  final T? message;

  ApiResponse.success({required this.data})
      : success = true,
        status = null,
        message = null;

  ApiResponse.error({required this.status, required this.message})
      : success = false,
        data = null;
}