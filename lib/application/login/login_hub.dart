import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pipe_x/pipe_x.dart';
import 'package:revo_schools/core/models/student_profile_model.dart';
import 'package:revo_schools/infrastructure/auth/auth_service.dart';
import 'package:revo_schools/infrastructure/local/flutter_local_secured_storage.dart';
import 'package:revo_schools/core/api/exceptions.dart';
import 'package:revo_schools/core/models/login_response_model.dart';
import 'package:revo_schools/core/routes.dart';

class LoginHub extends Hub {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> checkIfAlreadyLoggedIn(BuildContext context) async {
    final localStorage = FlutterLocalSecuredStorage();
    final isLoggedIn = await localStorage.getbool("AUTH_TOKEN");
    final userData = await localStorage.read("USER_DATA");
    print(userData);

    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, Routes.studentMainNavigation);
    }
  }

  Future<void> login(BuildContext context) async {
    final phoneNumber = phoneController.text;
    final password = passwordController.text;
    Either<FetchDataException, LoginResponseModel> result = await AuthService.login(phoneNumber, password);

    // store to local database ..
    FlutterLocalSecuredStorage localStorage = FlutterLocalSecuredStorage();
    result.fold((l) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(l.toString()),
              ));
    }, (r) async {
      r.data.user.role.add("Teacher");
      r.data.user.role.add("Admin");
      if (r.data.user.role.length == 1) {
        if (r.data.user.role.first == "Student") {
          localStorage.write("AUTH_TOKEN", r.data.token);
          localStorage.write("USER_DATA", jsonEncode(r.data.user.toJson()));

          Either<FetchDataException, StudentProfileResponse> studentProfile = await AuthService.getStudentProfile(r.data.user.id);
          if (studentProfile.isRight()) {
            final studentProfileResponse = studentProfile.fold((l) => null, (r) => r);
            Navigator.pushReplacementNamed(context, Routes.studentMainNavigation, arguments: studentProfileResponse);
          }
        } else if (r.data.user.role.first == "teacher") {
          localStorage.write("AUTH_TOKEN", r.data.token);
          localStorage.write("USER_DATA", jsonEncode(r.data.user.toJson()));
          Navigator.pushReplacementNamed(context, Routes.teacherMainNavigation);
        }
      } else if (r.data.user.role.length > 1) {
        Navigator.pushReplacementNamed(context, Routes.roleSelection, arguments: r.data.user.role);
      }
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
