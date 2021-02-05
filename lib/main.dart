import 'package:flutter/material.dart';
import 'package:wallpaper_app/Screens/home.dart';

void main() {
  runApp(WallpaperApp());
}

class WallpaperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: Home(),
    );
  }
}
