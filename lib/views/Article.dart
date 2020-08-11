// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class Articles extends StatefulWidget {
//   final String imageURL;
//   Articles(this.imageURL);
//   @override
//   _ArticlesState createState() => _ArticlesState();
// }

// class _ArticlesState extends State<Articles> {
//   final Completer<WebViewController> _controller =
//       Completer<WebViewController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('News For'),
//               Text(
//                 'Today',
//                 style: TextStyle(color: Colors.blue),
//               )
//             ],
//           ),
//           elevation: 0.0,
//         ),
//         body: Container(
//           child: WebView(
//               initialUrl: widget.imageURL,
//               onWebViewCreated: (WebViewController webViewController) {
//                 _controller.complete(webViewController);
//               }),
//         ));
//   }
// }

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.share,
              ))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.imageURL,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
