import 'package:flutter/material.dart';
import 'package:wallpaper_app/Screens/categories.dart';

class CategoriesTile extends StatelessWidget {
  final String imgUrls, categorie;

  CategoriesTile({@required this.imgUrls, @required this.categorie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Categorie(categorieName: categorie.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Stack(
          children: [
            ClipRRect(
              child: Image.network(
                imgUrls,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            Container(
                height: 50,
                width: 100,
                alignment: Alignment.center,
                child: Text(
                  categorie,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
