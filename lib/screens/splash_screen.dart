import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    // Usar un Future.delayed para navegar después de un tiempo
    Future.delayed(const Duration(seconds: 3), () {
      if (authState == AuthState.authenticated) {
        Navigator.pushReplacementNamed(context, '/home'); // Navegar a la pantalla principal
      } else {
        Navigator.pushReplacementNamed(context, '/login'); // Navegar a la pantalla de login
      }
    });

    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(), // Indicador de carga en el centro de la pantalla
      ),
    );
  }
}