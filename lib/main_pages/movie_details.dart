import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/data/movie.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;

  const MovieDetails(this.movie);

  static const textStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  Color _iconColor = Colors.white;
  IconData _iconData = Icons.favorite_border_outlined;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildPoster(context),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  widget.movie.title ?? 'not available now',
                  style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 14.0,
                  ),
                  child: Text(
                    widget.movie.overview ?? 'Not added yet',
                    style: MovieDetails.textStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Release Date: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            widget.movie.release_date ?? 'not determined yet',
                            style: MovieDetails.textStyle,
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 33,
                        backgroundColor: const Color(0xfffcd12a),
                        child: Center(
                          child: widget.movie.vote_average != null
                              ? Text(
                                  '${widget.movie.vote_average}',
                                  style: MovieDetails.textStyle,
                                )
                              : const Text('no rate'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.movie.runtime != null
                            ? 'Runtime:\t\t\t ${widget.movie.runtime}'
                            : 'Runtime:\t\t\t not determined yet',
                        style: MovieDetails.textStyle,
                      ),
                      IconButton(
                        icon: Icon(
                          _iconData,
                          color: _iconColor,
                        ),
                        onPressed: () {
                          print(_isFavorite);
                          if (!_isFavorite) {
                            setState(() {
                              _iconColor = Colors.yellow;
                              _iconData = Icons.favorite;
                              _isFavorite = true;
                            });
                          } else {
                            setState(() {
                              _iconColor = Colors.white;
                              _iconData = Icons.favorite_border;
                              _isFavorite = false;
                            });
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(_isFavorite == true
                                  ? '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tAdded to your favourite list.'
                                  : '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tRemoved from your favourite list.'),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              backgroundColor: const Color(0xfffcd12a),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildPoster(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://image.tmdb.org/t/p/w500/${widget.movie.backdrop_path}',
          ),
          fit: BoxFit.fill,
        ),
        border: Border.all(
          width: 1,
        ),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(30.00),
          bottomLeft: Radius.circular(30.00),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(1, 1), // Shadow position
          ),
        ],
      ),
    );
  }
}
