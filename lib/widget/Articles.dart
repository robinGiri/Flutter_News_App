import 'package:flutter/material.dart';
import 'package:newsapp/widget/BlogTile.dart';

class Articles extends StatefulWidget {
  final List articles;
  Articles({this.articles});
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: ListView.builder(
          itemCount: widget.articles.length,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return BlogTile(
                description: widget.articles[index].description,
                title: widget.articles[index].title,
                url: widget.articles[index].url,
                imageURL: widget.articles[index].urlToImage);
          }),
    );
  }
}
