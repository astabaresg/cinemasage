import 'package:cinemasage/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
      path: '/home/:pageview',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageViewValue = state.pathParameters['pageview'] ?? '0';
        return HomeScreen(pageIndex: int.parse(pageViewValue));
      },
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
    path: '/',
    redirect: (_, __) => '/home/0',
  )
]);
