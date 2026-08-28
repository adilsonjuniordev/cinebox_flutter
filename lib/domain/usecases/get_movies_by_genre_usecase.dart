import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox_flutter/domain/models/movie.dart';

class GetMoviesByGenreUsecase {
  TmdbRepository _tmdbRepository;

  GetMoviesByGenreUsecase({required this._tmdbRepository});

  Future<Result<List<Movie>>> execute({required int genreId}) async {
    final moviesByGenreResult = await _tmdbRepository.getMoviesByGenres(
      genreId: genreId,
    );

    return moviesByGenreResult;
  }
}
