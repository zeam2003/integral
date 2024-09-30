import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Principal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Aquí puedes implementar la lógica para cerrar sesión
              authNotifier.logout(); // Implementa el método logout en AuthNotifier
              Navigator.of(context).pushReplacementNamed('/login'); // Asegúrate de tener la ruta de login configurada
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          '¡Bienvenido a la aplicación!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}