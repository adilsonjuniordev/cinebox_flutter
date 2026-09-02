import 'package:cinebox_flutter/domain/models/movie.dart';

extension MarkFavoriteExtension on List<Movie> {
  List<Movie> markFavorites(List<int> myFavorites) {
    return map((movie) {
      return myFavorites.contains(movie.id)
          ? movie.copyWith(isFavorite: true)
          : movie;
    }).toList();
  }
}
