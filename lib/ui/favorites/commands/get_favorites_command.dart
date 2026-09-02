import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/data/repositories/repositories_providers.dart';
import 'package:cinebox_flutter/domain/models/favorite_movie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_favorites_command.g.dart';

@riverpod
class GetFavoritesCommand extends _$GetFavoritesCommand {
  @override
  AsyncValue<List<FavoriteMovie>> build() => AsyncLoading();

  Future<void> execute() async {
    final repo = ref.read(moviesRepositoryProvider);
    final result = await repo.getMyFavoriteMovies();

    state = switch (result) {
      Success(:final value) => AsyncData(value),
      Failure() => AsyncError(
        Exception('Erro ao buscar filmes favoritos'),
        StackTrace.current,
      ),
    };
  }
}
