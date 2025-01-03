import 'package:cleva_test/domain/user_entitiy.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  final User user;

  const UserListItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text('Name: ${user.name}'),
        subtitle: Text('Street: ${user.address.street}'),
      ),
    );
  }
}
