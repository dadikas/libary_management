import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {
  static String baseUrl = dotenv.env['API_URL'] ?? 'http://localhost:3000/';
  static const apiV = 'api/v1/';
  static const signup = '${apiV}auth/signup';
}