import 'package:cinebox_flutter/ui/core/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class MoviesBox extends StatelessWidget {
  const MoviesBox({super.key, required this.title, this.vertical = false});

  final String title;
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
                for (var i = 0; i < 10; i++) MovieCard(),
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 16),
                  child: MovieCard(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
