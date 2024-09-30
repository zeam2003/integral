import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = "https://tu-backend-url.com";  // Cambia por la URL de tu backend
    _dio.options.connectTimeout = const Duration(seconds: 10);  // Tiempo de espera para la conexión
    _dio.options.receiveTimeout = const Duration(seconds: 10);  // Tiempo de espera para recibir respuesta
  }

  // Método para realizar el login
  Future<Response> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        '/login',  // Este es el endpoint de login de tu backend
        data: {
          'email': email,
          'password': password,
        },
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        print("Error Dio: ${e.response?.data}");
      } else {
        print("Error desconocido: $e");
      }
      rethrow;  // Re-lanza el error para manejarlo en la capa superior
    }
  }
}