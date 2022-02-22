class ApiResponse {
  int type;
  String? messages;
  Object? data;

  ApiResponse({this.type = 0, this.messages, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      type: json['type'] as int,
      messages: json['messages'] as String?,
      data: json['data'] as Object?,
    );
  }

  bool isSuccessful() => type == ResponseType.success;
}

class ResponseType {
  static const int success = 0;
  static const int error = 1;
}