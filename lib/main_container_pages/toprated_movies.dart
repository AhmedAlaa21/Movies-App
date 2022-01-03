import 'package:flutter/material.dart';
import 'package:tmdb/custom_widgets/custom_appbar.dart';
import 'package:tmdb/data/data_getter.dart';
import 'package:tmdb/data/service_data_viewer.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Top Rated', context),
      body: GridDataViewer(Data().tmdbServices('top rated')),
    );
  }
}
