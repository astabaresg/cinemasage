import 'package:cinemasage/domain/datasources/actors_datasource.dart';
import 'package:cinemasage/domain/entities/actor.dart';
import 'package:cinemasage/domain/repositories/actors_repository.dart';

class ActorsRepositoryImpl extends ActorsRepository {
  final ActorsDatasource actorsDatasource;

  ActorsRepositoryImpl({required this.actorsDatasource});

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return actorsDatasource.getActorsByMovie(movieId);
  }
}
