import 'package:fetch_api_test/models/geo.dart';
import 'package:flutter/material.dart';

class GeoData extends StatelessWidget {
  const GeoData({Key? key, required this.geo});

  final Geo geo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.greenAccent)),
      child: Column(
        children: [
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text("Geo data"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Latitude: ${geo.lat}'),
              Text('Longitude code: ${geo.lng}'),
            ],
          )
        ],
      ),
    );
  }
}
