import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gymcarnation/auth/enter_mobile_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (t.tick == 3) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => const EnterMobileScreen(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Gymcarnation'.toUpperCase(),
        style: Theme.of(context).textTheme.titleLarge,
      )),
    );
  }
}
