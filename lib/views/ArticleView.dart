import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Articles extends StatefulWidget {
  final String imageURL;
  Articles(this.imageURL);
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
            initialUrl: widget.imageURL,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            }),
      ),
    );
  }
}
