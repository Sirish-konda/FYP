import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/constant_colors.dart';

class TrekkingMapsScreen extends StatefulWidget {
  final GeoPoint mapsLocation;
  const TrekkingMapsScreen({super.key, required this.mapsLocation});

  @override
  State<TrekkingMapsScreen> createState() => _TrekkingMapsScreenState();
}

class _TrekkingMapsScreenState extends State<TrekkingMapsScreen> {
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
        markerOption: _buildMarkerOption(),
      ),
    );
  }

  Future<void> _onMapIsReady(bool isReady) async {
    if (isReady) {
      // Add the user location marker
      mapController.addMarker(widget.mapsLocation);

      // Go to the user's current location
      mapController.goToLocation(widget.mapsLocation);
      await mapController.drawCircle(
        CircleOSM(
          key: "circle0",
          centerPoint: widget.mapsLocation,
          radius: 100.0,
          color: Colors.blue,
          strokeWidth: 3.0,
        ),
      );
    }
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
