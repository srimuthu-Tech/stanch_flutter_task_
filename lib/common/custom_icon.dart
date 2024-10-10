import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final String icon;
  final double? height;
  final double? width;

  const CustomIcon({super.key, required this.icon, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      height: height ?? 20,
      width: width ?? 20,
    );
  }
}
