import 'package:flutter/material.dart';
import 'package:newsapp/widget/CategoryTile.dart';

class Nations extends StatefulWidget {
  final List nations;
  Nations({this.nations});
  @override
  _NationsState createState() => _NationsState();
}

class _NationsState extends State<Nations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      child: ListView.builder(
        itemCount: widget.nations.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return CategoryTiles(
            categoryName: widget.nations[index].nationsName,
            imageUrl: widget.nations[index].nationsURL,
          );
        },
      ),
    );
  }
}
