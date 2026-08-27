// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final List<int> genreIds;
  final bool isFavorite;
  final double voteAverage;
  final String? posterPath;
  final String? backdropPath;
  final String? releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.genreIds,
    required this.voteAverage,
    this.isFavorite = false,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
  });

  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    List<int>? genreIds,
    bool? isFavorite,
    double? voteAverage,
    ValueGetter<String?>? posterPath,
    ValueGetter<String?>? backdropPath,
    ValueGetter<String?>? releaseDate,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      genreIds: genreIds ?? this.genreIds,
      isFavorite: isFavorite ?? this.isFavorite,
      voteAverage: voteAverage ?? this.voteAverage,
      posterPath: posterPath != null ? posterPath() : this.posterPath,
      backdropPath: backdropPath != null ? backdropPath() : this.backdropPath,
      releaseDate: releaseDate != null ? releaseDate() : this.releaseDate,
    );
  }
}
