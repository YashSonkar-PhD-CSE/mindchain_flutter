import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindchain/data/models/query_model.dart';
import 'package:mindchain/data/models/user_stats.dart';
import 'package:mindchain/data/providers/user_provider.dart';
import 'package:mindchain/data/repositories/query_repository.dart';
import 'package:mindchain/presentation/widgets/user_stat_card.dart';
import 'package:mindchain/presentation/widgets/user_stats_grid.dart';

final queryListProvider = FutureProvider<List<QueryModel>>((ref) async {
  final queryRepository = ref.watch(queryRepositoryProvider);
  return queryRepository.fetchQueries();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);
    final userStats = userState.userStats.toList();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, ${userState.username.split(" ").firstOrNull ?? "User"}!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // SizedBox(height: 200.0, child: UserStatsGrid()),
            _buildStatsGrid(userStats),
            const SizedBox(height: 20),
            // Expanded(child: _buildQueryList(queryState)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsGrid(List<UserStat> userStats) {
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

  Widget _buildStatsCards(UserStats userStats) {
    return SizedBox(
      height: 140.0,
      width: double.maxFinite,
      child: GridView.count(
        crossAxisCount: 1,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        childAspectRatio: 0.75,
        children: [
          UserStatCard(userStat: userStats.pendingQuery),
          UserStatCard(userStat: userStats.activeChats),
          UserStatCard(userStat: userStats.matching),
          UserStatCard(userStat: userStats.resolved),
        ],
      ),
    );
  }

  Widget _buildQueryList(AsyncValue<List<QueryModel>> queryState) {
    return queryState.when(
      data:
          (queries) => ListView.builder(
            itemCount: queries.length,
            itemBuilder: (context, index) {
              final query = queries[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: ListTile(
                  title: Text(query.title),
                  subtitle: Text("Status: ${query.status}"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to Query Details
                  },
                ),
              );
            },
          ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text("Error: $error")),
    );
  }
}
