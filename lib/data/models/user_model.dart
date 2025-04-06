import 'package:mindchain/data/models/user_stats.dart';

class UserModel {
  final String uid;
  final String username;
  final String email;
  final UserStats userStats;
  final double responseRate;
  final double responseTime;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    this.userStats = const UserStats(),
    this.responseRate = 0,
    this.responseTime = 0,
  });
}
