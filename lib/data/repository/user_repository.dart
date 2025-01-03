import 'package:cleva_test/data/repository/user_repositoy_u.dart';
import 'package:cleva_test/data/user_data.dart';
import 'package:cleva_test/domain/user_entitiy.dart';

class UserRepoImpl implements UserRepoU {
  final UserData dataSource;

  UserRepoImpl({required this.dataSource});

  @override
  Future<List<User>> getUsers() async {
    return await dataSource.getUsers();
  }
}
