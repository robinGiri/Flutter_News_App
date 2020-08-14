import 'package:flutter/material.dart';
import 'package:newsapp/views/ArticleView.dart';
import 'package:flutter/foundation.dart';

class BlogTile extends StatelessWidget {
  final String imageURL, title, url, description;
  BlogTile(
      {@required this.imageURL,
      @required this.title,
      @required this.url,
      @required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Articles(url)));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(imageURL)),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              description,
              style: TextStyle(color: Colors.black45),
            )
          ],
        ),
      ),
    );
  }
}
