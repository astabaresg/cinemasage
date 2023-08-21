import 'package:cinemasage/domain/entities/actor.dart';
import 'package:cinemasage/presentation/providers/actors/actors_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
  (ref) {
    final actorsRepository = ref.watch(actorsRepositoryProvider);
    return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
  },
);

/*
{
  '505050':List<Actor>,
  '505051':List<Actor>,
  '505052':List<Actor>,
  '505053':List<Actor>,
}
*/

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;
  ActorsByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final List<Actor> actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
