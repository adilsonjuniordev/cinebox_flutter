import 'package:json_annotation/json_annotation.dart';

part 'genre_response.g.dart';

@JsonSerializable()
class GenreResponse {
  final List<GenreItem> genres;

  new({required this.genres});

  factory GenreResponse.fromJson(Map<String, dynamic> json) {
    return _$GenreResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GenreResponseToJson(this);
  }
}

@JsonSerializable()
class GenreItem {
  final int id;
  final String name;

  GenreItem({required this.id, required this.name});

  factory GenreItem.fromJson(Map<String, dynamic> json) {
    return _$GenreItemFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GenreItemToJson(this);
  }
}
