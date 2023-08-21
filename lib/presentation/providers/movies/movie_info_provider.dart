import 'dart:developer';

import 'package:cinemasage/domain/entities/movie.dart';
import 'package:cinemasage/presentation/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>(
  (ref) {
    final getMovie = ref.watch(movieRepositoryProvider).getMovieById;
    return MovieMapNotifier(getMovie: getMovie);
  },
);

/*
{
  '505050':Movie(),
  '505051':Movie(),
  '505052':Movie(),
  '505053':Movie(),
}
*/

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;
  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    log('Making http request');
    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}
