import 'package:cinebox_flutter/ui/core/themes/colors.dart';
import 'package:cinebox_flutter/ui/movies/commands/get_genres_command.dart';
import 'package:cinebox_flutter/ui/movies/movies_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenresBox extends ConsumerStatefulWidget {
  const GenresBox({super.key});

  @override
  ConsumerState<GenresBox> createState() => _GenresBoxState();
}

class _GenresBoxState extends ConsumerState<GenresBox> {
  final selectedGenre = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final genres = ref.watch(getGenresCommandProvider);

    return genres.when(
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) =>
          Center(child: Text('Erro ao carregar gêneros')),
      data: (data) => SizedBox(
        height: 25,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 16),
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final genre = data[index];
            return Consumer(
              builder: (context, ref, child) {
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    if (selectedGenre.value == genre.id) {
                      selectedGenre.value = 0;
                      ref
                          .read(moviesViewModelProvider.notifier)
                          .fetchMoviesByCategory();
                      return;
                    }

                    selectedGenre.value = genre.id;
                    ref
                        .read(moviesViewModelProvider.notifier)
                        .fetchMoviesByGenre(genre.id);
                  },
                  child: ValueListenableBuilder(
                    valueListenable: selectedGenre,
                    builder: (_, value, _) {
                      return Container(
                        margin: EdgeInsets.only(right: 8),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: value == genre.id
                              ? AppColors.redColor
                              : AppColors.darkGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            genre.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
