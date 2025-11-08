// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:revo_schools/infrastructure/local/flutter_local_secured_storage.dart';
import 'package:revo_schools/core/constants/debug_status.dart';

import 'endpoints.dart';
import 'exceptions.dart';

class DioClient {
  final Dio _dio;
  DioClient(this._dio) {
    initialiseDio();
  }
  initialiseDio() {
    _dio.options = BaseOptions(
      responseType: ResponseType.plain,
      connectTimeout: Duration(seconds: 8000),
      contentType: Headers.jsonContentType,
      followRedirects: false,
      headers: {
        "X-Requested-With": "XMLHttpRequest",
      },
      validateStatus: (status) {
        if (status != null) {
          return status < 500;
        } else {
          return false;
        }
      },
    );
    if (DebugStatus.IS_DEBUG) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: false,
          maxWidth: 100,
          logPrint: (object) => print(object.toString()),
        ),
      );
    }
  }

  Future<Response> request({required EndPoint endPoint, dynamic data, Map<String, dynamic>? queryParams, String urlParams = ""}) async {
    late Response response;

    if (endPoint.shouldAddToken == true) {
      //please add token here
      FlutterLocalSecuredStorage localStorage = FlutterLocalSecuredStorage();

      final isTokenAlreadyWritten = await localStorage.getbool("AUTH_TOKEN");

      var AUTH_TOKEN = "";

      if (isTokenAlreadyWritten) {
        AUTH_TOKEN = await localStorage.read("AUTH_TOKEN");
      }

      _dio.options.headers = {'Authorization': 'Bearer $AUTH_TOKEN'};
    }

    try {
      switch (endPoint.requestType) {
        case RequestType.get:
          response = await _dio.get(endPoint.url + urlParams, queryParameters: data ?? queryParams);
          break;
        case RequestType.post:
          response = await _dio.post(endPoint.url + urlParams, data: data, queryParameters: queryParams);
          break;
        case RequestType.patch:
          response = await _dio.patch(endPoint.url + urlParams, data: data, queryParameters: queryParams);
          break;
        case RequestType.put:
          response = await _dio.put(endPoint.url + urlParams, data: data, queryParameters: queryParams);
          break;

        case RequestType.delete:
          response = await _dio.delete(endPoint.url + urlParams, data: data);
      }
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.badCertificate:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw FetchDataException('Timeout Error\n\n${error.message}');

        case DioExceptionType.badResponse:
          response = error.response!; // If response is available.
          break;
        case DioExceptionType.cancel:
          throw FetchDataException('Request Cancelled\n\n${error.message}');
        case DioExceptionType.unknown:
          String message = error.message?.contains('SocketException') ?? false ? "No Internet Connection" : "Oops, Something went wrong";
          kDebugMode ? throw FetchDataException('$message\n\n${error.message}') : throw FetchDataException(message);
      }
    }
    return response;
  }

  Future<Response> requestWithId({
    required EndPoint endPoint,
    required String id,
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) async {
    late Response response;

    if (endPoint.shouldAddToken == true) {
      //please add token here
      FlutterLocalSecuredStorage localStorage = FlutterLocalSecuredStorage();

      final isTokenAlreadyWritten = await localStorage.getbool("AUTH_TOKEN");

      var AUTH_TOKEN = "";

      if (isTokenAlreadyWritten) {
        AUTH_TOKEN = await localStorage.read("AUTH_TOKEN");
      }

      _dio.options.headers = {'Authorization': 'Bearer $AUTH_TOKEN'};
    }

    try {
      final url = endPoint.urlWithId(id);

      switch (endPoint.requestType) {
        case RequestType.get:
          response = await _dio.get(url, queryParameters: data ?? queryParams);
          break;
        case RequestType.post:
          response = await _dio.post(url, data: data, queryParameters: queryParams);
          break;
        case RequestType.patch:
          response = await _dio.patch(url, data: data, queryParameters: queryParams);
          break;
        case RequestType.put:
          response = await _dio.put(url, data: data, queryParameters: queryParams);
          break;
        case RequestType.delete:
          response = await _dio.delete(url, data: data);
      }
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.badCertificate:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw FetchDataException('Timeout Error\n\n${error.message}');

        case DioExceptionType.badResponse:
          response = error.response!; // If response is available.
          break;
        case DioExceptionType.cancel:
          throw FetchDataException('Request Cancelled\n\n${error.message}');
        case DioExceptionType.unknown:
          String message = error.message?.contains('SocketException') ?? false ? "No Internet Connection" : "Oops, Something went wrong";
          kDebugMode ? throw FetchDataException('$message\n\n${error.message}') : throw FetchDataException(message);
      }
    }
    return response;
  }
}

class ApiResponse<T> {
  ApiResponseStatus status;
  T? data;
  String? message;
  ApiResponse.idle() : status = ApiResponseStatus.idle;
  ApiResponse.loading(this.message) : status = ApiResponseStatus.loading;
  ApiResponse.completed(this.data) : status = ApiResponseStatus.completed;
  ApiResponse.unProcessable(this.message) : status = ApiResponseStatus.unProcessable;
  ApiResponse.error(this.message) : status = ApiResponseStatus.error;
  @override
  String toString() {
    return "ApiResponseStatus : $status \n Message : $message \n Data : $data";
  }
}

enum ApiResponseStatus { idle, loading, completed, unProcessable, error }
