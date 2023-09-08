import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymcarnation/auth/enter_mobile_screen.dart';
import 'package:gymcarnation/checkUserStatus/checkUserStatus.dart';
import 'package:gymcarnation/utils/routers.dart';

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
        
        if(FirebaseAuth.instance.currentUser == null){
          nextPageOnly(context: context, page: EnterMobileScreen());
        }
        else{
          nextPageOnly(context: context, page: CheckUserStatus());
        }
        //nextPageOnly(context: context, page: EnterMobileScreen());
        
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
