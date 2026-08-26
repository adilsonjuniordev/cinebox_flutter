import 'package:cinebox_flutter/ui/core/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class MoviesBox extends StatelessWidget {
  const MoviesBox({super.key, required this.title});

  final String title;

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
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 253,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: .horizontal,
            padding: EdgeInsets.only(left: 20),
            itemCount: 10,
            itemBuilder: (context, index) {
              return MovieCard();
            },
          ),
        ),
      ],
    );
  }
}
