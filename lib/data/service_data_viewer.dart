import 'package:flutter/material.dart';
import 'package:tmdb/main_pages/movie_details.dart';

import 'movie.dart';

class GridDataViewer extends StatefulWidget {
  final Future serviceName;

  const GridDataViewer(this.serviceName, {Key key}) : super(key: key);

  @override
  _GridDataViewerState createState() => _GridDataViewerState();
}

class _GridDataViewerState extends State<GridDataViewer> {
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
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.5,
              ),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                    decoration: BoxDecoration(
                      color: Colors.white,
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
            );
          }

          return const Center(
              child: CircularProgressIndicator(
            color: Colors.yellow,
          ));
        });
  }
}
