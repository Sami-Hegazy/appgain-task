import 'dart:convert';
import 'package:appgain_task/models/movie.dart';
import 'package:appgain_task/utils/constant.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(Constant.popularUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happens sssssss');
    }
  }

  Future<List<Movie>> getTopRelatedMovies() async {
    final response = await http.get(Uri.parse(Constant.toRelatedUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happens sssssss');
    }
  }
}
