import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox_flutter/ui/core/commands/favorite_movie_command.dart';
import 'package:cinebox_flutter/ui/core/commands/remove_favorite_movie_command.dart';
import 'package:cinebox_flutter/ui/core/commands/save_favorite_movie_command.dart';
import 'package:cinebox_flutter/ui/core/themes/colors.dart';
import 'package:cinebox_flutter/ui/core/widgets/loader_messages.dart';
import 'package:cinebox_flutter/ui/core/widgets/movie_card_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MovieCard extends ConsumerStatefulWidget {
  const MovieCard({
    super.key,
    required this.id,
    required this.title,
    required this.year,
    required this.imageUrl,
    required this.isFavorite,
    this.onFavoriteTap,
  });

  final int id;
  final String title;
  final int year;
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieCardState();
}

class _MovieCardState extends ConsumerState<MovieCard> with LoaderAndMessages {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(favoriteMovieCommandProvider(widget.id).notifier)
          .setFavorite(widget.isFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = ref.watch(favoriteMovieCommandProvider(widget.id));

    ref.listen(
      saveFavoriteMovieCommandProvider(widget.key!, widget.id),
      (_, next) {
        next.whenOrNull(
          error: (error, stackTrace) {
            showErrorSnackbar(
              'Desculpe, não foi possível salvar seu filme aos favoritos.',
            );
          },
        );
      },
    );

    ref.listen(
      removeFavoriteMovieCommandProvider(widget.key!, widget.id),
      (_, next) {
        next.whenOrNull(
          error: (error, stackTrace) {
            showErrorSnackbar(
              'Desculpe, não foi possível remover o filme dos favoritos.',
            );
          },
        );
      },
    );

    return Stack(
      children: [
        SizedBox(
          width: 148,
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: widget.imageUrl,
                errorWidget: (context, url, error) {
                  return Container(
                    width: 148,
                    height: 184,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[300],
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        Icon(
                          Icons.error,
                          color: AppColors.redColor,
                          size: 50,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Erro ao carregar imagem',
                          style: TextStyle(color: AppColors.redColor),
                          textAlign: .center,
                        ),
                      ],
                    ),
                  );
                },
                imageBuilder: (context, imageProvider) {
                  return Container(
                    width: 148,
                    height: 184,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) => Center(
                  child: LoadingAnimationWidget.discreteCircle(
                    color: AppColors.redColor,
                    size: 40,
                  ),
                ),
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${widget.year}',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGrey,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 55,
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed:
                    widget.onFavoriteTap ??
                    () {
                      ref
                          .read(
                            movieCardViewModelProvider(
                              widget.key!,
                              widget.id,
                            ).notifier,
                          )
                          .addOrRemoveFavorite(
                            id: widget.id,
                            title: widget.title,
                            posterPath: widget.imageUrl,
                            year: widget.year,
                            favorite: !isFavorite,
                          );
                    },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? AppColors.redColor : AppColors.lightGrey,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
