import 'package:dio/dio.dart';
import 'endpoints.dart';

Future<int?> login() async {
  try {
    Response response = await Dio().get(loginUrl);
    return response.statusCode;
  } catch (e) {
    return 501;
  }
}
