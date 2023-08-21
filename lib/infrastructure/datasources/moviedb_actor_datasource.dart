import 'package:cinemasage/config/dio/dio_config.dart';
import 'package:cinemasage/domain/datasources/actors_datasource.dart';
import 'package:cinemasage/domain/entities/actor.dart';
import 'package:cinemasage/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemasage/infrastructure/models/moviedb/credits_response.dart';

class MovieDBActorDatasource extends ActorsDatasource {
  final dio = DioConfig.getDioClient();
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(response.data);
    List<Actor> actors = creditsResponse.cast
        .map((cast) => ActorMapper.castToActor(cast))
        .toList();
    return actors;
  }
}
