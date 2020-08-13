import 'package:flutter/material.dart';
import 'package:newsapp/helper/News.dart';
import 'package:newsapp/helper/data.dart';
import 'package:newsapp/model/Articles_model.dart';
import 'package:newsapp/model/Categories_model.dart';
import 'package:newsapp/widget/BlogTile.dart';
import 'package:newsapp/widget/CategoryTile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ArticlesModel> articles = new List<ArticlesModel>();
  List<CategoriesModel> category = new List<CategoriesModel>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    category = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('News For'),
            Text(
              'Today',
              style: TextStyle(color: Colors.blue),
            )
          ],
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
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // categories
                    Categories(category: category),
                    // Article
                    Articles(articles: articles)
                  ],
                ),
              ),
            ),
    );
  }
}

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
      height: 70,
      child: ListView.builder(
        itemCount: widget.category.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
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
