// widgets/beautiful_avatar.dart
import 'package:flutter/material.dart';

class BeautifulAvatar extends StatelessWidget {
  final String category;
  final double size;
  final bool isOnline;

  const BeautifulAvatar({
    super.key,
    required this.category,
    this.size = 50,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            gradient: _getGradientForCategory(category),
            borderRadius: BorderRadius.circular(size / 2),
            boxShadow: [
              BoxShadow(
                color: _getGradientForCategory(category).colors.first.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: _getIconForCategory(category),
          ),
        ),
        if (isOnline)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: size * 0.3,
              height: size * 0.3,
              decoration: BoxDecoration(
                color: const Color(0xFF27AE60),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  LinearGradient _getGradientForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'homework':
        return const LinearGradient(
          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'principal notice':
        return const LinearGradient(
          colors: [Color(0xFFf093fb), Color(0xFFf5576c)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'school fee':
        return const LinearGradient(
          colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'exam results':
        return const LinearGradient(
          colors: [Color(0xFF43e97b), Color(0xFF38f9d7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'class tests':
        return const LinearGradient(
          colors: [Color(0xFFfa709a), Color(0xFFfee140)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'gate pass':
        return const LinearGradient(
          colors: [Color(0xFFa8edea), Color(0xFFfed6e3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'personal message':
        return const LinearGradient(
          colors: [Color(0xFFffecd2), Color(0xFFfcb69f)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'ptm notification':
        return const LinearGradient(
          colors: [Color(0xFFff9a9e), Color(0xFFfecfef)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'dashboard':
        return const LinearGradient(
          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      default:
        return const LinearGradient(
          colors: [Color(0xFF3498DB), Color(0xFF2980B9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
    }
  }

  Widget _getIconForCategory(String category) {
    IconData iconData;
    Color iconColor = Colors.white;

    switch (category.toLowerCase()) {
      case 'homework':
        iconData = Icons.assignment;
        break;
      case 'principal notice':
        iconData = Icons.campaign;
        break;
      case 'school fee':
        iconData = Icons.payment;
        break;
      case 'exam results':
        iconData = Icons.assessment;
        break;
      case 'class tests':
        iconData = Icons.quiz;
        break;
      case 'gate pass':
        iconData = Icons.description;
        break;
      case 'personal message':
        iconData = Icons.message;
        break;
      case 'ptm notification':
        iconData = Icons.event;
        break;
      case 'dashboard':
        iconData = Icons.dashboard;
        break;
      default:
        iconData = Icons.school;
    }

    return Icon(
      iconData,
      color: iconColor,
      size: size * 0.5,
    );
  }
}
