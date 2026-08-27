import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/domain/models/movie.dart';

abstract interface class TmdbRepository {
  Future<Result<List<Movie>>> getPopularMovies({String language, int page});
}
