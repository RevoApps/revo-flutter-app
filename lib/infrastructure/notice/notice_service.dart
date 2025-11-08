import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:revo_schools/core/api/dio_client.dart';
import 'package:revo_schools/core/api/endpoints.dart';
import 'package:revo_schools/core/api/exceptions.dart';
import 'package:revo_schools/core/models/notice_model.dart';

abstract class NoticeService {
  static Future<Either<FetchDataException, NoticeResponse>> getNotices() async {
    final dioClient = DioClient(Dio());
    final response = await dioClient.request(
      endPoint: EndPoint.notice,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Right(NoticeResponse.fromJson(jsonDecode(response.data as String)));
    } else {
      return Left(FetchDataException(response.statusMessage ?? 'Unknown error'));
    }
  }
}
