import 'package:cinemasage/config/constants/constants.dart';
import 'package:cinemasage/domain/entities/actor.dart';
import 'package:cinemasage/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToActor(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath == ''
          ? Constants.CAST_PROFILE_DEFAULT_IMAGE
          : '${Constants.MOVIE_DB_API_IMAGES}${cast.profilePath}',
      haveProfilePath: cast.profilePath != '',
      character: cast.character);
}
