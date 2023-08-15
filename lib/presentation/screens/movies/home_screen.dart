import 'package:flutter/material.dart';
import 'package:cinemasage/presentation/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cinemasage/presentation/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    // final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMoviesSlideshow = ref.watch(moviesSlideshowProvider);
    final colors = Theme.of(context).colorScheme;
    if (nowPlayingMoviesSlideshow.isEmpty) {
      return Center(
        child: CircularProgressIndicator(color: colors.primary),
      );
    }
    return Column(
      children: [
        const CustomAppBar(),
        MoviesSlideshow(movies: nowPlayingMoviesSlideshow)
      ],
    );
  }
}
