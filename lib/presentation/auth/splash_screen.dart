import 'package:flutter/material.dart';
import 'package:pipe_x/pipe_x.dart';
import 'package:revo_schools/application/splash_screen/splash_screen_hub.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    final splashScreenHub = HubProvider.of<SplashScreenHub>(context);
    await splashScreenHub.checkIfAlreadyLoggedIn(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF8E24AA), Color(0xFF9C27B0)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF8E24AA).withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.school,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
      ),
    );
  }
}