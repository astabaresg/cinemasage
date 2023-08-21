import 'package:flutter/material.dart';

class CustomTitleHeader extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const CustomTitleHeader({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .titleLarge!
        .copyWith(fontWeight: FontWeight.bold);
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle,
            ),
          const Spacer(),
          if (subtitle != null)
            FilledButton.tonal(
                onPressed: () {},
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                child: Text(subtitle!))
        ],
      ),
    );
  }
}
