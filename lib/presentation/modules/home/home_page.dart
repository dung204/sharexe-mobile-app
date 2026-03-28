import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';
import 'package:sharexe/presentation/modules/home/cubit/home_cubit.dart';
import 'package:sharexe/presentation/modules/home/cubit/home_state.dart';
import 'package:sharexe/presentation/modules/home/widgets/home_search_bar.dart';
import 'package:sharexe/presentation/shared/map/hub_info_panel.dart';
import 'package:sharexe/presentation/shared/map/sharexe_map.dart';
import 'package:sharexe/presentation/shared/map/sharexe_map_scaffold.dart';
import 'package:sharexe/presentation/shared/user_avatar.dart';
import 'package:sharexe/presentation/shared/user_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final MapController _mapController = MapController();
  final LatLng _defaultLocation = const LatLng(21.028511, 105.804817);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HubEntity? _lastViewedHub;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (previous, current) {
        final isInitialLoad =
            previous.maybeWhen(loading: () => true, orElse: () => false) &&
            current.maybeWhen(
              ready: (_, _, _, _, _, _) => true,
              orElse: () => false,
            );

        final isHubSelectionChanged = previous.maybeMap(
          ready: (prevReady) => current.maybeMap(
            ready: (currReady) =>
                prevReady.selectedHub != currReady.selectedHub &&
                currReady.selectedHub != null,
            orElse: () => false,
          ),
          orElse: () => false,
        );

        return isInitialLoad || isHubSelectionChanged;
      },
      listener: (context, state) {
        state.mapOrNull(
          ready: (readyState) {
            if (readyState.selectedHub != null) {
              _animatedMapMove(readyState.selectedHub!.latLng, 15.0);
              return;
            }

            _animatedMapMove(readyState.currentLocation, 15.0);
          },
        );
      },
      builder: (context, state) {
        bool isLoading = false;
        LatLng? mapLocation;
        List<HubEntity> mapHubs = [];
        HubEntity? selectedHub;

        state.map(
          initial: (_) => isLoading = true,
          loading: (_) => isLoading = true,
          error: (_) => mapLocation = _defaultLocation,
          ready: (readyState) {
            mapLocation = readyState.currentLocation;
            mapHubs = readyState.hubs;
            selectedHub = readyState.selectedHub;
          },
        );

        if (selectedHub != null) {
          _lastViewedHub = selectedHub;
        }

        return Scaffold(
          key: _scaffoldKey,
          drawer: const UserDrawer(),
          body: ShareXeMapScaffold(
            isLoading: isLoading,

            mapLayer: ShareXeMap(
              mapController: _mapController,
              currentLocation: mapLocation ?? _defaultLocation,
              isFakeLocation: mapLocation == null,
              hubs: mapHubs,
              onHubTapped: (hub) {
                context.read<HomeCubit>().selectHub(hub);
              },
            ),

            topOverlay: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserAvatar(
                  onTap: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  borderWidth: 2.0,
                  borderColor: colorScheme.primary,
                  hasShadow: true,
                ),
                const SizedBox(width: 12),

                const Expanded(child: HomeSearchBar()),
              ],
            ),

            floatingButtons: FloatingActionButton(
              backgroundColor: colorScheme.surface,
              elevation: 4,
              shape: const CircleBorder(),
              enableFeedback: true,
              onPressed: () {
                final currentState = context.read<HomeCubit>().state;
                currentState.mapOrNull(
                  ready: (readyState) =>
                      _animatedMapMove(readyState.currentLocation, 15.0),
                );
              },
              child: Icon(Icons.my_location, color: colorScheme.onSurface),
            ),

            isPanelVisible: selectedHub != null,
            onPanelClosed: () {
              // Khi user tự lấy tay vuốt panel xuống đáy -> Xoá hub đã chọn
              context.read<HomeCubit>().clearSelectedHub();
            },
            panelBuilder: (scrollController) {
              if (_lastViewedHub == null) return const SizedBox.shrink();

              return HubInfoPanel(
                hub: selectedHub!,
                scrollController: scrollController, // Truyền controller vào
                onClose: () {
                  context.read<HomeCubit>().clearSelectedHub();
                },
              );
            },
          ),
        );
      },
    );
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    final latTween = Tween<double>(
      begin: _mapController.camera.center.latitude,
      end: destLocation.latitude,
    );
    final lngTween = Tween<double>(
      begin: _mapController.camera.center.longitude,
      end: destLocation.longitude,
    );
    final zoomTween = Tween<double>(
      begin: _mapController.camera.zoom,
      end: destZoom,
    );

    final controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    final Animation<double> animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );

    controller.addListener(() {
      _mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }
}
