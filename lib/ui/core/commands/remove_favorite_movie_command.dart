import 'dart:developer';

import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/data/repositories/repositories_providers.dart';
import 'package:cinebox_flutter/ui/core/commands/favorite_movie_command.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remove_favorite_movie_command.g.dart';

@riverpod
class RemoveFavoriteMovieCommand extends _$RemoveFavoriteMovieCommand {
  @override
  AsyncValue<int> build(Key key, int movieId) => AsyncData(movieId);

  Future<void> execute() async {
    final favoriteMovieCommand = ref.read(
      favoriteMovieCommandProvider(movieId).notifier,
    )..setFavorite(false);

    final moviesRepository = ref.read(moviesRepositoryProvider);

    final result = await moviesRepository.deleteFavoriteMovie(movieId);

    switch (result) {
      case Success():
        log('Filme $movieId removido dos favoritos');
      case Failure(:final error):
        favoriteMovieCommand.setFavorite(true);
        state = AsyncError(error, StackTrace.current);
        log('Erro ao remover favorito');
    }
  }
}
