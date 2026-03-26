import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';
import 'package:sharexe/domain/entities/route_entity.dart';
import 'package:sharexe/presentation/modules/home/cubit/home_cubit.dart';
import 'package:sharexe/presentation/modules/home/cubit/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MapController _mapController = MapController();

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listenWhen: (previous, current) {
          final prevReady = previous.mapOrNull(ready: (s) => s);
          final currReady = current.mapOrNull(ready: (s) => s);

          if (prevReady != null && currReady != null) {
            return prevReady.currentLocation != currReady.currentLocation;
          }

          return false;
        },
        listener: (context, state) {
          state.mapOrNull(
            ready: (readyState) {
              _mapController.move(readyState.currentLocation, 15.0);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text('Lỗi: $msg')),
            ready: (currentLoc, hubs, startHub, endHub, route) {
              return _buildMapAndOverlay(
                context,
                currentLoc,
                hubs,
                startHub,
                endHub,
                route,
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildMapAndOverlay(
    BuildContext context,
    LatLng currentLocation,
    List<HubEntity> hubs,
    HubEntity? startHub,
    HubEntity? endHub,
    RouteEntity? route,
  ) {
    return Stack(
      children: [
        // Background Map
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: currentLocation,
            initialZoom: 14.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.sharexe.app',
            ),

            if (route != null)
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: route.points,
                    strokeWidth: 5.0,
                    color: Colors.blue,
                  ),
                ],
              ),

            MarkerLayer(
              markers: [
                Marker(
                  point: currentLocation,
                  width: 40,
                  height: 40,
                  child: const Icon(
                    Icons.my_location,
                    color: Colors.blue, // In a real app use AppColors
                    size: 40,
                  ),
                ),

                ...hubs.map((hub) {
                  final isStart = hub.id == startHub?.id;
                  final isEnd = hub.id == endHub?.id;
                  return Marker(
                    point: hub.latLng,
                    width: 50,
                    height: 50,
                    child: GestureDetector(
                      onTap: () {
                        // TODO: call Cubit to assign start/end Hub
                      },
                      child: Icon(
                        Icons.location_on,
                        size: 40,
                        color: isStart
                            ? Colors.green
                            : (isEnd ? Colors.red : Colors.orange),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),

        Positioned(
          bottom: 180,
          right: 16,
          child: FloatingActionButton(
            heroTag: 'my_location_btn',
            backgroundColor: Theme.of(context).cardColor,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onPressed: () {
              context.read<HomeCubit>().refetchCurrentLocation();
            },
            child: Icon(
              Icons.my_location,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),

        // UI Overlays
        SafeArea(
          child: Column(
            children: [
              // Hamburger / Head Actions
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  children: [
                    FloatingActionButton.small(
                      heroTag: 'menu_btn',
                      backgroundColor: Theme.of(context).cardColor,
                      onPressed: () {
                        // Open drawer
                      },
                      child: const Icon(Icons.menu),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // "Where to?" Floating Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).hoverColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(width: 8),
                            Text(
                              'Where to?',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Saved Places List
                      _buildSavedPlaceRow(context, Icons.home, 'Home'),
                      const Divider(),
                      _buildSavedPlaceRow(context, Icons.work, 'Work'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSavedPlaceRow(
    BuildContext context,
    IconData icon,
    String title,
  ) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Icon(icon, color: Theme.of(context).primaryColor),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
