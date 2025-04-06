import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindchain/data/providers/user_provider.dart';
import 'package:mindchain/presentation/widgets/user_stat_card.dart';

class UserStatsGrid extends ConsumerStatefulWidget {
  const UserStatsGrid({super.key});

  @override
  ConsumerState<UserStatsGrid> createState() => _UserStatsGridState();
}

class _UserStatsGridState extends ConsumerState<UserStatsGrid> {
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userProvider);
    final userStats = userState.userStats.toList();
    return LayoutBuilder(
      builder: (context, constraints) {
        int columns = (constraints.maxWidth / 200).floor();
        columns = columns > 0 ? columns : 1; // Ensure at least 1 column
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 4 / 3,
          ),
          itemCount: userStats.length,
          itemBuilder: (context, index) {
            return UserStatCard(userStat: userStats[index]);
          },
        );
      },
    );
  }
}
