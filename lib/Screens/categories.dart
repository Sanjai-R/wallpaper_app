import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/Modals/wallpaper_model.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/widgets/WallpaperList.dart';
import 'package:wallpaper_app/widgets/branchname.dart';
import 'package:http/http.dart' as http;

class Categorie extends StatefulWidget {
  final String categorieName;
  Categorie({Key key, this.categorieName}) : super(key: key);

  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<WallpaperModal> wallpapers = List();
  getCategorie(String categorie) async {
    var response = await http.get(
        "https://api.pexels.com/v1/search?query=$categorie&per_page=15",
        headers: {"Authorization": apiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModal wallpaperModal = WallpaperModal();
      wallpaperModal = WallpaperModal.fromMap(element);
      wallpapers.add(wallpaperModal);
    });
    setState(() {});
  }

  @override
  void initState() {
    getCategorie(widget.categorieName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: branchName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              // SearchBar
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffecf2f9),
                    borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.symmetric(horizontal: 24),
              ),
              //SearchBar
              SizedBox(
                height: 16,
              ),
              // Categories
              SizedBox(
                height: 16,
              ),
              wallpapersList(wallpapers: wallpapers, context: context)
              //Categories
            ],
          ),
        ),
      ),
    );
  }
}
