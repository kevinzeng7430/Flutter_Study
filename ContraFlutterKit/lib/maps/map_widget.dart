import 'dart:async';

import 'package:contraflutterkit/login/contra_text.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  String distance;
  bool isDetail;

  MapWidget({super.key, required this.distance, required this.isDetail});

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
          shadows: [
            BoxShadow(
              color: wood_smoke,
              offset: Offset(0, 2),
            )
          ],
          color: white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              side: BorderSide(
                color: wood_smoke,
                width: 2,
              ))),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(4),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
          ),
          Positioned(
            right: 24,
            bottom: 24,
            child: Container(
              width: 64,
              padding: const EdgeInsets.all(4),
              height: 64,
              decoration: const BoxDecoration(
                  color: wood_smoke,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: const Column(
                children: <Widget>[
                  ContraText(
                    alignment: Alignment.center,
                    text: "1.5",
                    size: 22,
                    color: white,
                    weight: FontWeight.bold,
                  ),
                  ContraText(
                    alignment: Alignment.center,
                    text: "Kms",
                    size: 15,
                    color: white,
                    weight: FontWeight.bold,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
