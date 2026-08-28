import 'package:cinebox_flutter/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesByGenrer extends ConsumerStatefulWidget {
  const MoviesByGenrer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesByGenrerState();
}

class _MoviesByGenrerState extends ConsumerState<MoviesByGenrer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 130),
      child: MoviesBox(
        title: 'Filmes encontrados',
        movies: [],
        vertical: true,
      ),
    );
  }
}
