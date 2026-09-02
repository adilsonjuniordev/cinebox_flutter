import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/domain/models/favorite_movie.dart';

abstract interface class MoviesRepository {
  Future<Result<List<FavoriteMovie>>> getMyFavoriteMovies();
  Future<Result<Unit>> deleteFavoriteMovie(int movieId);
  Future<Result<Unit>> saveFavoriteMovie(FavoriteMovie favoriteMovie);
}
