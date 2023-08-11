import 'package:cinemasage/domain/datasources/movies_datasource.dart';
import 'package:cinemasage/domain/entities/movie.dart';
import 'package:cinemasage/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource moviesDatasource;
  MovieRepositoryImpl({required this.moviesDatasource});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesDatasource.getNowPlaying(page: page);
  }
}
