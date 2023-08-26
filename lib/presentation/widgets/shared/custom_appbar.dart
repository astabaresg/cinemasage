import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cinemasage/domain/entities/movie.dart';
import 'package:cinemasage/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemasage/presentation/providers/providers.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: Row(children: [
              Icon(
                Icons.movie_outlined,
                color: colors.primary,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Cinemasage',
                style: titleStyle,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    final movieRepository = ref.read(movieRepositoryProvider);
                    showSearch<Movie?>(
                            context: context,
                            delegate: SearchMovieDelegate(
                                searchMovies: movieRepository.searchMovies))
                        .then((movie) {
                      if (movie != null) {
                        context.push('/movie/${movie.id}');
                      }
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    color: colors.secondary,
                  ))
            ]),
          ),
        ));
  }
}
