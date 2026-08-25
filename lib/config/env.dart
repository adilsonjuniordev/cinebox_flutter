import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'GOOGLE_API_KEY_WEB', obfuscate: true)
  static final String googleApiKeyWeb = _Env.googleApiKeyWeb;

  @EnviedField(varName: 'GOOGLE_API_KEY_IOS', obfuscate: true)
  static final String googleApiKeyIos = _Env.googleApiKeyIos;

  @EnviedField(varName: 'THE_MOVIE_DB_API_KEY', obfuscate: true)
  static final String theMovieDbApiKey = _Env.theMovieDbApiKey;

  @EnviedField(varName: 'BACKEND_BASE_URL')
  static const String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'TMDB_BASE_URL')
  static const String tmdbBaseUrl = _Env.tmdbBaseUrl;
}
