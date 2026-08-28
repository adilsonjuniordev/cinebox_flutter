import 'package:cinebox_flutter/data/models/movie_response.dart';
import 'package:cinebox_flutter/domain/models/movie.dart';

class MovieMapper {
  static List<Movie> mapToMovies(MovieResponse movieResponse) {
    return movieResponse.results
        .map(
          (item) => Movie(
            id: item.id,
            title: item.title,
            overview: item.overview,
            genreIds: item.genreIds ?? [],
            posterPath: item.posterPath,
            backdropPath: item.backdropPath,
            releaseDate: item.releaseDate,
            voteAverage: item.voteAverage,
          ),
        )
        .toList();
  }
}
