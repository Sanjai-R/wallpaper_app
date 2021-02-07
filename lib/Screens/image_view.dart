import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageView extends StatefulWidget {
  final String imgPath;
  ImageView({@required this.imgPath});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: ImageView,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.imgPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xff1C1B1B).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white24, width: 1),
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(colors: [
                              Color(0x36FFFFFF),
                              Color(0x0FFFFFFF)
                            ])),
                        child: Center(
                          child: Text(
                            "Set Wallpaper",
                            style: GoogleFonts.montserrat(
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
