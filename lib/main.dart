import 'dart:async';
import 'package:flutter/material.dart';
import "package:fetch_api_test/api.services.dart";
import "package:fetch_api_test/models/user.dart";
import "package:fetch_api_test/widgets/user_list.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    users = ApiServices().fetchUsers();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test fetch an API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Test fetch an API"),
        ),
        body: Center(
            child: FutureBuilder<List<User>>(
                future: users,
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);

                  return snapshot.hasData
                      ? UserList(users: snapshot.data)
                      : Center(child: CircularProgressIndicator());
                })),
      ),
    );
  }
}
