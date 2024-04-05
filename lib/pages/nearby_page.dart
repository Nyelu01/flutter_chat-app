import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/toolbar.dart';
import 'package:flutter_chat_app/config/app_strings.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class NearbyPage extends StatelessWidget {
  const NearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(title: AppStrings.nearby),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              // ignore: deprecated_member_use
              center: LatLng(34.8924826, -6.3728253),
              // ignore: deprecated_member_use
              zoom: 10,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                // Plenty of other options available!
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 100,
                    point: LatLng(34.8924826, -6.3728253),
                    builder: (context) {
                      return Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                )),
                            child: Text(
                              "hello",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
