import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double height =1;
  WebViewController? _controller;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      width: MediaQuery.of(context).size.width,
      height:height,
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller)async{
          _controller=controller;
          await controller.loadUrl("https://www.amazon.com/");
        },
        onPageFinished: (some) async {
          double h = double.parse(await _controller!.evaluateJavascript("document.documentElement.scrollHeight;"));
          setState(() {
            print("Total height ${h} and orgheight ${height}");
            this.height=h;
          });
        },
      ),
    ),
  );
    throw UnimplementedError();
  }
}