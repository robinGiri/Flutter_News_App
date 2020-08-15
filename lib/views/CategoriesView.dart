import 'package:flutter/material.dart';
import 'package:newsapp/helper/News.dart';
import 'package:newsapp/model/Articles_model.dart';
import 'package:newsapp/widget/BlogTile.dart';

class Categories extends StatefulWidget {
  final String category;
  Categories(this.category);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<ArticlesModel> articles = new List<ArticlesModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getCategoryNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TweenAnimationBuilder(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('News For'),
              Text(
                'Today',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(milliseconds: 500),
          builder: (BuildContext context, double _val, Widget child) {
            return Opacity(
              opacity: _val,
              child: Padding(
                  padding: EdgeInsets.only(top: _val * 20), child: child),
            );
          },
        ),
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                        child: Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BlogTile(
                                description: articles[index].description,
                                title: articles[index].title,
                                url: articles[index].url,
                                imageURL: articles[index].urlToImage);
                          }),
                    ))
                  ],
                ),
              ),
            ),
    );
  }
}
