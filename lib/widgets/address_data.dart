import 'package:fetch_api_test/models/adress.dart';
import 'package:fetch_api_test/widgets/geo_data.dart';
import 'package:flutter/material.dart';

class AdressData extends StatelessWidget {
  const AdressData({Key? key, required this.address});

  final Address address;

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
              const Text("Address data"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('City: ${address.city}'),
              Text('Zip code: ${address.zipcode}'),
              Text('Streey : ${address.street}'),
              Text('Suite : ${address.suite}'),
              GeoData(geo: address.geo)
            ],
          )
        ],
      ),
    );
  }
}
