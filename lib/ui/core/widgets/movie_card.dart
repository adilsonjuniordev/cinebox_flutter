import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class _MovieCardState extends ConsumerState<MovieCard> {
  @override
  Widget build(BuildContext context) {
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
                  child: CircularProgressIndicator(
                    color: AppColors.redColor,
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
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
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
