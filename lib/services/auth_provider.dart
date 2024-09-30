import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integral/services/api_services.dart';
import 'package:dio/dio.dart';

// Definir un estado que refleja los estados posibles del login
enum AuthState { authenticated, unauthenticated, loading, error }

// Crear un proveedor global de estado
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ApiService());
});

class AuthNotifier extends StateNotifier<AuthState> {
  final ApiService _apiService;

  AuthNotifier(this._apiService) : super(AuthState.unauthenticated);

  // Método para iniciar sesión
  Future<void> login(String email, String password) async {
    state = AuthState.loading;
    try {
      final response = await _apiService.login(email, password);
      if (response.statusCode == 200) {
        state = AuthState.authenticated;
      } else {
        state = AuthState.error;
      }
    } catch (e) {
      state = AuthState.error;
    }
  }

  void logout() {
    state = AuthState.unauthenticated; // Cambiar el estado a no autenticado
  }
}