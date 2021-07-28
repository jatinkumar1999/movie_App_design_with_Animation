import 'package:flutter/material.dart';
import 'package:movie_app_design/data.dart';
import 'package:movie_app_design/modal/movies.dart';

class BackGroundImage extends StatefulWidget {
  final PageController pageController;
  const BackGroundImage({Key key, this.pageController}) : super(key: key);

  @override
  _BackGroundImageState createState() => _BackGroundImageState();
}

class _BackGroundImageState extends State<BackGroundImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            controller: widget.pageController,
            physics: const NeverScrollableScrollPhysics(),
            reverse: true,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return buildBackGroundImage(movie);
            }));
  }

  buildBackGroundImage(Movie movie) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            movie.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black38,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 0.75],
            ),
          ),
        ),
      ],
    );
  }
}
