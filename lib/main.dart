import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/onboarding.dart';
import 'screens/login.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: [
        GetPage(name: '/', page: () => OnboardingScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
      initialRoute: '/',
    );
  }
}
