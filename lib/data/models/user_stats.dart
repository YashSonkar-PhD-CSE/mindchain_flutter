class UserStats {
  final UserStat pendingQuery;
  final UserStat activeChats;
  final UserStat matching;
  final UserStat resolved;

  const UserStats({
    this.pendingQuery = const UserStat(
      title: "Pending",
      value: 0,
      description: "All Pending queries",
    ),
    this.activeChats = const UserStat(
      title: "Active Chats",
      value: 0,
      description: "Active Chats",
    ),
    this.matching = const UserStat(
      title: "Matching",
      value: 0,
      description: "Matching Queries",
    ),
    this.resolved = const UserStat(
      title: "Resolved",
      value: 0,
      description: "Resolved Queries",
    ),
  });

  List<UserStat> toList() {
    return <UserStat>[pendingQuery, activeChats, matching, resolved];
  }
}

class UserStat {
  final String title;
  final int value;
  final String description;

  const UserStat({
    required this.title,
    this.value = 0,
    required this.description,
  });
}
