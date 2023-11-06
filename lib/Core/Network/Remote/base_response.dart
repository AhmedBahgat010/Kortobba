class BaseResponse {
  final String jsonrpc;
  final dynamic id;
  final Result result;

  BaseResponse({
    required this.jsonrpc,
    required this.id,
    required this.result,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        jsonrpc: json["jsonrpc"],
        id: json["id"],
        result: Result.fromJson(json["result"]),
      );
}

class Result {
  final int code;
  final String message;
  final dynamic data;

  Result({
    required this.code,
    required this.message,
    required this.data,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        code: json["code"],
        message: json["message"],
        data: json["data"],
      );
}
