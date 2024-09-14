import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:freshly/constants.dart';


import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (ctx) => const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 570,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'Assets/images/splash.png',
                  ), // Background image path
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Text(
              'Start Cooking',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Let's join our community \n to cook better food !",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            const Center(
              child: SpinKitWave(
                color: kPrimaryColor,
                size: 50.0,
              ),
            ),
          ],
        )
        // Background image

        );
  }
}
