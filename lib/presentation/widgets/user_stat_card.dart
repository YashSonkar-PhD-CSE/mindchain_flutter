import 'package:flutter/material.dart';
import 'package:mindchain/data/models/user_stats.dart';

class UserStatCard extends StatefulWidget {
  final UserStat userStat;
  final Icon? icon;
  const UserStatCard({super.key, required this.userStat, this.icon});

  @override
  State<UserStatCard> createState() => _UserStatCardState();
}

class _UserStatCardState extends State<UserStatCard> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(8.0),
      width: 342.0,
      child: InkWell(
        onHover: (value) => isHovering = value,
        child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                spreadRadius: 4.0,
                blurRadius: 4.0,
                color: colorScheme.onSurface.withAlpha(64),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.userStat.title, style: textTheme.bodySmall),
              Text(
                widget.userStat.value.toString(),
                style: textTheme.displayLarge,
              ),
              Text(widget.userStat.description, style: textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
