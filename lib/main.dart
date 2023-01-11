import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<Person> personFromJson(String str) =>
    List<Person>.from(json.decode(str).map((x) => Person.fromJson(x)));

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load resources");
  }
}

Future<List<Person>> fetchPersons() async {
  final response = await http.get(Uri.parse(
      "https://c8ab-2a01-cb00-8a61-d100-484b-e5ca-90cb-6a8e.ngrok.io/profile?_page=1"));

  if (response.statusCode == 200) {
    // print(response.body);
    List<Person> persons = personFromJson(response.body);
    return persons;
  } else {
    throw Exception("Failed to load resources");
  }
}

class Person {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String gender;

  Person(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.gender});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        id: json["id"],
        firstname: json["first_name"],
        lastname: json["last_name"],
        email: json["email"],
        gender: json["gender"]);
  }

  // factory Person.fromJson(Map<String, dynamic> json) {
  //   return Person(userId: json["userId"], id: json["id"], title: json["title"]);
  // }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(userId: json["userId"], id: json["id"], title: json["title"]);
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;
  late Future<List<Person>> _persons;
  // List<Person> convertStringToPersons(String json) {
  //   dynamic jsonObject = jsonDecode(json);
  // }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    _persons = fetchPersons();
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
            child: FutureBuilder<List<Person>>(
                future: _persons,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          // return Text(snapshot.data?[index].firstname ?? "ok");

                          return Container(
                              padding: const EdgeInsets.all(2),
                              height: 140,
                              child: Card(
                                elevation: 5,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(snapshot.data![index].firstname),
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue),
                                      ),
                                      child: const Text("See more"),
                                      onPressed: (() => ""),
                                    )
                                  ],
                                ),
                              ));
                        });
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return CircularProgressIndicator();
                })),
      ),
    );
  }
}
