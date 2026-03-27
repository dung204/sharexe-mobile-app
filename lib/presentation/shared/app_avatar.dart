import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.imageUrl,
    this.radius = 24.0,
    this.onTap,
    this.borderWidth = 0.0,
    this.borderColor,
    this.hasShadow = false,
    this.isLoading = false,
  });

  const AppAvatar.skeleton({
    super.key,
    this.radius = 24.0,
    this.borderWidth = 0.0,
    this.borderColor,
    this.hasShadow = false,
  }) : imageUrl = null,
       onTap = null,
       isLoading = true;

  final String? imageUrl;
  final double radius;
  final VoidCallback? onTap;

  final double borderWidth;
  final Color? borderColor;
  final bool hasShadow;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? _buildLoadingState(context)
        : GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: borderWidth > 0
                    ? Border.all(
                        color: borderColor ?? Theme.of(context).primaryColor,
                        width: borderWidth,
                      )
                    : null,
                boxShadow: hasShadow
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: ClipOval(child: _buildImage(context)),
            ),
          );
  }

  Widget _buildImage(BuildContext context) {
    final validUrl = (imageUrl != null && imageUrl!.trim().isNotEmpty)
        ? imageUrl
        : null;

    if (validUrl == null) {
      return _buildPlaceholder(context);
    }

    return CachedNetworkImage(
      imageUrl: validUrl,
      width: radius * 2,
      height: radius * 2,
      fit: BoxFit.cover,
      fadeInDuration: const Duration(milliseconds: 300),
      placeholder: (context, url) => _buildLoadingState(context),
      errorWidget: (context, url, error) => _buildPlaceholder(context),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return _PulseSkeleton(radius: radius);
  }

  Widget _buildPlaceholder(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.person_rounded,
        size: radius * 1.2,
        color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
      ),
    );
  }
}

class _PulseSkeleton extends StatefulWidget {
  const _PulseSkeleton({required this.radius});

  final double radius;

  @override
  State<_PulseSkeleton> createState() => _PulseSkeletonState();
}

class _PulseSkeletonState extends State<_PulseSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Tạo nhịp đập 800ms cho mỗi lượt sáng/tối
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseColor = theme.colorScheme.onSurface.withValues(alpha: 0.05);
    final highlightColor = theme.colorScheme.onSurface.withValues(alpha: 0.15);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.radius * 2,
          height: widget.radius * 2,
          decoration: BoxDecoration(
            color: Color.lerp(baseColor, highlightColor, _animation.value),
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}
