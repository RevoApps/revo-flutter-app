import 'package:pipe_x/pipe_x.dart';
import 'package:revo_schools/core/models/login_response_model.dart';
import 'package:revo_schools/core/models/student_profile_model.dart';

class StudentMainNavigationHub extends Hub {
  final StudentProfileResponse studentProfile;

  StudentMainNavigationHub({required this.studentProfile});
}