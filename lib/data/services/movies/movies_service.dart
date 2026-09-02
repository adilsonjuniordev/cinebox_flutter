import 'package:cinebox_flutter/data/models/favorite_movie_response.dart';
import 'package:cinebox_flutter/data/models/save_favorite_movie.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_service.g.dart';

@RestApi()
abstract class MoviesService {
  factory MoviesService(Dio dio) = _MoviesService;

  @GET('/favorite')
  Future<List<FavoriteMovieResponse>> getMyFavoriteMovies();

  @POST('/favorite')
  Future<void> saveFavoriteMovie(@Body() SaveFavoriteMovie request);

  @DELETE('/favorite/{movieId}')
  Future<void> deleteFavoriteMovie(@Path('movieId') int movieId);
}
