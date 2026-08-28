import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox_flutter/domain/models/movie.dart';
import 'package:cinebox_flutter/domain/models/movies_by_category.dart';

class GetMoviesByCategoryUsecase {
  final TmdbRepository _tmdbRepository;

  GetMoviesByCategoryUsecase({required this._tmdbRepository});

  Future<Result<MoviesByCategory>> execute() async {
    final results = await Future.wait([
      _tmdbRepository.getPopularMovies(),
      _tmdbRepository.getNowPlayingMovies(),
      _tmdbRepository.getTopRatedMovies(),
      _tmdbRepository.getUpcomingMovies(),
    ]);

    if (results case [
      Success<List<Movie>>(value: final popularMovies),
      Success<List<Movie>>(value: final nowPlayingMovies),
      Success<List<Movie>>(value: final topRatedMovies),
      Success<List<Movie>>(value: final upcomingMovies),
    ]) {
      return Success(
        MoviesByCategory(
          popular: popularMovies,
          topRated: topRatedMovies,
          nowPlaying: nowPlayingMovies,
          upcoming: upcomingMovies,
        ),
      );
    }

    return Failure(Exception('Erro ao buscar categorias de filmes'));
  }
}
