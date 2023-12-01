class ApiResponse {
  ApiResponse({
    this.data,
    this.list,
    this.errors,
  });

  final Map<String, dynamic>? data;
  final List<dynamic>? list;
  final ErrorResponse? errors;

  factory ApiResponse.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      if (json['data'] == null) {
        return ApiResponse(data: json);
      }
      return ApiResponse(
        data: json['data'] != null && json['data'] is Map ? json['data'] : {},
        list: json['data'] != null && json['data'] is List ? json['data'] : [],
        errors: json['errors'] != null && json['errors'] is Map
            ? ErrorResponse.fromJson(json['errors'] as Map<String, dynamic>)
            : null,
      );
    } else {
      return ApiResponse(data: {});
    }
  }
}

class ErrorResponse {
  final String message;

  ErrorResponse({
    required this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message:
          json['message'] != null ? json['message'] as String : json.toString(),
    );
  }
}
