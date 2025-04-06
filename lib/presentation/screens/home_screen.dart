import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindchain/data/models/query_model.dart';
import 'package:mindchain/data/models/user_stats.dart';
import 'package:mindchain/data/providers/user_provider.dart';
import 'package:mindchain/data/repositories/query_repository.dart';
import 'package:mindchain/presentation/widgets/button.dart';

final queryListProvider = FutureProvider<List<QueryModel>>((ref) async {
  final queryRepository = ref.watch(queryRepositoryProvider);
  return queryRepository.fetchQueries();
});

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  ColorScheme? colorScheme;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);
    final userStats = userState.userStats.toList();
    colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome, ${userState.username.split(" ").firstOrNull ?? "User"}!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  AdaptiveButton(
                    icon: Icons.add_rounded,
                    label: "New Query",
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildStatsGrid(userStats),
              const SizedBox(height: 20),
              const Text(
                'Query Analytics',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildAnalyticsCard(),
            ],
          ),
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
            childAspectRatio: 17 / 12,
          ),
          itemCount: userStats.length,
          itemBuilder: (context, index) {
            return _buildUserStatusCard(userStats[index], Icons.query_stats);
          },
        );
      },
    );
  }

  Widget _buildUserStatusCard(UserStat userStat, IconData icon) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  userStat.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(icon, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              userStat.value.toString(),
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'View all ${userStat.title.toLowerCase()} queries',
              style: const TextStyle(color: Colors.blue),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme?.surface ?? Colors.grey,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Response Rate',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '50%',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('Average response time: 2.5 hours'),
          ],
        ),
      ),
    );
  }
}
