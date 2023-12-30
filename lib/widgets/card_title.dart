import 'package:flutter/material.dart';

Widget cardTitle(String title) {
  return Text(title,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        wordSpacing: 10.0, // Set the desired word spacing
      ));
}
