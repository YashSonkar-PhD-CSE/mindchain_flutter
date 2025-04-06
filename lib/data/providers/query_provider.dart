import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindchain/data/models/query_model.dart';

final queryProvider = Provider<QueryModel>((ref) {
  return QueryModel(
    id: "id",
    title: "title",
    status: "status",
    priority: QueryPriority.high,
    matchStatus: '',
    tag: '',
    timestamp: '',
  );
});
