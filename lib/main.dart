import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gymcarnation/theme/theme.dart';
import 'package:gymcarnation/views/splash_screen/splash_screen.dart';

import 'homepage/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gymcarnation',
      theme: getAppTheme(context, false),
      home: SplashScreen(),
    );
  }
}
