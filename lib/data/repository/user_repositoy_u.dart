import 'package:cleva_test/domain/user_entitiy.dart';

abstract class UserRepoU {
  Future<List<User>> getUsers();
}
