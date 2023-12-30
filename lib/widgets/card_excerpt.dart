import 'package:flutter/material.dart';

class CardExcerpt extends StatelessWidget {
  final String excerpt;

  const CardExcerpt({super.key, required this.excerpt});

  @override
  Widget build(BuildContext context) {
    return Text(
      excerpt,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 13,
        color: Color(0xFF15171a),
      ),
    );
  }
}
