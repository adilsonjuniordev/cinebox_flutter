import 'dart:async';

import 'package:cinebox_flutter/ui/core/themes/colors.dart';
import 'package:cinebox_flutter/ui/core/themes/resource.dart';
import 'package:cinebox_flutter/ui/movies/movies_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesAppBar extends ConsumerStatefulWidget {
  const MoviesAppBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesAppBarState();
}

class _MoviesAppBarState extends ConsumerState<MoviesAppBar> {
  Timer? debounce;
  final _searchController = TextEditingController();
  final _showClearButton = ValueNotifier<bool>(false);

  @override
  void initState() {
    _searchController.addListener(() {
      _showClearButton.value = _searchController.text.isNotEmpty;
    });
    super.initState();
  }

  void onSearchChanged(String query) {
    if (query.isEmpty) {
      debounce?.cancel();
      ref.read(moviesViewModelProvider.notifier).fetchMoviesByCategory();
      return;
    }

    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      FocusScope.of(context).unfocus();
      ref.read(moviesViewModelProvider.notifier).fetchMoviesBySearch(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      foregroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      expandedHeight: MediaQuery.sizeOf(context).height * 0.25,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          R.assetsImagesSmallBannerPng,
          fit: BoxFit.cover,
        ),
        titlePadding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        title: SizedBox(
          height: 36,
          child: TextField(
            onTapOutside: (_) {
              FocusScope.of(context).unfocus();
            },
            onChanged: onSearchChanged,
            controller: _searchController,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              hintText: 'Procurar filme',
              hintStyle: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.search,
                  color: Colors.grey[600],
                  size: 15,
                ),
              ),
              suffixIcon: ValueListenableBuilder(
                valueListenable: _showClearButton,
                builder: (_, value, _) {
                  return Visibility(
                    visible: value,
                    child: IconButton(
                      onPressed: () {
                        _searchController.clear();
                        FocusScope.of(context).unfocus();
                        ref
                            .read(moviesViewModelProvider.notifier)
                            .fetchMoviesByCategory();
                      },
                      icon: Icon(Icons.clear),
                      color: AppColors.lightGrey,
                      iconSize: 15,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
