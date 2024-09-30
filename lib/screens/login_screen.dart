import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo para el correo electrónico
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
              ),
            ),
            const SizedBox(height: 16),
            
            // Campo para la contraseña
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            
            // Estado de carga o botón de iniciar sesión según el estado
            if (authState == AuthState.loading) 
              const CircularProgressIndicator()
            else if (authState == AuthState.error)
              const Text('Error al iniciar sesión', style: TextStyle(color: Colors.red))
            else
              ElevatedButton(
                onPressed: () async {
                  await authNotifier.login(
                    _emailController.text,
                    _passwordController.text,
                  );
                },
                child: const Text('Iniciar sesión'),
              ),
          ],
        ),
      ),
    );
  }
}