// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  // TheMovieDB params
  static final String MOVIE_DB_KEY =
      dotenv.env['THE_MOVIEDB_KEY'] ?? "No hay api key";

  static const String MOVIE_DB_API_URL = "https://api.themoviedb.org/3";
  static const String MOVIE_DB_API_LANGUAGE = "es-CO";
  static const String MOVIE_DB_API_IMAGES = "https://image.tmdb.org/t/p/w500";
}
