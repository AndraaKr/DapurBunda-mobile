import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_flow/screens/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0x1A044B11),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 160,
              height: 160,
              child: Image.asset('assets/images/LogoDapurBundaHijauKuning.png'),
            ),
            const SizedBox(height: 16),
          
          ],
        ),
      ),
    );
  }
}
