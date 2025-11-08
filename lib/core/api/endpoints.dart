import 'base_urls.dart';

enum RequestType { get, post, put, patch, delete }

enum EndPoint { login, studentProfile, notice }

// ignore: non_constant_identifier_names
final BASE_URL = API_BaseURL.getBaseURL();

extension URLExtension on EndPoint {
  String get url {
    switch (this) {
      case EndPoint.login:
        return "$BASE_URL/login";
      case EndPoint.notice:
        return "$BASE_URL/notices";
      case EndPoint.studentProfile:
        throw ArgumentError('Use urlWithId(id) for studentProfile endpoint');

      default:
        throw Exception(["Endpoint not defined"]);
    }
  }

  // Method to build URL with path parameters (like id)
  String urlWithId(String id) {
    switch (this) {
      case EndPoint.studentProfile:
        return "$BASE_URL/student/$id";

      default:
        throw ArgumentError('urlWithId() is not supported for $this');
    }
  }

  // Method to build URL with query parameters
  String urlWithQuery(Map<String, dynamic> query) {
    final uri = Uri.parse(url);
    return uri
        .replace(
          queryParameters: query.map((k, v) => MapEntry(k, v.toString())),
        )
        .toString();
  }
}

extension RequestMode on EndPoint {
  RequestType get requestType {
    RequestType requestType = RequestType.get;

    switch (this) {
      case EndPoint.login:
        requestType = RequestType.post;
        break;

      default:
        break;
    }
    return requestType;
  }
}

extension Token on EndPoint {
  bool get shouldAddToken {
    var shouldAdd = true;
    switch (this) {
      case EndPoint.login:
        shouldAdd = false;
        break;

      default:
        break;
    }

    return shouldAdd;
  }
}
