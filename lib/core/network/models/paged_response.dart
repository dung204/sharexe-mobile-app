import 'package:sharexe/core/network/models/base_response.dart';

class PagedResponse<T> extends BaseResponse {
  const PagedResponse({
    required super.success,
    required this.data,
    required this.metadata,
    super.message,
  });

  factory PagedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return PagedResponse<T>(
      success: json['success'] as bool? ?? true,
      message: json['message'] as String?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((item) => fromJsonT(item))
              .toList() ??
          [],
      metadata: ResponseMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>? ?? {},
      ),
    );
  }
  final List<T> data;
  final ResponseMetadata metadata;
}

class ResponseMetadata {
  const ResponseMetadata({
    required this.pagination,
    this.orders = const [],
    this.filters = const {},
  });

  factory ResponseMetadata.fromJson(Map<String, dynamic> json) {
    return ResponseMetadata(
      pagination: ResponsePagination.fromJson(
        json['pagination'] as Map<String, dynamic>? ?? {},
      ),
      orders:
          (json['orders'] as List<dynamic>?)
              ?.map((e) => ResponseOrder.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      filters: json['filters'] as Map<String, dynamic>? ?? {},
    );
  }

  final ResponsePagination pagination;
  final List<ResponseOrder> orders;
  final Map<String, dynamic> filters;
}

class ResponsePagination {
  const ResponsePagination({
    this.currentPage = 1,
    this.pageSize = 10,
    this.totalRecords = 0,
    this.totalPages = 0,
    this.hasNextPage = false,
    this.hasPreviousPage = false,
  });

  factory ResponsePagination.fromJson(Map<String, dynamic> json) {
    return ResponsePagination(
      currentPage: json['currentPage'] as int? ?? 1,
      pageSize: json['pageSize'] as int? ?? 10,
      totalRecords: json['totalRecords'] as int? ?? 0,
      totalPages: json['totalPages'] as int? ?? 0,
      hasNextPage: json['hasNextPage'] as bool? ?? false,
      hasPreviousPage: json['hasPreviousPage'] as bool? ?? false,
    );
  }

  final int currentPage;
  final int pageSize;
  final int totalRecords;
  final int totalPages;
  final bool hasNextPage;
  final bool hasPreviousPage;
}

class ResponseOrder {
  const ResponseOrder({required this.field, required this.direction});

  factory ResponseOrder.fromJson(Map<String, dynamic> json) {
    return ResponseOrder(
      field: json['field'] as String? ?? '',
      direction: json['direction'] as String? ?? '',
    );
  }

  final String field;
  final String direction;
}
