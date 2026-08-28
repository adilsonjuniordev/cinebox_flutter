import 'package:cinebox_flutter/ui/movies/movies_view_model.dart';
import 'package:cinebox_flutter/ui/movies/widgets/genres_box.dart';
import 'package:cinebox_flutter/ui/movies/widgets/movies_appbar.dart';
import 'package:cinebox_flutter/ui/movies/widgets/movies_by_category.dart';
import 'package:cinebox_flutter/ui/movies/widgets/movies_by_genrer.dart';
import 'package:cinebox_flutter/ui/movies/widgets/movies_by_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesPage extends ConsumerStatefulWidget {
  const MoviesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesPageState();
}

class _MoviesPageState extends ConsumerState<MoviesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(moviesViewModelProvider.notifier).fetchMoviesByCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final moviesViewModel = ref.watch(moviesViewModelProvider);

    return CustomScrollView(
      slivers: [
        MoviesAppBar(),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 22),
            child: GenresBox(),
          ),
        ),
        SliverToBoxAdapter(
          //child: MoviesByCategory(), //Fazer chaveamento
          //child: MoviesBySearch(),
          child: switch (moviesViewModel) {
            MoviesViewEnum.byCategory => MoviesByCategory(),
            MoviesViewEnum.bySearch => MoviesBySearch(),
            MoviesViewEnum.byGenrer => MoviesByGenrer(),
          },
        ),
      ],
    );
  }
}
