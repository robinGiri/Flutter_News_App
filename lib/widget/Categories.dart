import 'package:flutter/material.dart';
import 'package:newsapp/widget/CategoryTile.dart';

class Categories extends StatefulWidget {
  final List category;
  Categories({this.category});
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      child: ListView.builder(
        itemCount: widget.category.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return CategoryTiles(
            categoryName: widget.category[index].categoryName,
            imageUrl: widget.category[index].categoryURL,
          );
        },
      ),
    );
  }
}
