import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:revo_schools/core/api/dio_client.dart';
import 'package:revo_schools/core/api/endpoints.dart';
import 'package:revo_schools/core/api/exceptions.dart';
import 'package:revo_schools/core/models/login_response_model.dart';
import 'package:revo_schools/core/models/student_profile_model.dart';

abstract class AuthService {
  static Future<Either<FetchDataException, LoginResponseModel>> login(String phone, String password) async {
    final dioClient = DioClient(Dio());
    final response = await dioClient.request(
      endPoint: EndPoint.login,
      data: {
        'phone': phone,
        'password': password,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Right(LoginResponseModel.fromJson(jsonDecode(response.data as String)));
    } else {
      return Left(FetchDataException(response.statusMessage ?? 'Unknown error'));
    }
  }

  static Future<Either<FetchDataException, StudentProfileResponse>> getStudentProfile(int id) async {
    final dioClient = DioClient(Dio());
    final response = await dioClient.requestWithId(
      endPoint: EndPoint.studentProfile,
      id: id.toString(),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Right(StudentProfileResponse.fromJson(jsonDecode(response.data as String)));
    } else {
      return Left(FetchDataException(response.statusMessage ?? 'Unknown error'));
    }
  }
}
