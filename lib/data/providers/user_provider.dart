import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindchain/data/models/user_model.dart';

final userProvider = Provider<UserModel>((ref) {
  return UserModel(
    uid: "uid",
    username: "Rahul Something",
    email: "rahul@iiit.ac.in",
  );
});
