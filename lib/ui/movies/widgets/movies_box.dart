import 'package:cinebox_flutter/domain/models/movie.dart';
import 'package:cinebox_flutter/ui/core/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MoviesBox extends StatelessWidget {
  const MoviesBox({
    super.key,
    required this.title,
    required this.movies,
    this.vertical = false,
  });

  final String title;
  final List<Movie> movies;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 32, bottom: 24),
          child: Text(
            title,
            style:
                Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
            textAlign: .start,
          ),
        ),
        Visibility(
          visible: !vertical,
          replacement: Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              runAlignment: .center,
              children: [
                for (var movie in movies)
                  MovieCard(
                    id: movie.id,
                    title: movie.title,
                    year:
                        movie.releaseDate != null &&
                            movie.releaseDate!.isNotEmpty
                        ? DateTime.parse(movie.releaseDate!).year
                        : DateTime.now().year,
                    imageUrl:
                        'https://images.tmdb.org/t/p/w154/${movie.posterPath}',
                    isFavorite: movie.isFavorite,
                  ),
              ],
            ),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 253,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: .horizontal,
              padding: EdgeInsets.only(left: 20),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Container(
                  margin: EdgeInsets.only(right: 16),
                  child: MovieCard(
                    key: UniqueKey(),
                    id: movie.id,
                    title: movie.title,
                    year:
                        movie.releaseDate != null &&
                            movie.releaseDate!.isNotEmpty
                        ? DateTime.parse(movie.releaseDate!).year
                        : DateTime.now().year,
                    imageUrl:
                        'https://images.tmdb.org/t/p/w154/${movie.posterPath}',
                    isFavorite: movie.isFavorite,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ).animate().moveX(begin: 200, duration: 800.ms);
  }
}
