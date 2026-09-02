import 'package:cinebox_flutter/ui/core/themes/colors.dart';
import 'package:cinebox_flutter/ui/movies/commands/get_movies_by_search_command.dart';
import 'package:cinebox_flutter/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MoviesBySearch extends ConsumerStatefulWidget {
  const MoviesBySearch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesBySearchState();
}

class _MoviesBySearchState extends ConsumerState<MoviesBySearch> {
  @override
  Widget build(BuildContext context) {
    final moviesResult = ref.watch(getMoviesBySearchCommandProvider);
    return moviesResult.when(
      loading: () => Center(
        child: Padding(
          padding: EdgeInsetsDirectional.all(20),
          child: LoadingAnimationWidget.threeArchedCircle(
            color: AppColors.redColor,
            size: 60,
          ),
        ),
      ),
      error: (error, stackTrace) =>
          Center(child: Text('Erro ao buscar filmes')),
      data: (data) => Container(
        margin: EdgeInsets.only(bottom: 130),
        child: MoviesBox(
          movies: data,
          title: 'Filmes encontrados',
          vertical: true,
        ),
      ),
    );
  }
}
