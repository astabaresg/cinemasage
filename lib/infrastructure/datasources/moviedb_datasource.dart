import 'package:cinemasage/config/constants/constants.dart';
import 'package:cinemasage/infrastructure/models/moviedb/movie_details.dart';
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

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDbResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDbResponse.results
        .where((movieDb) =>
            movieDb.posterPath != Constants.POSTER_NOT_FOUND_MESSAGE)
        .map((e) => MovieMapper.movieDBToEntity(e))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) {
      throw Exception('Movie with id $id not found');
    }
    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);
    return movie;
  }
}
