import 'package:flutter/material.dart';
import 'package:pipe_x/pipe_x.dart';
import 'package:revo_schools/application/login/login_hub.dart';
import 'package:revo_schools/application/notice/notice_hub.dart';
import 'package:revo_schools/application/splash_screen/splash_screen_hub.dart';
import 'package:revo_schools/application/student/student_main_navigation_hub.dart';
import 'package:revo_schools/core/models/notice_model.dart';
import 'package:revo_schools/core/models/student_profile_model.dart';
import 'package:revo_schools/presentation/auth/login_screen.dart';
import 'package:revo_schools/presentation/auth/role_selection.dart';
import 'package:revo_schools/presentation/auth/splash_screen.dart';
import 'package:revo_schools/presentation/role_main_navigation_pages/teacher_main_navigation_page.dart';
import '../application/role_selection/role_selection_hub.dart';
import '../presentation/role_main_navigation_pages/student_main_navigation_page.dart';
import '../presentation/student/home_page.dart';
import '../presentation/student/chat_page.dart';
import '../presentation/student/fee_page.dart';
import '../presentation/student/notice_page.dart';
import '../presentation/student/store_page.dart';
import '../presentation/student/profile_page.dart';
import 'models/chat_models.dart';

abstract class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String roleSelection = '/role-selection';
  static const String studentMainNavigation = '/student-main-navigation';
  static const String teacherMainNavigation = '/teacher-main-navigation';
  static const String home = '/home';
  static const String chat = '/chat';
  static const String fee = '/fee';
  static const String store = '/store';
  static const String profile = '/profile';
  static const String notice = '/notice';
}

abstract class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => HubProvider(create: () => SplashScreenHub(), child: const SplashScreen()),
          settings: settings,
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => HubProvider<LoginHub>(create: () => LoginHub(), child: const LoginScreen()),
          settings: settings,
        );

      case Routes.roleSelection:
        return MaterialPageRoute(
          builder: (_) => HubProvider<RoleSelectionHub>(
            create: () => RoleSelectionHub(roles: args as List<String>),
            child: const RoleSelectionScreen(),
          ),
          settings: settings,
        );

      case Routes.studentMainNavigation:
        return MaterialPageRoute(
          builder: (_) => HubProvider(create: () => StudentMainNavigationHub(studentProfile: args as StudentProfileResponse), child: const StudentMainNavigationPage()),
          settings: settings,
        );

      case Routes.teacherMainNavigation:
        return MaterialPageRoute(
          builder: (_) => const TeacherMainNavigationPage(),
          settings: settings,
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );

      case Routes.chat:
        if (args is Chat) {
          return MaterialPageRoute(
            builder: (_) => ChatPage(chat: args),
            settings: settings,
          );
        }

        return _errorRoute(settings.name ?? 'Unknown');

      case Routes.fee:
        return MaterialPageRoute(
          builder: (_) => const FeePage(),
          settings: settings,
        );

      case Routes.store:
        return MaterialPageRoute(
          builder: (_) => const StorePage(),
          settings: settings,
        );

      case Routes.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
          settings: settings,
        );

      case Routes.notice:
        if (args is List<Notice>) {
          return MaterialPageRoute(
            builder: (_) => HubProvider(
              create: () => NoticeHub(notices: args),
              child: const NoticePage(),
            ),
            settings: settings,
          );
        }
        return _errorRoute(settings.name ?? 'Unknown');

      default:
        return _errorRoute(settings.name ?? 'Unknown');
    }
  }

  static Route<dynamic> _errorRoute(String routeName) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
          backgroundColor: const Color(0xFFE74C3C),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Color(0xFFE74C3C),
                  size: 80,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Route Not Found!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'The route "$routeName" does not exist.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF7F8C8D),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
