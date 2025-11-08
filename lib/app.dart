import 'package:flutter/material.dart';
import 'package:revo_schools/core/routes.dart';
import 'package:revo_schools/presentation/auth/role_selection.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RevoSchools',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
      // home: RoleSelectionScreen(roles: ['student', 'teacher', 'staff']),
    );
  }
}
