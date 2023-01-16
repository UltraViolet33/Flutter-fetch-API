import 'package:fetch_api_test/models/company.dart';
import 'package:flutter/material.dart';

class CompanyData extends StatelessWidget {
  const CompanyData({Key? key, required this.company});

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.redAccent)),
      child: Column(
        children: [
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text("Company data"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name : ${company.name}'),
              Text('CatchPhrase : ${company.catchPhrase}'),
              Text('BS: ${company.bs}'),
            ],
          )
        ],
      ),
    );
  }
}
