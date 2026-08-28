import 'dart:developer';

import 'package:cinebox_flutter/core/result/result.dart';
import 'package:cinebox_flutter/data/exceptions/data_exception.dart';
import 'package:cinebox_flutter/data/mappers/movie_mapper.dart';
import 'package:cinebox_flutter/data/services/tmdb/tmdb_service.dart';

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
}
