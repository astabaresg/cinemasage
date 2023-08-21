import 'package:cinemasage/infrastructure/datasources/moviedb_actor_datasource.dart';
import 'package:cinemasage/infrastructure/repositories/actors_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// This repository is immutable
// is just to get the information about the actors by movie
final actorsRepositoryProvider = Provider((ref) {
  return ActorsRepositoryImpl(actorsDatasource: MovieDBActorDatasource());
});
