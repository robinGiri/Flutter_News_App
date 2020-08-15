import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/helper/News.dart';
import 'package:newsapp/helper/data.dart';
import 'package:newsapp/helper/nationdata.dart';
import 'package:newsapp/model/Articles_model.dart';
import 'package:newsapp/model/Categories_model.dart';
import 'package:newsapp/model/Nations_model.dart';
import 'package:newsapp/widget/Articles.dart';
import 'package:newsapp/widget/Categories.dart';
import 'package:newsapp/widget/Nations.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ArticlesModel> articles = new List<ArticlesModel>();
  List<CategoriesModel> category = new List<CategoriesModel>();
  List<NationsModel> nations = List<NationsModel>();
  int currentIndex = 0;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    category = getCategories();
    nations = getNations();
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

  void changePage(int index) {
    setState(() {
      currentIndex = index;
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
                    child: currentIndex == 0
                        ? Column(
                            children: [Articles(articles: articles)],
                          )
                        : currentIndex == 1
                            ? Column(
                                children: [Categories(category: category)],
                              )
                            : currentIndex == 2
                                ? Column(
                                    children: [Nations(nations: nations)],
                                  )
                                : Column(
                                    children: [NewsApi()],
                                  )),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BubbleBottomBar(
          hasNotch: true,
          fabLocation: BubbleBottomBarFabLocation.end,
          opacity: .2,
          currentIndex: currentIndex,
          onTap: changePage,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          elevation: 8,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Colors.red,
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.dashboard,
                  color: Colors.red,
                ),
                title: Text("Home")),
            BubbleBottomBarItem(
                backgroundColor: Colors.deepPurple,
                icon: Icon(
                  Icons.access_time,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.access_time,
                  color: Colors.deepPurple,
                ),
                title: Text("Categories")),
            BubbleBottomBarItem(
                backgroundColor: Colors.indigo,
                icon: Icon(
                  Icons.folder_open,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.folder_open,
                  color: Colors.indigo,
                ),
                title: Text("Country")),
            BubbleBottomBarItem(
                backgroundColor: Colors.green,
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.menu,
                  color: Colors.green,
                ),
                title: Text("Google"))
          ],
        ));
  }
}

class NewsApi extends StatefulWidget {
  final String newsapi = "https://google.com/";
  @override
  _NewsApiState createState() => _NewsApiState();
}

final Completer<WebViewController> _controller = Completer<WebViewController>();

class _NewsApiState extends State<NewsApi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: WebView(
          initialUrl: widget.newsapi,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          }),
    );
  }
}
