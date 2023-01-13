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
          return Container(
              padding: const EdgeInsets.all(2),
              height: 140,
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(users![index].name),
                    Text(users![index].username),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () => {},
                      child: const Text("see more"),
                    )
                    //   onPressed: (() => Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const SecondRoute()),
                    //       )),
                    //   child: const Text("See more"),
                    // )
                  ],
                ),
              ));
        });
  }
}
