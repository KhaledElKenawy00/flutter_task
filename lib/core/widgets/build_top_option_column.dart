import 'package:flutter/material.dart';

Widget buildTopOption(IconData icon, String label) {
  return Column(
    children: [SizedBox(height: 5), Icon(icon, size: 50), Text(label)],
  );
}
