import 'package:cinebox_flutter/domain/models/favorite_movie.dart';
import 'package:cinebox_flutter/ui/core/themes/colors.dart';
import 'package:cinebox_flutter/ui/core/widgets/loader_messages.dart';
import 'package:cinebox_flutter/ui/core/widgets/movie_card.dart';
import 'package:cinebox_flutter/ui/favorites/commands/get_favorites_command.dart';
import 'package:cinebox_flutter/ui/favorites/favorites_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage>
    with LoaderAndMessages {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favoritesViewModelProvider).fetchFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(getFavoritesCommandProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Favoritos'),
      ),
      body: favoritesMovies.when(
        loading: () => Center(
          child: Padding(
            padding: EdgeInsetsDirectional.all(20),
            child: LoadingAnimationWidget.threeArchedCircle(
              color: AppColors.redColor,
              size: 60,
            ),
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Erro ao carregar os favoritos'),
        ),
        data: (data) {
          if (data.isEmpty) {
            return Center(
              child: Text('Nenhum filme favorito encontrado.'),
            );
          }

          return Container(
            margin: EdgeInsets.only(bottom: 130),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 148,
                      mainAxisExtent: 268,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final FavoriteMovie(
                          :id,
                          :title,
                          :year,
                          posterPath: imageUrl,
                        ) = data[index];
                        return Container(
                          margin: EdgeInsets.all(8),
                          child: MovieCard(
                            key: UniqueKey(),
                            id: id,
                            title: title,
                            year: year,
                            imageUrl: imageUrl,
                            isFavorite: true,
                            onFavoriteTap: () async {
                              showLoader();
                              await ref
                                  .read(favoritesViewModelProvider)
                                  .deleteFavoriteMovie(id);
                              hideLoader();
                            },
                          ),
                        );
                      },
                      childCount: data.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
