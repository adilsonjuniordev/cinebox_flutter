import 'dart:developer';

import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/data/repositories/repositories_providers.dart';
import 'package:cinebox_flutter/domain/models/favorite_movie.dart';
import 'package:cinebox_flutter/ui/core/commands/favorite_movie_command.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_favorite_movie_command.g.dart';

@riverpod
class SaveFavoriteMovieCommand extends _$SaveFavoriteMovieCommand {
  @override
  AsyncValue<int> build(Key key, int movieId) => AsyncData(movieId);

  Future<void> execute({
    required int id,
    required String title,
    required String posterPath,
    required int year,
  }) async {
    final favoriteMovieCommand = ref.read(
      favoriteMovieCommandProvider(id).notifier,
    )..setFavorite(true);

    final moviesRepository = ref.read(moviesRepositoryProvider);

    final result = await moviesRepository.saveFavoriteMovie(
      FavoriteMovie(
        id: id,
        title: title,
        posterPath: posterPath,
        year: year,
      ),
    );

    switch (result) {
      case Success():
        log('Favorito salvo com sucesso');
      case Failure(:final error):
        favoriteMovieCommand.setFavorite(false);
        state = AsyncError(error, StackTrace.current);
        log('Erro ao salvar favorito}');
    }
  }
}
