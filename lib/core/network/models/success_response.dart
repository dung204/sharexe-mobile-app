import 'package:sharexe/core/network/models/base_response.dart';

class SuccessResponse<T> extends BaseResponse {
  const SuccessResponse({required super.success, super.message, this.data});

  factory SuccessResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json)? fromJsonT,
  ) {
    return SuccessResponse<T>(
      success: json['success'] as bool? ?? true,
      message: json['message'] as String?,
      data: json['data'] != null && fromJsonT != null
          ? fromJsonT(json['data'])
          : json['data'] as T?,
    );
  }

  final T? data;
}
