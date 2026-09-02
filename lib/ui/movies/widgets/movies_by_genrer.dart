import 'package:cinebox_flutter/ui/core/themes/colors.dart';
import 'package:cinebox_flutter/ui/movies/commands/get_movies_by_genre_command.dart';
import 'package:cinebox_flutter/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MoviesByGenrer extends ConsumerWidget {
  const MoviesByGenrer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultMovies = ref.watch(getMoviesByGenreCommandProvider);

    return resultMovies.when(
      loading: () => Center(
        child: Padding(
          padding: EdgeInsetsDirectional.all(20),
          child: LoadingAnimationWidget.threeArchedCircle(
            color: AppColors.redColor,
            size: 60,
          ),
        ),
      ),
      error: (_, _) => Center(child: Text('Erro ao carregar filmes')),
      data: (data) => Container(
        margin: EdgeInsets.only(bottom: 130),
        child: MoviesBox(
          title: 'Filmes encontrados',
          movies: data,
          vertical: true,
        ),
      )
    );
  }
}
