import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/categories.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/widgets/branchname.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategorieModel> categories = new List();
  @override
  void initState() {
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
      body: Container(
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Wallpaper',
                    ),
                  ),
                ),
                Icon(Icons.search)
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
                          imgUrls: categories[index].categorieName,
                          categorie: categories[index].imgUrl);
                    }))
            //Categories
          ],
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgUrls, categorie;

  CategoriesTile({@required this.imgUrls, @required this.categorie});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(child: Image.network(imgUrls)),
          Container(
            child: Text(categorie),
          )
        ],
      ),
    );
  }
}
