import 'package:flutter/material.dart';
import 'package:sharexe/generated/assets/assets.gen.dart';

class HubPin extends StatelessWidget {
  const HubPin({
    super.key,
    this.isStart = false,
    this.isEnd = false,
    this.onTap,
  });

  final bool isStart;
  final bool isEnd;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: Assets.images.mapPin.svg());
  }
}
