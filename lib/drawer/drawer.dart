

import 'package:flutter/material.dart';

import '../utils/AppColors.dart';
import '../webloader/webloader.dart';

class DrawerCustom extends StatefulWidget{



  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  bool isToggled =false;

  bool isToggled_notification =false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 20),
                  height: 305,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/image-transparent-store.png",)
                      ),
                      color: AppColors.primary
                  ),

                  child: Row(

                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 116,
                            width: 116,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(100)),

                            ),


                          ),



                        ],
                      ),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("${"No User Name"}",style: TextStyle(color: AppColors.pureWhite,fontSize: 17,fontWeight: FontWeight.w500),),

                          Row(

                            children: [
                              Image.asset("assets/images/ic-location-white.png"),
                              SizedBox(width: 5,),
                              Text("${"No address"}",style: TextStyle(color: AppColors.pureWhite,fontSize: 9,),),


                            ],
                          ),
                        ],
                      ),

                    ],
                  )

              ),

              Positioned(
                right: 5,
                top:60,
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Image.asset("assets/images/ic-close-white.png"),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)

                  ),
                  color: Colors.white
              ),

              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WebLoader("https://www.youtube.com/")),);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColors.lightRedFFF1F1,
                                borderRadius: BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Image.asset("assets/images/ic-person-colored.png"),
                            ),
                            SizedBox(width: 15,),

                            Text("you tube",style: TextStyle(color: AppColors.primary,fontSize: 12,fontWeight: FontWeight.w500),),

                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left:80,right: 40),
                        child: Divider(color: AppColors.grayDBDBDB,thickness: 1,)),


                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WebLoader("https://www.prothomalo.com/")),);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColors.blueF5F8FD,
                                borderRadius: BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Image.asset("assets/images/ic-location.png"),
                            ),
                            SizedBox(width: 15,),

                            Text("Prothom alo",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left:80,right: 40),
                        child: Divider(color: AppColors.grayDBDBDB,thickness: 1,)),


                    InkWell(
                      onTap: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context) => WebLoader("https://www.thedailystar.net/")),);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColors.blueF5F8FD,
                                borderRadius: BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Image.asset("assets/images/ic-myorder.png"),
                            ),
                            SizedBox(width: 15,),

                            Text("The Daily Star",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,fontWeight: FontWeight.w500),),

                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left:80,right: 40),
                        child: Divider(color: AppColors.grayDBDBDB,thickness: 1,)),





                    SizedBox(height: 20,),




                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}