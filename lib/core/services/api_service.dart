import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  final String baseUrl = "http://10.0.2.2:5156/";

  Future<Response> post({
    required String endPoint,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    var res = await http
        .post(Uri.parse(baseUrl + endPoint), body: jsonEncode(body), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });
    return res;
  }

  Future<Response> get({required String endPoint, String? token}) async {
    var res = await http.get(
      Uri.parse(baseUrl + endPoint),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return res;
  }
}
