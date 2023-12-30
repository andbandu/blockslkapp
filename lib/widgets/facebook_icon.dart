import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FacebookIcon extends StatelessWidget {
  final double size;

  const FacebookIcon({super.key, this.size = 24.0});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/fb.svg',
      width: size,
      height: size,
      // ignore: deprecated_member_use
      color: Colors.white,
    );
  }
}
