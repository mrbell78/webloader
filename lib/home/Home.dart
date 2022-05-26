import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../drawer/drawer.dart';
import '../utils/AppColors.dart';

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
    appBar: _customappbar(context),
    body: Container(

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

  _customappbar(context,) {
    return  AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.pureWhite,
      leading: IconButton(
        icon: Image.asset(
          'assets/images/ic-drawer.png',
          width: 20,
          height: 20,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DrawerCustom()),);
        },
      ),
      title: Center(
        child: Container(
          height: 106,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              SizedBox(width: 5,),
              Text("Amazan Web",style: TextStyle(color: AppColors.defaultblack,fontSize: 20,fontWeight: FontWeight.w500),),
              Spacer(),
              Image.asset("assets/images/ic-location-appbar.png"),
              SizedBox(width: 5,),

              SizedBox(width: 5,),
              SizedBox(width: 5,)
              //Image.asset('assets/menu_icon.png', width: 30, height: 30,)
            ],

          ),
        ),
      ),


    );
  }
}