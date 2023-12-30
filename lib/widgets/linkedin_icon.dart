import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinkedinIcon extends StatelessWidget {
  final double size;

  const LinkedinIcon({super.key, this.size = 24.0});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/ln.svg',
      width: size,
      height: size,
      // ignore: deprecated_member_use
      color: Colors.white,
    );
  }
}
