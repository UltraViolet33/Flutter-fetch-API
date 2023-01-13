import 'package:fetch_api_test/widgets/user_item.dart';
import 'package:flutter/material.dart';
import "package:fetch_api_test/models/user.dart";

class UserList extends StatelessWidget {
  final List<User>? users;

  const UserList({Key? key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users!.length,
        itemBuilder: (context, index) {
          return UserItem(user: users![index]);
        });
  }
}
