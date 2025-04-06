class QueryModel {
  final String id;
  final String title;
  final String status;
  final QueryPriority priority;
  final String matchStatus;
  final String tag;
  final String timestamp;
  QueryModel({
    required this.id,
    required this.title,
    required this.status,
    required this.priority,
    required this.matchStatus,
    required this.tag,
    required this.timestamp,
  });

  factory QueryModel.fromJson(Map<String, dynamic> json) {
    String id = json["id"] as String;
    String title = json["title"] as String;
    String status = json["status"] as String;
    QueryPriority priority = QueryPriority.medium;
    String matchStatus = json["matchStatus"] as String;
    String tag = json["tag"] as String;
    String timestamp = json["timestamp"] as String;
    return QueryModel(
      id: id,
      title: title,
      status: status,
      priority: priority,
      matchStatus: matchStatus,
      tag: tag,
      timestamp: timestamp,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'status': status};
  }

  QueryPriority fromString(String priority) {
    return QueryPriority.values.firstWhere(
      (e) => e.toString().split('.')[1].toLowerCase() == priority.toLowerCase(),
    );
  }
}

enum QueryPriority { low, medium, high }
