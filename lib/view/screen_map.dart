import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:latlong2/latlong.dart';

class ScreenMap extends StatelessWidget {
  const ScreenMap({super.key, required this.latitude, required this.longitude});
  final double longitude;
  final double latitude;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: FlutterMap(
        mapController: MapController(),
        options: MapOptions(
          backgroundColor: Colors.black,
          onPointerHover: (event, point) {},
          initialCenter: LatLng(latitude, longitude),
          initialZoom: 10,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/anshif/clpdrdzyq00ck01r559ho22bz/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW5zaGlmIiwiYSI6ImNscGRvYXA5ZzB5NWIycXByMG45dG96NWEifQ.MVUgGae2CZMNzPcSDAONLg',
            additionalOptions: const {
              "accessToken":
                  'pk.eyJ1IjoiYW5zaGlmIiwiYSI6ImNscGRvYXA5ZzB5NWIycXByMG45dG96NWEifQ.MVUgGae2CZMNzPcSDAONLg',
              "id": "mapbox://styles/anshif/clpdrdzyq00ck01r559ho22bz"
            },
            // subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                  width: 20.0,
                  height: 20.0,
                  point: LatLng(latitude, longitude),
                  child: const Icon(
                    Icons.location_on,
                    color: CustomColors.mainColor,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}


// FlutterMap(
//         options: const MapOptions(
//           initialCenter: LatLng(51.509364, -0.128928),
//           initialZoom: 9.2,
//         ),
//         children: [
//           TileLayer(
//             urlTemplate:
//                 'https://api.mapbox.com/styles/v1/anshif/clpdpgsgw00c401pjgutmhb9y/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW5zaGlmIiwiYSI6ImNscGRvYXA5ZzB5NWIycXByMG45dG96NWEifQ.MVUgGae2CZMNzPcSDAONLg',
//             additionalOptions: const {
//               'accessToken':
//                   'pk.eyJ1IjoiYW5zaGlmIiwiYSI6ImNscGRvYXA5ZzB5NWIycXByMG45dG96NWEifQ.MVUgGae2CZMNzPcSDAONLg',
//               'id': 'mapbox.mapbox-streets-v8'
//             },
//           ),
//         ],
//       ),