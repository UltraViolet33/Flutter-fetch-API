import 'package:fetch_api_test/models/user.dart';
import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  const UserData({Key? key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Column(
        children: [
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text("User data"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID: ${user.id}'),
              Text('Username : ${user.username}'),
              Text('Name : ${user.name}'),
              Text('Email : ${user.email}'),
              Text('Phone : ${user.phone}'),
              Text('Website : ${user.website}'),
            ],
          )
        ],
      ),
    );
  }
}
