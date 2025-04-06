import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindchain/data/models/query_model.dart';

class QueryRepository {
  Future<List<QueryModel>> fetchQueries() async {
    await Future.delayed(
      const Duration(seconds: 2),
    ); // Simulating network delay

    return [
      QueryModel(
        id: "1",
        title: "Issue with Login",
        status: "Resolved",
        priority: QueryPriority.low,
        matchStatus: "Pending",
        tag: "Academics",
        timestamp: "",
      ),
      QueryModel(
        id: "2",
        title: "Payment Not Processing",
        status: "Pending",
        priority: QueryPriority.low,
        matchStatus: "Matched",
        tag: "Technology",
        timestamp: "",
      ),
      QueryModel(
        id: "3",
        title: "Feature Request",
        status: "Resolved",
        priority: QueryPriority.low,
        matchStatus: "Matched",
        tag: "Hostel",
        timestamp: "",
      ),
    ];
  }
}

// Riverpod provider for the repository
final queryRepositoryProvider = Provider<QueryRepository>((ref) {
  return QueryRepository();
});
