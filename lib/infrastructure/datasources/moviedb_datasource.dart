import 'package:cinemasage/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

import 'package:cinemasage/config/constants/enviroment.dart';
import 'package:cinemasage/domain/datasources/movies_datasource.dart';
import 'package:cinemasage/domain/entities/movie.dart';

class MovieDBDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: Enviroment.MOVIE_DB_API_URL,
      queryParameters: {
        "api_key": Enviroment.MOVIE_DB_KEY,
        "language": Enviroment.MOVIE_DB_API_LANGUAGE
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get<MovieDbResponse>('/movie/now_playing');
    final List<Movie> movies = [];
    return movies;
  }
}
