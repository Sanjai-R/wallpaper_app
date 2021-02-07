import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/Modals/wallpaper_model.dart';
import 'package:wallpaper_app/data/categories.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/widgets/WallpaperList.dart';
import 'package:wallpaper_app/widgets/branchname.dart';
import 'package:http/http.dart' as http;

class SearchBar extends StatefulWidget {
  final String searchQuery;
  SearchBar({Key key, this.searchQuery}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<CategorieModel> categories = new List();
  List<WallpaperModal> wallpapers = List();
  TextEditingController searchEditing = TextEditingController();
  getSearchWallpapers(String query) async {
    var response = await http.get(
        "https://api.pexels.com/v1/search?query=$query&per_page=15",
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
    getSearchWallpapers(widget.searchQuery);
    searchEditing.text = widget.searchQuery;
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
                        getSearchWallpapers(searchEditing.text);
                      },
                      child: Container(child: Icon(Icons.search)))
                ]),
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
