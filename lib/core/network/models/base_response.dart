abstract class BaseResponse {
  const BaseResponse({required this.success, this.message});
  final bool success;
  final String? message;
}
