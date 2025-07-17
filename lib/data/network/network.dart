import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtil {
  Future<http.Response> get(
    String url,
  ) {
    final headers = {
      'Content-Type': 'application/json',
    };
    return http.get(Uri.parse(url), headers: headers);
  }

  Future<http.Response> post({
    required String url,
    required Object body,
  }) {
    final headers = {
      'Content-Type': 'application/json',
    };

    return http.post(
      Uri.parse(url),
      body: json.encode(body),
      headers: headers,
    );
  }

  Future<http.Response> put({
    required String url,
    required Object body,
  }) {
    final headers = {
      'Content-Type': 'application/json',
    };
    return http.put(
      Uri.parse(url),
      body: json.encode(body),
      headers: headers,
    );
  }

  Future<http.Response> delete({
    required String url,
    dynamic data,
  }) {
    final headers = {
      'Content-Type': 'application/json',
    };
    return http.delete(
      Uri.parse(url),
      headers: headers,
      body: json.encode(data),
    );
  }

  
}
