import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/AppColors.dart';

class WebLoader extends StatefulWidget{
  String yourfavLink;
  WebLoader(this.yourfavLink);
  @override
  State<WebLoader> createState() => _WebLoaderState();
}

class _WebLoaderState extends State<WebLoader> {

  double height =1;
  WebViewController? _controller;

  bool isLoadingh=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customappbar(context),
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(

                width: MediaQuery.of(context).size.width,
                height:height,
                child:  WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (controller)async{
                    _controller=controller;
                    await controller.loadUrl("${widget.yourfavLink}");
                  },
                  onPageFinished: (some) async {
                    double h = double.parse(await _controller!.evaluateJavascript("document.documentElement.scrollHeight;"));
                    setState(() {
                      print("Total height ${h} and orgheight ${height}");
                      height=h;
                      isLoadingh=true;
                    });
                  },

                )
            ),
            isLoadingh==false?Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Center(child: CircularProgressIndicator()),

            ],):SizedBox(),
            isLoadingh==false?Text("Please Wait"):SizedBox()
          ],
        ),
      )
    );
  }


  _customappbar(context,) {
    return  AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.pureWhite,
      leading: IconButton(
        icon: Image.asset(
          'assets/images/ic-back-appbar.png',
          width: 20,
          height: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
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