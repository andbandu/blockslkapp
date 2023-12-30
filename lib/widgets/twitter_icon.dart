import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TwitterIcon extends StatelessWidget {
  final double size;

  const TwitterIcon({super.key, this.size = 24.0});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/tw.svg',
      width: size,
      height: size,
      // ignore: deprecated_member_use
      color: Colors.white,
    );
  }
}
