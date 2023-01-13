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
           
              
            ),
          )),
    );
  }
}
