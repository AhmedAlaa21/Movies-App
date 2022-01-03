import 'dart:async';

import 'package:tmdb_api/tmdb_api.dart';

class Data {
  // ignore: constant_identifier_names
  static const String api_key = 'abf4d6d4d362f01bd3f7f5afaec8b90f';

  // ignore: constant_identifier_names
  static const String read_access_token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYmY0ZDZkNGQzNjJmMDFiZDNmN2Y1YWZhZWM4YjkwZiIsInN1YiI6IjVkMWJlOGM5NmUwZDcyMDAxMDA2ZGRmYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.'
      'cDeLfi0dQ9bolaHhJWC3P41WS2feeiy0kNPDod2-x5c';

  Future tmdbServices(String serviceName) async {
    List service = [];
    String results = 'results';
    TMDB tmdb = TMDB(
      ApiKeys(api_key, read_access_token),
      logConfig: ConfigLogger(
        showErrorLogs: true,
        showLogs: true,
      ),
    );
    switch (serviceName) {
      case 'popular':
        {
          Map popularResults = await tmdb.v3.movies.getPouplar();
          service = popularResults[results];
          return service;
        }
      case 'now playing':
        {
          Map nowPlayingResults = await tmdb.v3.movies.getNowPlaying();
          service = nowPlayingResults[results];
          return service;
        }
      case 'top rated':
        {
          Map topRatedResults = await tmdb.v3.movies.getTopRated();
          service = topRatedResults[results];
          return service;
        }
      case 'upcoming':
        {
          Map popularResults = await tmdb.v3.movies.getUpcoming();
          service = popularResults[results];
          return service;
        }
      case 'trending':
        {
          Map trendingResults = await tmdb.v3.trending.getTrending();
          service = trendingResults[results];
          return service;
        }
    }
  }
}
