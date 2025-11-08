import 'package:flutter/material.dart';
import 'package:pipe_x/pipe_x.dart';
import 'package:revo_schools/core/routes.dart';

class RoleSelectionHub extends Hub {
  final List<String> roles;

  RoleSelectionHub({required this.roles});

  void onRoleSelected(String role, BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.studentMainNavigation);
  }
}
