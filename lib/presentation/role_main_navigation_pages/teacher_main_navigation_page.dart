import 'package:flutter/material.dart';

class TeacherMainNavigationPage extends StatefulWidget {
  const TeacherMainNavigationPage({super.key});

  @override
  State<TeacherMainNavigationPage> createState() => _TeacherMainNavigationPageState();
}

class _TeacherMainNavigationPageState extends State<TeacherMainNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Teacher Main Navigation'),
      ),
    );
  }
}