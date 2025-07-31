import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
      {Key? key,
      required this.icon,
      this.onPressed,
      this.iconSize = 28,
      this.iconColor = Colors.white})
      : super(key: key);

  final void Function()? onPressed;
  final IconData icon;
  final double iconSize;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.05),
          borderRadius: BorderRadius.circular(16)),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
