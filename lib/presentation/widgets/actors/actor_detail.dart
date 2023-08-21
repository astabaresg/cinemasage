import 'package:cinemasage/domain/entities/actor.dart';
import 'package:flutter/material.dart';

class ActorDetail extends StatelessWidget {
  final Actor actor;
  const ActorDetail({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(8),
      width: 135,
      child: Column(
        children: [
          //Actor photo
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: actor.haveProfilePath
                ? Image.network(
                    actor.profilePath,
                    height: 180,
                    width: 135,
                    fit: BoxFit.cover,
                  )
                : Image.asset(actor.profilePath,
                    height: 180, width: 135, fit: BoxFit.cover),
          ),
          const SizedBox(
            height: 5,
          ),
          // Actor info
          SizedBox(
            height: 85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  actor.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: textStyle.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  actor.character ?? '',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: textStyle.bodySmall!
                      .copyWith(overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
