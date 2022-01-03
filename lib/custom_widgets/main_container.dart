import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final String serviceName;

  const MainContainer({Key key, @required this.serviceName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          switch (serviceName) {
            case 'Popular':
              {
                Navigator.pushNamed(context, 'popular');
              }
              break;
            case 'Top Rated':
              {
                Navigator.pushNamed(context, 'top_rated');
              }
              break;
            case 'Now Playing':
              {
                Navigator.pushNamed(context, 'now_playing');
              }
              break;
            case 'Trending':
              {
                Navigator.pushNamed(context, 'trending');
              }
              break;
          }
        },
        child: customContainer(serviceName, context));
  }

  Container customContainer(String serviceName, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10.00),
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(4, 4), // Shadow position
          ),
        ],
      ),
      child: Text(
        serviceName,
        style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
