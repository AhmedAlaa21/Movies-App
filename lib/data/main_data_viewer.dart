import 'package:flutter/material.dart';
import 'package:tmdb/data/data_getter.dart';
import 'package:tmdb/main_pages/movie_details.dart';

import 'movie.dart';
class DataViewer extends StatefulWidget {
  DataViewer(this.serviceName, {Key key}) : super(key: key);
  Future serviceName;
  @override
  _DataViewerState createState() => _DataViewerState();
}

class _DataViewerState extends State<DataViewer> {

  @override
  Widget build(BuildContext context) {
    return _buildListOfMovies(widget.serviceName);
  }
  FutureBuilder _buildListOfMovies(Function) {
    Movie movie;
    return FutureBuilder(
        future: Function,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .4,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                primary: false,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      var data = snapshot.data[index];
                      movie = Movie(
                        backdrop_path: data['backdrop_path'],
                        id: data['id'],
                        original_language: data['original_language'],
                        original_title: data['original_title'],
                        runtime: data['runtime'],
                        release_date: data['release_date'],
                        index: '{$index}',
                        overview: data['overview'],
                        title: data['title'],
                        vote_average: data['vote_average'],
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetails(movie)));
                    },
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 0.0,
                      ),
                      height: MediaQuery.of(context).size.height * .7,
                      width: MediaQuery.of(context).size.width * .58,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500/${snapshot.data[index]['poster_path']}',
                            )),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
