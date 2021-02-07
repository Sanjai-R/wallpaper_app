import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/Modals/wallpaper_model.dart';
import 'package:wallpaper_app/Screens/search.dart';
import 'package:wallpaper_app/data/categories.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/widgets/WallpaperList.dart';
import 'package:wallpaper_app/widgets/branchname.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/widgets/categoriestile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategorieModel> categories = new List();
  List<WallpaperModal> wallpapers = List();
  TextEditingController searchEditing = TextEditingController();
  getTrendWallpapers() async {
    var response = await http.get(
        "https://api.pexels.com/v1/curated?per_page=15",
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
    getTrendWallpapers();
    categories = getCategories();
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
                child: Row(children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchEditing,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Wallpaper',
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchBar(searchQuery: searchEditing.text,)));
                      },
                      child: Container(child: Icon(Icons.search)))
                ]),
              ),
              //SearchBar
              SizedBox(
                height: 16,
              ),
              // Categories
              Container(
                  height: 80,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoriesTile(
                            imgUrls: categories[index].imgUrl,
                            categorie: categories[index].categorieName);
                      })),
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
