import 'package:cinemasage/config/constants/enviroment.dart';
import 'package:cinemasage/domain/entities/movie.dart';
import 'package:cinemasage/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: moviedb.backdropPath != ''
          ? '${Enviroment.MOVIE_DB_API_IMAGES}${moviedb.backdropPath}'
          : Enviroment.BACKDROP_NOT_FOUND_IMAGE,
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: moviedb.posterPath != ''
          ? '${Enviroment.MOVIE_DB_API_IMAGES}${moviedb.posterPath}'
          : Enviroment.POSTER_NOT_FOUND_IMAGE,
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);
}
