import 'dart:ui';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/material.dart';

class ShareXeMapScaffold extends StatelessWidget {
  const ShareXeMapScaffold({
    required this.mapLayer,
    required this.isPanelVisible,
    super.key,
    this.topOverlay,
    this.floatingButtons,
    this.isLoading = false,
    this.panelBuilder,
    this.onPanelClosed,
  });

  final Widget mapLayer;
  final Widget? topOverlay;
  final Widget? floatingButtons;
  final bool isLoading;

  final bool isPanelVisible;
  final Widget Function(ScrollController)? panelBuilder;
  final VoidCallback? onPanelClosed;

  @override
  Widget build(BuildContext context) {
    final double maxPanelHeight = MediaQuery.of(context).size.height * 0.6;
    final double targetMinHeight = isPanelVisible ? 220.0 : 0.0;

    return Scaffold(
      body: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: targetMinHeight),
        duration: const Duration(milliseconds: 300),
        builder: (context, animatedMinHeight, child) {
          return SlidingUpPanel(
            minHeight: animatedMinHeight,
            maxHeight: maxPanelHeight,
            color: Theme.of(context).cardColor,
            backdropEnabled: true,
            backdropOpacity: 0.3,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],

            onPanelClosed: onPanelClosed,

            panelBuilder: (ScrollController sc) {
              if (!isPanelVisible || panelBuilder == null) {
                return const SizedBox.shrink();
              }
              return panelBuilder!(sc);
            },

            body: Stack(
              children: [
                mapLayer,

                if (isLoading)
                  Positioned.fill(
                    child: AbsorbPointer(
                      child: Stack(
                        children: [
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            child: Container(
                              color: Colors.black.withValues(alpha: 0.1),
                            ),
                          ),
                          const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 4.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                SafeArea(
                  child: Stack(
                    children: [
                      if (topOverlay != null)
                        Positioned(
                          top: 16,
                          left: 16,
                          right: 16,
                          child: topOverlay!,
                        ),

                      if (floatingButtons != null)
                        Positioned(
                          bottom: isPanelVisible ? 240 : 20,
                          right: 16,
                          child: floatingButtons!,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
