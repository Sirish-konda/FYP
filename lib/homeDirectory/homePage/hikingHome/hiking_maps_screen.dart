import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';

import '../../../constants/constant_colors.dart';

class HikingMapsScreen extends StatefulWidget {
  final GeoPoint mapsLocation;
  const HikingMapsScreen({super.key, required this.mapsLocation});

  @override
  State<HikingMapsScreen> createState() => _HikingMapsScreenState();
}

class _HikingMapsScreenState extends State<HikingMapsScreen> {
  final MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.kLightGreen,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Text(
          "Maps",
          style: TextStyle(
            fontSize: 25.sp,
            color: ConstantColors.kNeutralSkin,
          ),
        ),
      ),
      body: OSMFlutter(
        androidHotReloadSupport: true,
        trackMyPosition: true,
        controller: mapController,
        initZoom: 12,
        minZoomLevel: 5,
        maxZoomLevel: 19,
        stepZoom: 1.0,
        onMapIsReady: _onMapIsReady,
        onGeoPointClicked: _onGeoPointClicked,
        userLocationMarker: _buildUserLocationMarker(),
        markerOption: _buildMarkerOption(),
      ),
    );
  }

  Future<void> _onMapIsReady(bool isReady) async {
    if (isReady) {
      // Add the user location marker
      mapController.addMarker(widget.mapsLocation);

      // Get the user's current location
      try {
        var locationData = await Location().getLocation();
        var currentPosition = GeoPoint(
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
        );

        // Go to the user's current location
        mapController.goToLocation(currentPosition);
        await mapController.drawCircle(
          CircleOSM(
            key: "circle0",
            centerPoint: widget.mapsLocation,
            radius: 100.0,
            color: Colors.blue,
            strokeWidth: 3.0,
          ),
        );
      } catch (e) {
        // Handle exception
      }
    }
  }

  void _onGeoPointClicked(GeoPoint point) {
    // Handle geo point clicked
  }

  UserLocationMaker _buildUserLocationMarker() {
    return UserLocationMaker(
      personMarker: MarkerIcon(
        icon: Icon(
          Icons.location_history_rounded,
          color: ConstantColors.kLightGreen,
          size: 88.sp,
        ),
      ),
      directionArrowMarker: MarkerIcon(
        icon: Icon(
          Icons.double_arrow,
          size: 48.sp,
        ),
      ),
    );
  }

  MarkerOption _buildMarkerOption() {
    return MarkerOption(
      defaultMarker: MarkerIcon(
        icon: Icon(
          Icons.location_on,
          color: ConstantColors.kDarkGreen,
          size: 88.sp,
        ),
      ),
    );
  }
}
