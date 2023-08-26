import 'package:cinemasage/config/utils/human_formats.dart';
import 'package:flutter/material.dart';

class MovieRating extends StatelessWidget {
  final double rating;
  final double? popularity;
  const MovieRating({super.key, required this.rating, this.popularity});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Row(
      children: [
        Icon(
          Icons.star_half_outlined,
          color: Colors.yellow.shade800,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          HumanFormats.number(rating, 1),
          style: textStyles.bodyMedium?.copyWith(color: Colors.yellow.shade800),
        ),
        Visibility(
            visible: popularity != null,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  HumanFormats.number(popularity ?? 0.0),
                  style: textStyles.bodySmall,
                )
              ],
            )),
      ],
    );
  }
}
