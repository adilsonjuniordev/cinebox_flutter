import 'package:cinebox_flutter/data/repositories/movies/movies_repository.dart';
import 'package:cinebox_flutter/data/repositories/repositories_providers.dart';
import 'package:cinebox_flutter/ui/favorites/commands/get_favorites_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_view_model.g.dart';

class FavoritesViewModel {
  final GetFavoritesCommand _getFavoritesCommand;
  final MoviesRepository _moviesRepository;

  FavoritesViewModel({
    required this._getFavoritesCommand,
    required this._moviesRepository,
  });

  Future<void> fetchFavorites() => _getFavoritesCommand.execute();
  Future<void> deleteFavoriteMovie(int movieId) async {
    await _moviesRepository.deleteFavoriteMovie(movieId);
    await fetchFavorites();
  }
}

@riverpod
FavoritesViewModel favoritesViewModel(Ref ref) {
  return FavoritesViewModel(
    getFavoritesCommand: ref.read(getFavoritesCommandProvider.notifier),
    moviesRepository: ref.read(moviesRepositoryProvider),
  );
}
