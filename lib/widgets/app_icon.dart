import 'package:flutter/cupertino.dart';
import 'package:food_delivery/Utils/app_layout.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final double size;
  final double? iconSize;
  const AppIcon({Key? key,
    required this.icon,
    this.iconColor = const Color(0xFF756d54),
    this.bgColor = const Color(0xFFfcf4e4),
    this.size = 40,
    this.iconSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: bgColor
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize ?? AppLayout.getHeight(16),
      ),
    );
  }
}
