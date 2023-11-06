class APIConstances {
  static const String baseUrl =
      'https://flutterapi.kortobaa.net';
  static const String contentType = 'application/json';
  static const String authHeader = 'Authorization';

  // receiveTimeout
  static const int receiveTimeout = 30000;

// connectTimeout
  static const int connectTimeout = 30000;

}

abstract class EndPoints {
  static const String loginUrl = "login";
  static const String location = "EnterLocation";

}