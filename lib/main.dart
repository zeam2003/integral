import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integral/screens/home_screen.dart';
import 'package:integral/screens/login_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GLPI App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) =>const SplashScreen(),
        '/login':(context) => LoginScreen(),
        '/home':(context) =>const HomeScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}