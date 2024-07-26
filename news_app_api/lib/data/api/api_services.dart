import 'dart:convert';
import 'package:d_method/d_method.dart';
import 'package:http/http.dart' as http;
import '../models/article.dart';
 
class ApiService {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = 'e3250fe831e5454d9f5d1b5a398b004f';
  static const String _category = 'business';
  static const String _country = 'us';
 
  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.parse("${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    DMethod.logResponse(response);
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}