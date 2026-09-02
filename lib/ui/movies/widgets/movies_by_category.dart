import 'package:cinebox_flutter/ui/core/themes/colors.dart';
import 'package:cinebox_flutter/ui/movies/commands/get_movies_by_category_command.dart';
import 'package:cinebox_flutter/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MoviesByCategory extends ConsumerWidget {
  const MoviesByCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(getMoviesByCategoryCommandProvider);

    return movies.when(
      loading: () => Center(
        child: Padding(
          padding: EdgeInsetsDirectional.all(20),
          child: LoadingAnimationWidget.threeArchedCircle(
            color: AppColors.redColor,
            size: 60,
          ),
        ),
      ),
      error: (error, stackTrace) => Padding(
        padding: EdgeInsetsDirectional.all(20),
        child: Text('Erro ao buscar filmes'),
      ),
      data: (data) {
        if (data == null) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text('Nenhum filme encontrado'),
            ),
          ).animate().fadeIn(delay: 300.ms);
        }

        return Container(
          margin: EdgeInsets.only(bottom: 130),
          child: Column(
            children: [
              MoviesBox(title: 'Mais Populares', movies: data.popular),
              MoviesBox(title: 'Melhores Avaliados', movies: data.topRated),
              MoviesBox(title: 'Em Cartaz', movies: data.nowPlaying),
              MoviesBox(title: 'Em Breve', movies: data.upcoming),
            ],
          ),
        );
      },
    );
  }
}
