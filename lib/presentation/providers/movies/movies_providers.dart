import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemasage/domain/entities/movie.dart';
import 'package:cinemasage/presentation/providers/movies/movies_repository_provider.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

// This defines the use case to load more movies
typedef MovieCallBack = Future<List<Movie>> Function({int page});

// This works to manage a state for the list of movies to show
class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallBack fetchMoreMovies;
  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);

    // When the state changes, this notifier will notify all parts of the
    // application that were listening to it
    state = [...state, ...movies];
  }
}
