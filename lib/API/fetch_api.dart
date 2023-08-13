import 'dart:convert';
import 'app_constants.dart';
import '../model/movie_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl =
      '${AppConstant.baseUrl}/trending/movie/day?api_key=${AppConstant.apiKey}';
  static const _topRatedUrl =
      '${AppConstant.baseUrl}/movie/top_rated?api_key=${AppConstant.apiKey}';
  static const _upcomingUrl =
      '${AppConstant.baseUrl}/movie/upcoming?api_key=${AppConstant.apiKey}';

  Future<List<Results>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((json) => Results.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Results>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((json) => Results.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Results>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((json) => Results.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
