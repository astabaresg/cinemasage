import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemasage/presentation/providers/providers.dart';
import 'package:cinemasage/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final nowPlayingMoviesSlideshow = ref.watch(moviesSlideshowProvider);
    final colors = Theme.of(context).colorScheme;
    if (nowPlayingMoviesSlideshow.isEmpty) {
      return Center(
        child: CircularProgressIndicator(color: colors.primary),
      );
    }
    // return const FullScreenLoader();
    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppBar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            MoviesSlideshow(movies: nowPlayingMoviesSlideshow),
            MovieHorizontalListview(
              movies: nowPlayingMovies,
              title: 'En cines',
              subtitle: 'Te encantarán!',
              loadNextPage: () =>
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
            ),
            MovieHorizontalListview(
              movies: upcomingMovies,
              title: 'Próximamente',
              subtitle: 'Este mes',
              loadNextPage: () =>
                  ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
            ),
            MovieHorizontalListview(
              movies: popularMovies,
              title: 'Populares',
              loadNextPage: () =>
                  ref.read(popularMoviesProvider.notifier).loadNextPage(),
            ),
            MovieHorizontalListview(
              movies: topRatedMovies,
              title: 'Mejor calificadas',
              subtitle: 'Desde siempre',
              loadNextPage: () =>
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        );
      }, childCount: 1))
    ]);
  }
}
