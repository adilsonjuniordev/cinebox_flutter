import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/domain/models/movie.dart';
import 'package:cinebox_flutter/domain/usecases/usecases_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movies_by_search_command.g.dart';

@riverpod
class GetMoviesBySearchCommand extends _$GetMoviesBySearchCommand {
  @override
  AsyncValue<List<Movie>> build() => AsyncLoading();

  Future<void> execute(String query) async {
    state = AsyncLoading();
    final searchMovieUC = ref.read(getMoviesBySearchUsecaseProvider);
    final result = await searchMovieUC.execute(query: query);
    state = switch (result) {
      Success<List<Movie>>(:final value) => AsyncData(value),
      Failure() => AsyncError(
        'Erro ao buscar filmes por pesquisa',
        StackTrace.current,
      ),
    };
  }
}
