import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmaco/Pages/auth_page.dart';

class splash extends StatelessWidget {
  const splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 212, 227, 241),
        Color.fromARGB(255, 243, 213, 223)
      ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
      child: AnimatedSplashScreen(
        splash: Column(
          children: [
            Center(
              child: LottieBuilder.asset('lib/images/Animate.json'),
            ),
          ],
        ),
        nextScreen: const auth_page(),
        splashIconSize: 400,
        backgroundColor: Colors.transparent,
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
