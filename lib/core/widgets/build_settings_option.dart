import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_task/core/constant/constant.dart';

Widget buildSettingsRow(IconData icon, String title) {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0, bottom: 10),
    child: Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: salamonColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon),
        ),
        SizedBox(width: 25),
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
        ),
      ],
    ),
  );
}
