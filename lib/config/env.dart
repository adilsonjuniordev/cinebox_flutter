import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'GOOGLE_API_KEYS', obfuscate: true)
  static final String googleApiKeys = _Env.googleApiKeys;

  @EnviedField(varName: 'THE_MOVIE_DB_API_KEY', obfuscate: true)
  static final String theMovieDbApiKey = _Env.theMovieDbApiKey;

  @EnviedField(varName: 'BACKEND_BASE_URL')
  static const String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'TMDB_BASE_URL')
  static const String tmdbBaseUrl = _Env.tmdbBaseUrl;
}
