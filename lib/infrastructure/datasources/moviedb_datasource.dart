import 'package:cinemasage/config/constants/constants.dart';
import 'package:dio/dio.dart';

import 'package:cinemasage/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemasage/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinemasage/config/constants/enviroment.dart';
import 'package:cinemasage/domain/datasources/movies_datasource.dart';
import 'package:cinemasage/domain/entities/movie.dart';

class MovieDBDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: Constants.MOVIE_DB_API_URL,
      queryParameters: {
        "api_key": Enviroment.MOVIE_DB_KEY,
        "language": Constants.MOVIE_DB_API_LANGUAGE
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
        .where((movieDb) =>
            movieDb.posterPath != Constants.POSTER_NOT_FOUND_MESSAGE)
        .map((e) => MovieMapper.movieDBToEntity(e))
        .toList();
    return movies;
  }
}
