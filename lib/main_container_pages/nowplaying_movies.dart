import 'package:flutter/material.dart';
import 'package:tmdb/data/data_getter.dart';
import 'package:tmdb/data/service_data_viewer.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridDataViewer(Data().tmdbServices('now playing')),
    );
  }
}
