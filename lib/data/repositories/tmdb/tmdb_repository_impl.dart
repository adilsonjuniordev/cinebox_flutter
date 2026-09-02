import 'dart:developer';

import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/data/exceptions/data_exception.dart';
import 'package:cinebox_flutter/data/mappers/movie_mapper.dart';
import 'package:cinebox_flutter/data/services/tmdb/tmdb_service.dart';
import 'package:cinebox_flutter/domain/models/genre.dart';

import 'package:cinebox_flutter/domain/models/movie.dart';
import 'package:dio/dio.dart';

import './tmdb_repository.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final TmdbService _tmdbService;

  TmdbRepositoryImpl({required this._tmdbService});

  @override
  Future<Result<List<Movie>>> getPopularMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getPopularMovies(
        language: language,
        page: page,
      );

      return Success(MovieMapper.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar getPopularMovies',
        error: e,
        stackTrace: s,
      );

      return Failure(DataException(message: 'Erro ao buscar filmes populares'));
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlayingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getNowPlayingMovies(
        language: language,
        page: page,
      );

      return Success(MovieMapper.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar getNowPlayingMovies',
        error: e,
        stackTrace: s,
      );

      return Failure(DataException(message: 'Erro ao buscar filmes em cartaz'));
    }
  }

  @override
  Future<Result<List<Movie>>> getTopRatedMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getTopRatedMovies(
        language: language,
        page: page,
      );

      return Success(MovieMapper.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar getTopRatedMovies',
        error: e,
        stackTrace: s,
      );

      return Failure(
        DataException(message: 'Erro ao buscar filmes mais bem avaliados'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getUpcomingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getUpcomingMovies(
        language: language,
        page: page,
      );

      return Success(MovieMapper.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar getUpComingMovies',
        error: e,
        stackTrace: s,
      );

      return Failure(DataException(message: 'Erro ao buscar filmes em breve'));
    }
  }

  @override
  Future<Result<List<Genre>>> getGenres({String language = 'pt-BR'}) async {
    try {
      final data = await _tmdbService.getMoviesGenres();
      final genres = data.genres
          .map((g) => Genre(id: g.id, name: g.name))
          .toList();
      return Success(genres);
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar generos',
        error: e,
        stackTrace: s,
      );

      return Failure(
        DataException(message: 'Erro ao buscar gêneros'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getMoviesByGenres({required int genreId}) async {
    try {
      final data = await _tmdbService.getDiscoverMovies(
        withGenres: genreId.toString(),
      );
      return Success(MovieMapper.mapToMovies(data));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes por gênero',
        error: e,
        stackTrace: s,
      );

      return Failure(
        DataException(message: 'Erro ao buscar filmes por gênero'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getSearchMovies({
    required String query,
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final data = await _tmdbService.getSearchMovies(
        query: query,
        language: language,
        page: page,
      );
      return Success(MovieMapper.mapToMovies(data));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes por pesquisa',
        error: e,
        stackTrace: s,
      );

      return Failure(
        DataException(message: 'Erro ao buscar filmes por pesquisa'),
      );
    }
  }
}
