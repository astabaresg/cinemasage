import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemasage/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemasage/infrastructure/repositories/movie_repository_impl.dart';

// This repository is immutable
// is just to get the information about the movies
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(moviesDatasource: MovieDBDatasource());
});
