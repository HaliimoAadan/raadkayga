import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class Api {
  Api({http.Client? client}) : _client = client ?? http.Client();
  final http.Client _client;

  Future<String> health() async {
    final res = await _client.get(Uri.parse('$apiUrl/api/health'));
    if (res.statusCode != 200) {
      throw Exception('API returned ${res.statusCode}');
    }
    final body = jsonDecode(res.body) as Map<String, dynamic>;
    return body['status'] as String;
  }
}