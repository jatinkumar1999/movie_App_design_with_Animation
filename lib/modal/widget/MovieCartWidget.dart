import 'package:flutter/material.dart';
import 'package:movie_app_design/data.dart';

import 'package:movie_app_design/modal/movies.dart';

class MovieCardWidget extends StatefulWidget {
  final Movie movies;
  const MovieCardWidget({Key key, this.movies}) : super(key: key);

  @override
  State<MovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
          children: [
            Expanded(
              child: buildImage(widget.movies),
            ),
            const SizedBox(height: 5),
            Text(widget.movies.movieName),
            buildgenres(widget.movies),
            const SizedBox(height: 4),
            buildRadting(widget.movies),
            const SizedBox(height: 8),
            const Text(
              "...",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  buildRadting(Movie movies) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          movies.rating.toStringAsFixed(1),
        ),
        const SizedBox(width: 6),
        ...List.generate(
          movies.stars,
          (index) => const Icon(
            Icons.star,
            color: Colors.orange,
            size: 15,
          ),
        ),
      ],
    );
  }

  buildgenres(Movie movies) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: movies.genres
          .map(
            (genre) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey[400],
                  ),
                ),
                padding: const EdgeInsets.all(5),
                child: Text(
                  genre,
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  buildImage(Movie movies) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          movies.imageUrl,
          fit: BoxFit.cover,
        ));
  }
}
