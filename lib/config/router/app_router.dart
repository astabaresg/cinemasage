import 'package:go_router/go_router.dart';
import 'package:cinemasage/presentation/screens/screens.dart';
import 'package:cinemasage/presentation/views/views.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) => const HomeView(),
            routes: [
              GoRoute(
                path: 'movie/:id',
                name: MovieScreen.name,
                builder: (context, state) {
                  final movieId = state.pathParameters;
                  return MovieScreen(movieId: movieId['id'] ?? 'no-id');
                },
              ),
            ]),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavoritesView(),
        )
      ])
  // Father/child routes
  // GoRoute(
  //     path: '/',
  //     name: HomeScreen.name,
  //     builder: (context, state) => const HomeScreen(childView: FavoritesView()),
  //     routes: [
  //       GoRoute(
  //         path: 'movie/:id',
  //         name: MovieScreen.name,
  //         builder: (context, state) {
  //           final movieId = state.pathParameters;
  //           return MovieScreen(movieId: movieId['id'] ?? 'no-id');
  //         },
  //       ),
  //     ]),
]);
