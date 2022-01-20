import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gallery/networks/api.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery/views/detailsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List? images;

  @override
  void initState() {
    _loadImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: images == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: images?.length,
                itemBuilder: (BuildContext context, int index) => InkWell(
                  onTap: () {
                    _nextScreen(images?[index]['urls']['regular']);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      images?[index]['urls']['regular'],
                      fit: BoxFit.cover,
                      
                    ),
                  ),
                ),
                staggeredTileBuilder: (int i) =>
                    StaggeredTile.count(2, i.isEven ? 2 : 3),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ));
  }

  _loadImages() async {
    var response = await Api().getData();
    images = jsonDecode(response.body);
    print(images);
  }
  _nextScreen(String imagePath) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsScreen(imagePath: imagePath)));
  }
}
