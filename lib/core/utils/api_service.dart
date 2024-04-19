import 'package:dio/dio.dart';

class ApiService {
  static const _baseUrl = 'https://api.themoviedb.org/3/movie';

  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
