import 'dart:ui';

import 'package:flutter/material.dart';

Widget branchName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        'Wallpaper',
        style: TextStyle(color: Colors.black),
      ),
      Text(
        'Hub',
        style: TextStyle(color: Colors.blue),
      )
    ],
  );
}
