import 'package:cinemasage/config/constants/constants.dart';
import 'package:cinemasage/config/constants/enviroment.dart';
import 'package:dio/dio.dart';

class DioConfig {
  static Dio getDioClient() {
    return Dio(BaseOptions(
        baseUrl: Constants.MOVIE_DB_API_URL,
        queryParameters: {
          "api_key": Enviroment.MOVIE_DB_KEY,
          "language": Constants.MOVIE_DB_API_LANGUAGE
        }));
  }
}
