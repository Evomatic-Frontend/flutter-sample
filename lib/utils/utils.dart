import 'package:dio/dio.dart';
import 'package:flutter_simple_app/types/product.dart';
import 'dart:convert';
import 'endpoints.dart';

Future<int?> login() async {
  try {
    Response response = await Dio().get(loginUrl);
    return response.statusCode;
  } catch (e) {
    return 501;
  }
}

Future<List<Product>> getProducts() async {
  try {
    Response response = await Dio().get(loginUrl);
    return parseProducts(response.data);
  } catch (e) {
    return List.empty();
  }
}

List<Product> parseProducts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}
