// build_button.dart

import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final Color color;
  final Widget icon;
  final VoidCallback onPressed;

  const BuildButton({
    required this.color,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
