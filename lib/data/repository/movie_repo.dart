import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/data/json/movie_collection_json.dart';
import 'package:movies_app/data/json/movie_detail_json.dart';

class MovieRepository {
  static const String _apiKey = "6479e3dcc6ff8b327445db908d01b3c2";
  static const String _apiServer = "https://api.themoviedb.org/3";
  static const String _w500 = '/w500';
  static const String _imageServer = "https://image.tmdb.org/t/p";

  static const String _popMoviesEndPoint = '/movie/popular';
  static const String _movieDetailEndPoint = '/movie';

  static Future<MovieCollectionJson> getPopularMovies(int page) async {
    final http.Response res = await http.get(Uri.parse(
        _apiServer + _popMoviesEndPoint + "?api_key=$_apiKey&page=$page"));

    if (res.statusCode == 200) {
      return MovieCollectionJson.fromMap(jsonDecode(res.body));
    }
    throw Exception(
        "The request did not complete successfully, response code : ${res.statusCode}");
  }

  static String getFullImageURL(String imagePath) {
    return _imageServer + _w500 + imagePath;
  }

  static Future<MovieDetailJson> getMovieDetail(int movieId) async {
    final http.Response res = await http.get(Uri.parse(
        _apiServer + _movieDetailEndPoint + "/" + movieId.toString() + "?api_key=$_apiKey"));

    if (res.statusCode == 200) {
      return MovieDetailJson.fromJson(jsonDecode(res.body));
    }
    throw Exception(
        "The request did not complete successfully, response code : ${res.statusCode}");
  }
}
