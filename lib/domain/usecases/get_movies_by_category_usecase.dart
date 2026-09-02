import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/data/repositories/movies/movies_repository.dart';
import 'package:cinebox_flutter/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox_flutter/domain/extensions/mark_favorite_extension.dart';
import 'package:cinebox_flutter/domain/models/favorite_movie.dart';
import 'package:cinebox_flutter/domain/models/movie.dart';
import 'package:cinebox_flutter/domain/models/movies_by_category.dart';

class GetMoviesByCategoryUsecase {
  final TmdbRepository _tmdbRepository;
  final MoviesRepository _moviesRepository;

  GetMoviesByCategoryUsecase({
    required this._tmdbRepository,
    required this._moviesRepository,
  });

  Future<Result<MoviesByCategory>> execute() async {
    final results = await Future.wait([
      _moviesRepository.getMyFavoriteMovies(),
      _tmdbRepository.getPopularMovies(),
      _tmdbRepository.getTopRatedMovies(),
      _tmdbRepository.getNowPlayingMovies(),
      _tmdbRepository.getUpcomingMovies(),
    ]);

    if (results case [
      Success<List<FavoriteMovie>>(value: final favorites),
      Success<List<Movie>>(value: final popularMovies),
      Success<List<Movie>>(value: final topRatedMovies),
      Success<List<Movie>>(value: final nowPlayingMovies),
      Success<List<Movie>>(value: final upcomingMovies),
    ]) {
      final favoritesIds = favorites.map((f) => f.id).toList();

      return Success(
        MoviesByCategory(
          popular: popularMovies.markFavorites(favoritesIds),
          topRated: topRatedMovies.markFavorites(favoritesIds),
          nowPlaying: nowPlayingMovies.markFavorites(favoritesIds),
          upcoming: upcomingMovies.markFavorites(favoritesIds),
        ),
      );
    }

    return Failure(Exception('Erro ao buscar categorias de filmes'));
  }
}
