import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pipe_x/pipe_x.dart';
import 'package:revo_schools/core/api/exceptions.dart';
import 'package:revo_schools/core/models/login_response_model.dart';
import 'package:revo_schools/core/models/student_profile_model.dart';
import 'package:revo_schools/core/routes.dart';
import 'package:revo_schools/infrastructure/auth/auth_service.dart';
import 'package:revo_schools/infrastructure/local/flutter_local_secured_storage.dart';

class SplashScreenHub extends Hub {
  Future<void> checkIfAlreadyLoggedIn(BuildContext context) async {
    final localStorage = FlutterLocalSecuredStorage();
    final isLoggedIn = await localStorage.getbool("AUTH_TOKEN");
    final ifUserDataExists = await localStorage.getbool("USER_DATA");
    if (ifUserDataExists) {
      final userData = await localStorage.read("USER_DATA");
      final  LoginUser loginUser = LoginUser.fromJson(jsonDecode(userData));
      print(userData);
      if (isLoggedIn) {
        Either<FetchDataException, StudentProfileResponse> studentProfile = await AuthService.getStudentProfile(loginUser.id);
        if (studentProfile.isRight()) {
          final studentProfileResponse = studentProfile.fold((l) => null, (r) => r);
          Navigator.pushReplacementNamed(context, Routes.studentMainNavigation,arguments: studentProfileResponse);
        } else {
          Navigator.pushReplacementNamed(context, Routes.login);
        }
      }
    } else {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, Routes.login);
    }
    
  }
}
