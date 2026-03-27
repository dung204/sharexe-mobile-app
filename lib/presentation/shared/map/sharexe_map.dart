import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';
import 'package:sharexe/domain/entities/route_entity.dart';
import 'package:sharexe/presentation/shared/map/current_location_pin.dart';
import 'package:sharexe/presentation/shared/map/hub_pin.dart';

class ShareXeMap extends StatelessWidget {
  const ShareXeMap({
    required this.mapController,
    required this.currentLocation,
    super.key,
    this.isFakeLocation = false,
    this.hubs = const [],
    this.startHub,
    this.endHub,
    this.route,
    this.onHubTapped,
  });

  final MapController mapController;
  final LatLng currentLocation;
  final bool isFakeLocation;
  final List<HubEntity> hubs;
  final HubEntity? startHub;
  final HubEntity? endHub;
  final RouteEntity? route;
  final Function(HubEntity)? onHubTapped;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: currentLocation,
        initialZoom: isFakeLocation ? 10.0 : 15.0,
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c', 'd'],
          userAgentPackageName: 'com.sharexe.app',
          keepBuffer: 10,
        ),

        if (route != null)
          PolylineLayer(
            polylines: [
              Polyline(
                points: route!.points,
                strokeWidth: 5.0,
                color: Colors.blue,
              ),
            ],
          ),

        MarkerLayer(
          markers: [
            if (!isFakeLocation)
              Marker(
                point: currentLocation,
                width: 120,
                height: 120,
                rotate: true,
                alignment: Alignment.center,
                child: const CurrentLocationPin(),
              ),

            ...hubs.map((hub) {
              return Marker(
                point: hub.latLng,
                width: 50,
                height: 50,
                rotate: true,
                alignment: Alignment.topCenter,
                child: HubPin(
                  isStart: hub.id == startHub?.id,
                  isEnd: hub.id == endHub?.id,
                  onTap: () {
                    if (onHubTapped != null) {
                      onHubTapped!(hub);
                    }
                  },
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
