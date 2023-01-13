import 'package:fetch_api_test/models/user.dart';
import 'package:flutter/material.dart';

class UserProfil extends StatelessWidget {
  const UserProfil({Key? key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "User profil",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("User profil"),
          ),
          body: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Column(
                      children: [
                        Text("User data"),
                        Text('ID: ${user.id}'),
                        Text('Username : ${user.username}'),
                        Text('Name : ${user.name}'),
                        Text('Email : ${user.email}'),
                        Text('Phone : ${user.phone}'),
                        Text('Website : ${user.website}'),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
