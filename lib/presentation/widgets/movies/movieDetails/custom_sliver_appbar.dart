import 'package:cinemasage/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final Movie movie;
  const CustomSliverAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      // title: Text(movie.title),

      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
              ),
            ),
            const _CustomGrandient(
                beginAligment: Alignment.topCenter,
                endAligment: Alignment.bottomCenter,
                stops: [0.7, 1.0],
                colors: [Colors.transparent, Colors.black87]),
            const _CustomGrandient(
                beginAligment: Alignment.topLeft,
                endAligment: Alignment.bottomLeft,
                stops: [
                  0.0,
                  0.3
                ],
                colors: [
                  Colors.black87,
                  Colors.transparent,
                ]),
          ],
        ),
      ),
    );
  }
}

class _CustomGrandient extends StatelessWidget {
  final AlignmentGeometry beginAligment;
  final AlignmentGeometry endAligment;
  final List<double> stops;
  final List<Color> colors;
  const _CustomGrandient(
      {required this.beginAligment,
      required this.endAligment,
      required this.stops,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: beginAligment,
                  end: endAligment,
                  stops: stops,
                  colors: colors))),
    );
  }
}
