import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/main_container_pages/nowplaying_movies.dart';
import 'package:tmdb/main_container_pages/popular_movies.dart';
import 'package:tmdb/main_container_pages/toprated_movies.dart';
import 'package:tmdb/main_container_pages/trending_movies.dart';

import 'main_pages/home_page.dart';
import 'main_pages/intro_page.dart';

/*TODO
1- design grid view for services.
2- add drawer and put favourite list, user account info.
3- add firebase to save user`s info.
4-optional: add features to the app.
*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Quicksand',
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
          headline1: TextStyle(
            fontSize: 35,
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
            headline2: TextStyle(
              fontSize: 30,
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
        ),
        brightness: Brightness.dark,
        primaryColor: Colors.green,
      ),
      title: 'Movies Geeks',
      initialRoute: 'intro',
      routes: {
        'intro': (context) => const IntroPage(),
        'home': (context) => const HomePage(),
        'popular':(context) => const PopularMovies(),
        'top_rated':(context) => const TopRatedMovies(),
        'now_playing': (context) => const NowPlayingMovies(),
        'trending': (context) => const TrendingMovies(),
      },
    );
  }
}
