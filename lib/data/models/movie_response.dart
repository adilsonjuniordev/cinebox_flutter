import 'package:cinebox_flutter/data/models/movie_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  final int page;
  final int? totalResults;
  final int? totalPages;
  final List<MovieItem> results;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  new({
    required this.page,
    required this.results,
    this.totalPages,
    this.totalResults,
  });

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
