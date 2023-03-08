import 'package:flutter/material.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  @override
  Widget build(BuildContext context) {
    // MapController controller = MapController.withPosition(
    //   initPosition: GeoPoint(
    //     latitude: 47.4358055,
    //     longitude: 8.4737324,
    //   ),
    // );

    return Scaffold(
      body: Container(
          // child: OSMFlutter(
          //   controller: controller,
          //   trackMyPosition: false,
          //   initZoom: 12,
          //   minZoomLevel: 8,
          //   maxZoomLevel: 14,
          //   stepZoom: 1.0,
          //   userLocationMarker: UserLocationMaker(
          //     personMarker: MarkerIcon(
          //       icon: Icon(
          //         Icons.location_history_rounded,
          //         color: Colors.red,
          //         size: 48,
          //       ),
          //     ),
          //     directionArrowMarker: MarkerIcon(
          //       icon: Icon(
          //         Icons.double_arrow,
          //         size: 48,
          //       ),
          //     ),
          //   ),
          //   roadConfiguration: RoadOption(
          //     roadColor: Colors.yellowAccent,
          //   ),
          //   markerOption: MarkerOption(
          //       defaultMarker: MarkerIcon(
          //     icon: Icon(
          //       Icons.person_pin_circle,
          //       color: Colors.blue,
          //       size: 56,
          //     ),
          //   )),
          // ),
          ),
    );
  }
}
