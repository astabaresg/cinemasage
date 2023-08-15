import 'package:cinemasage/domain/entities/movie.dart';
import 'package:cinemasage/presentation/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  if (nowPlayingMovies.isEmpty) return [];
  return nowPlayingMovies.sublist(0, 6);
});
