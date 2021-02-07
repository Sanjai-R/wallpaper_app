import 'package:flutter/material.dart';
import 'package:wallpaper_app/Modals/wallpaper_model.dart';
import 'package:wallpaper_app/Screens/image_view.dart';

Widget wallpapersList({List<WallpaperModal> wallpapers, context}) {
  return Container(
    child: GridView.count(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16),
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
            child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ImageView(imgPath: wallpaper.src.portrait,)));
          },
          child: Hero(
            tag: wallpaper.src.portrait,
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  wallpaper.src.portrait,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ));
      }).toList(),
    ),
  );
}
