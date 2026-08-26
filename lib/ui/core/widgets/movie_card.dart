import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieCard extends ConsumerStatefulWidget {
  const MovieCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieCardState();
}

class _MovieCardState extends ConsumerState<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 148,
          height: 250,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
