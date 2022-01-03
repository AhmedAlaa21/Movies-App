import 'dart:core';

class Movie {
  Movie(
      {this.id,
      this.original_title,
      this.original_language,
      this.poster_path,
      this.runtime,
      this.backdrop_path,
      this.release_date,
      this.index,
      this.overview,
      this.title,
      this.vote_average});

  int id;
  String index;
  String original_title;
  String original_language;
  String poster_path;
  String runtime;
  String backdrop_path;
  String release_date;
  String overview;
  String title;
  dynamic vote_average;
}
