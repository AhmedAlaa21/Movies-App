import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tmdb/custom_widgets/main_container.dart';
import 'package:tmdb/data/data_getter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:tmdb/data/main_data_viewer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Data _data = Data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('MOVIE GEEKS'),
        primary: true,
        elevation: 3,
        titleTextStyle: const TextStyle(
          fontStyle: FontStyle.normal,
          color: Colors.yellow,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        shadowColor: Colors.yellow,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          mainContainer(context),
          headline(context, 'UPCOMING MOVIES'),
          DataViewer(_data.tmdbServices('upcoming')),
          headline(context, 'TV EPISODES'),
          DataViewer(_data.tmdbServices('popular')),
          headline(context, 'Trending'),
          DataViewer(_data.tmdbServices('trending')),
          headline(context, 'Now playing'),
          DataViewer(_data.tmdbServices('now playing')),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  SizedBox headline(BuildContext context, String text) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: buildAnimatedServiceTitle(context, text),
      ),
    );
  }

  Container mainContainer(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.all(4),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(child: MainContainer(serviceName: 'Popular')),
              Expanded(child: MainContainer(serviceName: 'Top Rated')),
            ],
          ),
          Row(
            children: const [
              Expanded(child: MainContainer(serviceName: 'Now Playing')),
              Expanded(child: MainContainer(serviceName: 'Trending')),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAnimatedServiceTitle(BuildContext context, String text) {
    return Container(
      alignment: Alignment.centerLeft,
      child: AnimatedTextKit(
        animatedTexts: [
          FlickerAnimatedText(
            text,
            textStyle: Theme.of(context).textTheme.headline1,
          ),
        ],
        isRepeatingAnimation: true,
        repeatForever: true,
        pause: const Duration(milliseconds: 1000),
        onTap: () {},
      ),
    );
  }
}
