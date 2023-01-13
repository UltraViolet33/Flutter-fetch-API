import 'package:fetch_api_test/models/user.dart';
import 'package:fetch_api_test/user_profil.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  const UserItem({Key? key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        height: 140,
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(user.name),
              Text(user.username),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserProfil(user: user)),
                    )),
                child: const Text("See more"),
              )
            ],
          ),
        ));
  }
}
