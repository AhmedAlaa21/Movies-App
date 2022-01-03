import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/custom_widgets/custom_appbar.dart';
import 'package:tmdb/data/data_getter.dart';
import 'package:tmdb/data/service_data_viewer.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Popular', context),
      body: GridDataViewer(Data().tmdbServices('popular')),
    );
  }
}
