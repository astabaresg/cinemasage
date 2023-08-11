// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static final String MOVIE_DB_KEY =
      dotenv.env['THE_MOVIEDB_KEY'] ?? "No hay api key";
}
