import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/data/repositories/movies/movies_repository.dart';
import 'package:cinebox_flutter/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox_flutter/domain/extensions/mark_favorite_extension.dart';
import 'package:cinebox_flutter/domain/models/favorite_movie.dart';
import 'package:cinebox_flutter/domain/models/movie.dart';

class GetMoviesBySearchUsecase {
  final TmdbRepository _tmdbRepository;
  final MoviesRepository _moviesRepository;

  GetMoviesBySearchUsecase({
    required this._tmdbRepository,
    required this._moviesRepository,
  });

  Future<Result<List<Movie>>> execute({required String query}) async {
    final results = await Future.wait([
      _moviesRepository.getMyFavoriteMovies(),
      _tmdbRepository.getSearchMovies(query: query),
    ]);

    if (results case [
      Success<List<FavoriteMovie>>(value: final favorites),
      Success<List<Movie>>(value: final movieByGenre),
    ]) {
      final favoritesIds = favorites.map((f) => f.id).toList();
      return Success(movieByGenre.markFavorites(favoritesIds));
    }

    return Failure(Exception('Erro ao buscar filmes por gênero'));
  }
}
