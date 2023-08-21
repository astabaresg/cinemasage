import 'package:cinemasage/config/constants/constants.dart';
import 'package:cinemasage/domain/entities/movie.dart';
import 'package:cinemasage/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemasage/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: moviedb.backdropPath != ''
          ? '${Constants.MOVIE_DB_API_IMAGES}${moviedb.backdropPath}'
          : Constants.BACKDROP_NOT_FOUND_IMAGE,
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: moviedb.posterPath != ''
          ? '${Constants.MOVIE_DB_API_IMAGES}${moviedb.posterPath}'
          : Constants.POSTER_NOT_FOUND_MESSAGE,
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);

  static Movie movieDetailsToEntity(MovieDetails movie) => Movie(
      adult: movie.adult,
      backdropPath: movie.backdropPath != ''
          ? '${Constants.MOVIE_DB_API_IMAGES}${movie.backdropPath}'
          : Constants.BACKDROP_NOT_FOUND_IMAGE,
      genreIds: movie.genres.map((e) => e.name).toList(),
      id: movie.id,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath != ''
          ? '${Constants.MOVIE_DB_API_IMAGES}${movie.posterPath}'
          : Constants.POSTER_NOT_FOUND_MESSAGE,
      releaseDate: movie.releaseDate,
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount);
}
