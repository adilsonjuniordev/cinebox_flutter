import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/data/services/tmdb/tmdb_service.dart';

import 'package:cinebox_flutter/domain/models/movie.dart';

import './tmdb_repository.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final TmdbService _tmdbService;

  TmdbRepositoryImpl({required this._tmdbService});

  @override
  Future<Result<List<Movie>>> getPopularMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    final moviesData = await _tmdbService.getPopularMovies(
      language: language,
      page: page,
    );
  }
}
